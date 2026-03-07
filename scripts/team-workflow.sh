#!/bin/bash
#===============================================================================
# Scrum Team Workflow Automation
# 
# Each team member can update their tasks with comments and move cards
# through the workflow automatically.
#
# Usage:
#   ./scripts/team-workflow.sh <role> <action> <issue-number> [message]
#
# Roles: engine, pilot, rocky, pretty, boss
# Actions: start, review, qa, done, comment
#===============================================================================

REPO="openclawruby/pacman"
REPO_OWNER="openclawruby"
TOKEN="${GITHUB_TOKEN:-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}"

# Team member signatures
declare -A TEAM_SIGNATURES
TEAM_SIGNATURES[engine]="🛠️ Engine"
TEAM_SIGNATURES[pilot]="✈️ Pilot"
TEAM_SIGNATURES[rocky]="🪨 Rocky"
TEAM_SIGNATURES[pretty]="💫 Pretty"
TEAM_SIGNATURES[boss]="👑 Boss"

# Column mappings
declare -A COLUMNS
COLUMNS[start]="🔨 IN PROGRESS"
COLUMNS[review]="👀 IN REVIEW"
COLUMNS[qa]="👀 IN REVIEW"
COLUMNS[done]="✅ DONE"
COLUMNS[todo]="📋 TODO"

# Status option IDs (will be fetched dynamically)
PROJECT_ID=""
STATUS_FIELD_ID=""
OPTION_IDS=()

#===============================================================================
# Helper Functions
#===============================================================================

log() {
    echo "$1"
}

get_project_info() {
    # Get Project ID
    local project_response=$(curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"query": "query { user(login: \"openclawruby\") { projectsV2(first: 10) { nodes { id } } } }"}')
    
    PROJECT_ID=$(echo "$project_response" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['data']['user']['projectsV2']['nodes'][0]['id'])" 2>/dev/null)
    
    # Get Status field and option IDs
    local fields_response=$(curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{
            \"query\": \"query { node(id: \\\"$PROJECT_ID\\\") { ... on ProjectV2 { fields(first: 20) { nodes { ... on ProjectV2SingleSelectField { id name options { id name } } } } } } }\"
        }")
    
    STATUS_FIELD_ID=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); print([x['id'] for x in f if x.get('name')=='Status'][0])" 2>/dev/null)
    
    # Get option IDs
    OPTION_IDS[todo]=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'TODO' in o.get('name','').upper()][0])" 2>/dev/null)
    OPTION_IDS[in_progress]=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'PROGRESS' in o.get('name','').upper()][0])" 2>/dev/null)
    OPTION_IDS[in_review]=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'REVIEW' in o.get('name','').upper()][0])" 2>/dev/null)
    OPTION_IDS[done]=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'DONE' in o.get('name','').upper()][0])" 2>/dev/null)
}

get_item_id() {
    local issue_num="$1"
    local node_id=$(curl -s -H "Authorization: token $TOKEN" \
        "https://api.github.com/repos/$REPO/issues/$issue_num" | \
        python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('node_id',''))" 2>/dev/null)
    
    local add_response=$(curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"query\": \"mutation { addProjectV2ItemById(input: {projectId: \\\"$PROJECT_ID\\\", contentId: \\\"$node_id\\\"}) { item { id } } }\"}" 2>/dev/null)
    
    echo "$add_response" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('data',{}).get('addProjectV2ItemById',{}).get('item',{}).get('id',''))" 2>/dev/null
}

move_card() {
    local item_id="$1"
    local status="$2"
    local option_id="${OPTION_IDS[$status]}"
    
    if [ -n "$option_id" ]; then
        curl -s -X POST "https://api.github.com/graphql" \
            -H "Authorization: bearer $TOKEN" \
            -H "Content-Type: application/json" \
            -d "{\"query\": \"mutation { updateProjectV2ItemFieldValue(input: {projectId: \\\"$PROJECT_ID\\\", itemId: \\\"$item_id\\\", fieldId: \\\"$STATUS_FIELD_ID\\\", value: {singleSelectOptionId: \\\"$option_id\\\"}}) { projectV2Item { id } } }\"}" > /dev/null
    fi
}

