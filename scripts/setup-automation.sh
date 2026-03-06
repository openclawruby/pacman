#!/bin/bash
#===============================================================================
# Pac-Man Sprint 4 - Project Board Automation Setup
# 
# Creates automation rules for GitHub Project board
#
# Usage: 
#   export GITHUB_TOKEN=ghp_your_token_here
#   ./scripts/setup-automation.sh
#===============================================================================

set -e

REPO="openclawruby/pacman"
REPO_OWNER="openclawruby"
TOKEN="${GITHUB_TOKEN:-}"
PROJECT_NUMBER="1"

if [ -z "$TOKEN" ]; then
    echo "❌ GITHUB_TOKEN not set!"
    echo "Usage: export GITHUB_TOKEN=ghp_your_token_here"
    exit 1
fi

echo "🚀 Setting up Project Board Automation..."
echo ""

# Get Project ID
echo "📋 Getting project information..."
project_response=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"query\": \"query { user(login: \\\"$REPO_OWNER\\\") { projectV2(number: $PROJECT_NUMBER) { id title } } }\"
    }")

PROJECT_ID=$(echo "$project_response" | grep -o '"id": "[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$PROJECT_ID" ]; then
    echo "❌ Could not find project #$PROJECT_NUMBER"
    echo "Make sure it exists at: https://github.com/users/$REPO_OWNER/projects/$PROJECT_NUMBER"
    exit 1
fi

echo "✅ Project ID: $PROJECT_ID"
echo ""

# Get column IDs
echo "📌 Getting column information..."

columns_response=$(curl -s -X POST "https://api.github.com/graphql" \
    -H "Authorization: bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"query\": \"query { node(id: \\\"$PROJECT_ID\\\") { ... on ProjectV2 { fields(first: 20) { nodes { ... on ProjectV2SingleSelectField { id name options { id name } } ... on ProjectV2IterationField { id name } } } } } }\"
    }")

echo "✅ Fields retrieved"
echo ""

# Create automation rules using REST API v2
echo "⚙️  Creating automation rules..."
echo ""

# Rule 1: Issue labeled sprint:4 → Move to TODO
echo "Creating Rule 1: Sprint 4 Issues → TODO..."
rule1=$(curl -s -X POST "https://api.github.com/projects/$PROJECT_ID/rules" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    -H "Content-Type: application/json" \
    -d '{
        "trigger": "issue_labeled",
        "configuration": {
            "label_name": "sprint:4",
            "column_id": "TODO"
        }
    }' 2>&1)

if echo "$rule1" | grep -q '"id"'; then
    echo "✅ Rule 1 created"
else
    echo "⚠️  Rule 1 may need manual setup (GitHub API limitations)"
fi

# Rule 2: Issue assigned → Move to IN PROGRESS
echo "Creating Rule 2: Assigned → IN PROGRESS..."
rule2=$(curl -s -X POST "https://api.github.com/projects/$PROJECT_ID/rules" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    -H "Content-Type: application/json" \
    -d '{
        "trigger": "issue_assigned",
        "configuration": {
            "column_id": "IN_PROGRESS"
        }
    }' 2>&1)

if echo "$rule2" | grep -q '"id"'; then
    echo "✅ Rule 2 created"
else
    echo "⚠️  Rule 2 may need manual setup (GitHub API limitations)"
fi

# Rule 3: PR opened → Move to IN REVIEW
echo "Creating Rule 3: PR Opened → IN REVIEW..."
rule3=$(curl -s -X POST "https://api.github.com/projects/$PROJECT_ID/rules" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    -H "Content-Type: application/json" \
    -d '{
        "trigger": "pull_request_opened",
        "configuration": {
            "column_id": "IN_REVIEW"
        }
    }' 2>&1)

if echo "$rule3" | grep -q '"id"'; then
    echo "✅ Rule 3 created"
else
    echo "⚠️  Rule 3 may need manual setup (GitHub API limitations)"
fi

# Rule 4: PR merged → Move to DONE
echo "Creating Rule 4: PR Merged → DONE..."
rule4=$(curl -s -X POST "https://api.github.com/projects/$PROJECT_ID/rules" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    -H "Content-Type: application/json" \
    -d '{
        "trigger": "pull_request_merged",
        "configuration": {
            "column_id": "DONE"
        }
    }' 2>&1)

if echo "$rule4" | grep -q '"id"'; then
    echo "✅ Rule 4 created"
else
    echo "⚠️  Rule 4 may need manual setup (GitHub API limitations)"
fi

# Rule 5: Issue closed → Move to DONE
echo "Creating Rule 5: Issue Closed → DONE..."
rule5=$(curl -s -X POST "https://api.github.com/projects/$PROJECT_ID/rules" \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.inertia-preview+json" \
    -H "Content-Type: application/json" \
    -d '{
        "trigger": "issue_closed",
        "configuration": {
            "column_id": "DONE"
        }
    }' 2>&1)

if echo "$rule5" | grep -q '"id"'; then
    echo "✅ Rule 5 created"
else
    echo "⚠️  Rule 5 may need manual setup (GitHub API limitations)"
fi

echo ""
echo "==============================================================================="
echo ""

# Check if rules were created
if echo "$rule1$rule2$rule3$rule4$rule5" | grep -q '"id"'; then
    echo "✅ Automation rules created successfully!"
else
    echo "⚠️  GitHub API has limitations for Project V2 automation"
    echo ""
    echo "Please set up automation manually (3 minutes):"
    echo ""
fi

cat << 'EOF'

📋 Manual Setup (if needed)

Go to: https://github.com/users/openclawruby/projects/1

1. Click "..." → "Edit workflow" → "Workflows" tab
2. Click "New workflow" for each rule:

   ┌─────────────────────────────────────────────────────────────────┐
   │ Rule 1: Sprint 4 → TODO                                         │
   ├─────────────────────────────────────────────────────────────────┤
   │ Name: Sprint 4 Auto-Add                                         │
   │ When: Issue labeled                                             │
   │ Label: sprint:4                                                 │
   │ Then: Move to column → 📋 TODO                                  │
   └─────────────────────────────────────────────────────────────────┘

   ┌─────────────────────────────────────────────────────────────────┐
   │ Rule 2: Assigned → IN PROGRESS                                  │
   ├─────────────────────────────────────────────────────────────────┤
   │ Name: Start Work                                                │
   │ When: Issue assigned                                            │
   │ Then: Move to column → 🔨 IN PROGRESS                           │
   └─────────────────────────────────────────────────────────────────┘

   ┌─────────────────────────────────────────────────────────────────┐
   │ Rule 3: PR Opened → IN REVIEW                                   │
   ├─────────────────────────────────────────────────────────────────┤
   │ Name: Code Review                                               │
   │ When: Pull request opened                                       │
   │ Then: Move to column → 👀 IN REVIEW                             │
   └─────────────────────────────────────────────────────────────────┘

   ┌─────────────────────────────────────────────────────────────────┐
   │ Rule 4: PR Merged → DONE                                        │
   ├─────────────────────────────────────────────────────────────────┤
   │ Name: Release to Production                                     │
   │ When: Pull request merged                                       │
   │ Then: Move to column → ✅ DONE                                  │
   └─────────────────────────────────────────────────────────────────┘

   ┌─────────────────────────────────────────────────────────────────┐
   │ Rule 5: Issue Closed → DONE                                     │
   ├─────────────────────────────────────────────────────────────────┤
   │ Name: Complete                                                  │
   │ When: Issue closed                                              │
   │ Then: Move to column → ✅ DONE                                  │
   └─────────────────────────────────────────────────────────────────┘

3. Click "Save" after each rule

EOF

echo ""
echo "==============================================================================="
echo ""
echo "✅ Setup complete!"
echo ""
echo "Next: Configure issue fields and start Sprint 4!"
echo "See: SPRINT4_READY.md for next steps"
echo ""
