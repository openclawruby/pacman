#!/bin/bash
#===============================================================================
# Sprint 5 Auto-Start
#
# Moves all Sprint 5 issues to TODO
# Moves Issue #23 (Tunnel) to IN PROGRESS
#===============================================================================

REPO="openclawruby/pacman"
REPO_OWNER="openclawruby"
TOKEN="${GITHUB_TOKEN:-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}"

echo ""
echo "==============================================================================="
echo " 🚀 Sprint 5 Auto-Start!"
echo "==============================================================================="
echo ""

# Get Project ID
PROJECT_ID=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"query": "query { user(login: \"openclawruby\") { projectsV2(first: 10) { nodes { id } } } }"}' | \
    python3 -c "import sys,json; d=json.load(sys.stdin); print(d['data']['user']['projectsV2']['nodes'][0]['id'])" 2>/dev/null)

echo "✅ Project ID: $PROJECT_ID"

# Get Status field and option IDs
fields_response=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"query\": \"query { node(id: \\\"$PROJECT_ID\\\") { ... on ProjectV2 { fields(first: 20) { nodes { ... on ProjectV2SingleSelectField { id name options { id name } } } } } } }\"
    }")

STATUS_FIELD_ID=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); print([x['id'] for x in f if x.get('name')=='Status'][0])" 2>/dev/null)
TODO_ID=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'TODO' in o.get('name','').upper()][0])" 2>/dev/null)
IN_PROGRESS_ID=$(echo "$fields_response" | python3 -c "import sys,json; d=json.load(sys.stdin); f=d.get('data',{}).get('node',{}).get('fields',{}).get('nodes',[]); s=[x for x in f if x.get('name')=='Status'][0]; print([o['id'] for o in s.get('options',[]) if 'PROGRESS' in o.get('name','').upper()][0])" 2>/dev/null)

echo "✅ Status field: $STATUS_FIELD_ID"
echo "✅ Todo option: $TODO_ID"
echo "✅ In Progress option: $IN_PROGRESS_ID"
echo ""

# Sprint 5 issues
echo "📋 Moving Sprint 5 issues to TODO..."
echo ""

ISSUES=(23 24 25 26 27 28 29 30 31 32)
TITLES=(
    "Tunnel Pass-Through 🚇"
    "UX Smoothness ⚡"
    "Countdown Timer ⏱️"
    "Power Timer ⚡"
    "Mobile Swipe 📱"
    "Bonus Fruit 🍒"
    "QA Plan 🧪"
    "BA Requirements 📊"
    "Code Review 📝"
    "Release v2.1 🚀"
)

for i in "${!ISSUES[@]}"; do
    issue_num="${ISSUES[$i]}"
    issue_title="${TITLES[$i]}"
    
    echo "Issue #$issue_num: $issue_title"
    
    node_id=$(curl -s -H "Authorization: token $TOKEN" \
        "https://api.github.com/repos/$REPO/issues/$issue_num" | \
        python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('node_id',''))" 2>/dev/null)
    
    add_response=$(curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{
            \"query\": \"mutation { addProjectV2ItemById(input: {projectId: \\\"$PROJECT_ID\\\", contentId: \\\"$node_id\\\"}) { item { id } } }\"
        }")
    
    item_id=$(echo "$add_response" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('data',{}).get('addProjectV2ItemById',{}).get('item',{}).get('id',''))" 2>/dev/null)
    
    if [ -n "$item_id" ]; then
        echo "  ✅ Added to project"
        
        if [ -n "$STATUS_FIELD_ID" ] && [ -n "$TODO_ID" ]; then
            curl -s -X POST "https://api.github.com/graphql" \
                -H "Authorization: bearer $TOKEN" \
                -H "Content-Type: application/json" \
                -d "{
                    \"query\": \"mutation { updateProjectV2ItemFieldValue(input: {projectId: \\\"$PROJECT_ID\\\", itemId: \\\"$item_id\\\", fieldId: \\\"$STATUS_FIELD_ID\\\", value: {singleSelectOptionId: \\\"$TODO_ID\\\"}}) { projectV2Item { id } } }\"
                }" > /dev/null
            echo "  ✅ Status: Todo"
        fi
    fi
    
    echo ""
done

# Move Issue #23 to IN PROGRESS
echo "🔨 Moving Issue #23 (Tunnel Pass-Through) to IN PROGRESS..."
echo ""

issue_23_node_id=$(curl -s -H "Authorization: token $TOKEN" \
    "https://api.github.com/repos/$REPO/issues/23" | \
    python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('node_id',''))" 2>/dev/null)

add_23_response=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"query\": \"mutation { addProjectV2ItemById(input: {projectId: \\\"$PROJECT_ID\\\", contentId: \\\"$issue_23_node_id\\\"}) { item { id } } }\"
    }")

item_23_id=$(echo "$add_23_response" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('data',{}).get('addProjectV2ItemById',{}).get('item',{}).get('id',''))" 2>/dev/null)

if [ -n "$item_23_id" ] && [ -n "$STATUS_FIELD_ID" ] && [ -n "$IN_PROGRESS_ID" ]; then
    curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{
            \"query\": \"mutation { updateProjectV2ItemFieldValue(input: {projectId: \\\"$PROJECT_ID\\\", itemId: \\\"$item_23_id\\\", fieldId: \\\"$STATUS_FIELD_ID\\\", value: {singleSelectOptionId: \\\"$IN_PROGRESS_ID\\\"}}) { projectV2Item { id } } }\"
        }" > /dev/null
    echo "✅ Issue #23 moved to: In Progress"
fi

echo ""
echo "==============================================================================="
echo ""
echo "✅ Sprint 5 Started!"
echo ""
echo "📊 Summary:"
echo "   • 10 issues moved to TODO"
echo "   • Issue #23 (Tunnel Pass-Through) moved to IN PROGRESS"
echo ""
echo "🎯 Sprint 5 Goal: UX Polish Update (v2.1)"
echo "📋 View Board: https://github.com/users/openclawruby/projects/1"
echo ""
echo "==============================================================================="
echo ""
