#!/bin/bash
# Sprint 6 Auto-Start (Improved Process)

REPO="openclawruby/pacman"
REPO_OWNER="openclawruby"
TOKEN="${GITHUB_TOKEN:-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}"

echo ""
echo "==============================================================================="
echo " 🚀 Sprint 6 Auto-Start! (Improved Process)"
echo "==============================================================================="
echo ""
echo "📋 Sprint 6 Parameters:"
echo "   • Duration: 1 week (7 days)"
echo "   • Velocity: 40 story points"
echo "   • Buffer: 20% (8 points)"
echo "   • User Testing: 2 days before release"
echo "   • Sprint Goal: Advanced Features + User Feedback"
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
echo ""

# Sprint 6 issues
echo "📋 Moving Sprint 6 issues to TODO..."
echo ""

ISSUES=(33 34 35 37 39 40 41 42)
TITLES=(
    "Multiplayer Mode 🎮"
    "Power-Up System ⚡"
    "Feedback Form 📊"
    "Performance Optimization ⚡"
    "QA Test Plan 🧪"
    "User Testing 👥"
    "Code Review 📝"
    "Release v2.2 🚀"
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

# Move Issue #33 to IN PROGRESS
echo "🔨 Moving Issue #33 (Multiplayer Mode) to IN PROGRESS..."
echo ""

issue_33_node_id=$(curl -s -H "Authorization: token $TOKEN" \
    "https://api.github.com/repos/$REPO/issues/33" | \
    python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('node_id',''))" 2>/dev/null)

add_33_response=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"query\": \"mutation { addProjectV2ItemById(input: {projectId: \\\"$PROJECT_ID\\\", contentId: \\\"$issue_33_node_id\\\"}) { item { id } } }\"
    }")

item_33_id=$(echo "$add_33_response" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('data',{}).get('addProjectV2ItemById',{}).get('item',{}).get('id',''))" 2>/dev/null)

if [ -n "$item_33_id" ] && [ -n "$STATUS_FIELD_ID" ] && [ -n "$IN_PROGRESS_ID" ]; then
    curl -s -X POST "https://api.github.com/graphql" \
        -H "Authorization: bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{
            \"query\": \"mutation { updateProjectV2ItemFieldValue(input: {projectId: \\\"$PROJECT_ID\\\", itemId: \\\"$item_33_id\\\", fieldId: \\\"$STATUS_FIELD_ID\\\", value: {singleSelectOptionId: \\\"$IN_PROGRESS_ID\\\"}}) { projectV2Item { id } } }\"
        }" > /dev/null
    echo "✅ Issue #33 moved to: In Progress"
fi

echo ""
echo "==============================================================================="
echo ""
echo "✅ Sprint 6 Started!"
echo ""
echo "📊 Summary:"
echo "   • 8 issues moved to TODO"
echo "   • Issue #33 (Multiplayer) moved to IN PROGRESS"
echo "   • Sprint duration: 1 week (7 days)"
echo "   • Target velocity: 40 story points"
echo ""
echo "📅 Sprint 6 Timeline:"
echo "   • Day 1: Sprint Start (today)"
echo "   • Day 2-4: Development"
echo "   • Day 5: QA Testing"
echo "   • Day 6: User Testing (10+ players)"
echo "   • Day 7: Release + Retrospective"
echo ""
echo "🎯 Sprint Goal: Advanced Features + User Feedback"
echo "📋 View Board: https://github.com/users/openclawruby/projects/1"
echo ""
echo "==============================================================================="
echo ""
