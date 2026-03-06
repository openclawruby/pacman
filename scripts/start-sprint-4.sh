#!/bin/bash
#===============================================================================
# Pac-Man Sprint 4 - Start Sprint!
# 
# Labels all Sprint 4 issues and assigns them to team
#
# Usage: ./scripts/start-sprint-4.sh
#===============================================================================

set -e

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"

echo ""
echo "==============================================================================="
echo " 👑 Boss Starting Sprint 4!"
echo "==============================================================================="
echo ""

# Sprint 4 issues to update
declare -A issues
issues["17"]="🛠️ Engine"  # Add Ghost AI
issues["18"]="🛠️ Engine"  # Add Multiple Levels
issues["19"]="🛠️ Engine"  # Start/Game Over Screens
issues["20"]="🪨 Rocky"   # QA Test Plan
issues["21"]="✈️ Pilot"   # Code Review
issues["22"]="👑 Boss"    # Sprint 4 Release

echo "📋 Updating Sprint 4 issues..."
echo ""

for issue_num in "${!issues[@]}"; do
    assignee="${issues[$issue_num]}"
    
    echo "Issue #$issue_num"
    
    # Add comment to mark sprint start
    comment=$(curl -s -X POST "https://api.github.com/repos/$REPO/issues/$issue_num/comments" \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Content-Type: application/json" \
        -d "{\"body\": \"## 🚀 Sprint 4 Started!\\n\\n**Status:** Ready to start\\n**Assignee:** $assignee\\n**Sprint Goal:** Deliver v2.0 with Ghost AI, Levels, and UI Polish\\n\\nMove from BACKLOG → TODO → IN PROGRESS to begin!\"}")
    
    if echo "$comment" | grep -q '"id"'; then
        echo "  ✅ Comment added"
    fi
    
    echo ""
done

echo "==============================================================================="
echo ""
echo "✅ Sprint 4 Started!"
echo ""
echo "📊 Issues Updated:"
for issue_num in "${!issues[@]}"; do
    echo "   • #$issue_num → ${issues[$issue_num]}"
done
echo ""
echo "🎯 Next Steps:"
echo "   1. Go to: https://github.com/users/openclawruby/projects/1"
echo "   2. Drag all 6 issues from BACKLOG → 📋 TODO"
echo "   3. Drag Issue #17 (Add Ghost AI) to 🔨 IN PROGRESS"
echo "   4. 🛠️ Engine: Start coding!"
echo ""
echo "==============================================================================="
echo ""