add_comment() {
    local issue_num="$1"
    local message="$2"
    
    curl -s -X POST "https://api.github.com/repos/$REPO/issues/$issue_num/comments" \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Content-Type: application/json" \
        -d "{\"body\": \"$message\"}" > /dev/null
}

#===============================================================================
# Team Member Actions
#===============================================================================

action_start() {
    local role="$1"
    local issue_num="$2"
    local signature="${TEAM_SIGNATURES[$role]}"
    
    log ""
    log "🚀 $signature starting Issue #$issue_num..."
    
    # Add comment
    add_comment "$issue_num" "## 🚀 Starting Work

**Status:** In Progress
**Assigned:** $signature
**Started:** $(date -u '+%Y-%m-%d %H:%M UTC')

Working on implementation now..."
    
    # Move card to IN PROGRESS
    local item_id=$(get_item_id "$issue_num")
    move_card "$item_id" "in_progress"
    
    log "✅ Issue #$issue_num moved to IN PROGRESS"
    log ""
}

action_review() {
    local role="$1"
    local issue_num="$2"
    local message="$3"
    local signature="${TEAM_SIGNATURES[$role]}"
    
    log ""
    log "📝 $signature reviewing Issue #$issue_num..."
    
    # Add comment
    add_comment "$issue_num" "## 📝 Code Review

**Reviewer:** $signature
**Date:** $(date -u '+%Y-%m-%d %H:%M UTC')

$message

**Status:** Review Complete ✅"
    
    # Move card to IN REVIEW (if not already)
    local item_id=$(get_item_id "$issue_num")
    move_card "$item_id" "in_review"
    
    log "✅ Issue #$issue_num review comment added"
    log ""
}

action_qa() {
    local role="$1"
    local issue_num="$2"
    local message="$3"
    local signature="${TEAM_SIGNATURES[$role]}"
    
    log ""
    log "🧪 $signature testing Issue #$issue_num..."
    
    # Add comment
    add_comment "$issue_num" "## 🧪 QA Test Complete

**Tester:** $signature
**Date:** $(date -u '+%Y-%m-%d %H:%M UTC')

$message

**Status:** QA Approved ✅"
    
    # Keep in IN REVIEW or move to DONE
    local item_id=$(get_item_id "$issue_num")
    move_card "$item_id" "in_review"
    
    log "✅ Issue #$issue_num QA comment added"
    log ""
}

action_done() {
    local role="$1"
    local issue_num="$2"
    local message="$3"
    local signature="${TEAM_SIGNATURES[$role]}"
    
    log ""
    log "✅ $signature completing Issue #$issue_num..."
    
    # Add comment
    add_comment "$issue_num" "## ✅ COMPLETE

**Completed by:** $signature
**Date:** $(date -u '+%Y-%m-%d %H:%M UTC')

$message

**Status:** DONE 🎉"
    
    # Move card to DONE
    local item_id=$(get_item_id "$issue_num")
    move_card "$item_id" "done"
    
    log "✅ Issue #$issue_num moved to DONE"
    log ""
}

action_comment() {
    local role="$1"
    local issue_num="$2"
    local message="$3"
    local signature="${TEAM_SIGNATURES[$role]}"
    
    log ""
    log "💬 $signature commenting on Issue #$issue_num..."
    
    # Add comment
    add_comment "$issue_num" "## 💬 Update

**From:** $signature
**Date:** $(date -u '+%Y-%m-%d %H:%M UTC')

$message"
    
    log "✅ Comment added to Issue #$issue_num"
    log ""
}

#===============================================================================
# Main
#===============================================================================

if [ $# -lt 3 ]; then
    echo "Usage: $0 <role> <action> <issue-number> [message]"
    echo ""
    echo "Roles: engine, pilot, rocky, pretty, boss"
    echo "Actions: start, review, qa, done, comment"
    echo ""
    echo "Examples:"
    echo "  $0 engine start 17"
    echo "  $0 pilot review 17 'Code looks good, approved!'"
    echo "  $0 rocky qa 17 'All tests pass'"
    echo "  $0 boss done 17 'Sprint 4 complete!'"
    echo "  $0 engine comment 17 'Fixed bug in collision detection'"
    exit 1
fi

ROLE="$1"
ACTION="$2"
ISSUE_NUM="$3"
MESSAGE="${4:-}"

# Initialize project info
get_project_info

case "$ACTION" in
    start)
        action_start "$ROLE" "$ISSUE_NUM"
        ;;
    review)
        action_review "$ROLE" "$ISSUE_NUM" "$MESSAGE"
        ;;
    qa)
        action_qa "$ROLE" "$ISSUE_NUM" "$MESSAGE"
        ;;
    done)
        action_done "$ROLE" "$ISSUE_NUM" "$MESSAGE"
        ;;
    comment)
        action_comment "$ROLE" "$ISSUE_NUM" "$MESSAGE"
        ;;
    *)
        echo "Unknown action: $ACTION"
        exit 1
        ;;
esac

echo "✅ Workflow action complete!"
echo "View issue: https://github.com/$REPO/issues/$ISSUE_NUM"
echo "View board: https://github.com/users/$REPO_OWNER/projects/1"
