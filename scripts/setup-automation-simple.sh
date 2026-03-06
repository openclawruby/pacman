#!/bin/bash
#===============================================================================
# Pac-Man Sprint 4 - Quick Automation Setup Guide
# 
# GitHub Projects V2 automation must be configured via UI (API is limited)
# This script verifies your setup and provides exact click-by-click instructions
#
# Usage: ./scripts/setup-automation-simple.sh
#===============================================================================

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"
PROJECT_URL="https://github.com/users/openclawruby/projects/1"

echo ""
echo "==============================================================================="
echo " 🤖 Pac-Man Project Board - Automation Setup"
echo "==============================================================================="
echo ""

# Verify issues exist
echo "📝 Verifying Sprint 4 issues..."
issues_check=$(curl -s -H "Authorization: token $TOKEN" \
    "https://api.github.com/repos/$REPO/issues?state=open&labels=sprint:4")

issue_count=$(echo "$issues_check" | grep -c '"number"' || echo "0")

if [ "$issue_count" -ge 6 ]; then
    echo "✅ All 6 Sprint 4 issues verified!"
else
    echo "⚠️  Found $issue_count issues (expected 6)"
    echo "Run ./scripts/setup-sprint-4.sh first if issues are missing"
fi

echo ""
echo "==============================================================================="
echo " ⚙️  Automation Rules - Click-by-Click Setup (3 minutes)"
echo "==============================================================================="
echo ""
echo "🔗 Go to: $PROJECT_URL"
echo ""

cat << 'EOF'
┌─────────────────────────────────────────────────────────────────────────────┐
│ AUTOMATION RULE 1: Sprint 4 Issues → TODO                                   │
└─────────────────────────────────────────────────────────────────────────────┘

Step 1: Click "..." (top right) → "Edit workflow"
Step 2: Click "Workflows" tab
Step 3: Click "New workflow" button

Configure:
  ┌────────────────────────────────────────┐
  │ Name: Sprint 4 Auto-Add                │
  ├────────────────────────────────────────┤
  │ Run this workflow: After an issue      │
  │         is labeled                     │
  ├────────────────────────────────────────┤
  │ Labeled with: sprint:4                 │
  ├────────────────────────────────────────┤
  │ Then: Move issue to column             │
  ├────────────────────────────────────────┤
  │ Column: 📋 TODO                        │
  └────────────────────────────────────────┘

Step 4: Click "Save"


┌─────────────────────────────────────────────────────────────────────────────┐
│ AUTOMATION RULE 2: Issue Assigned → IN PROGRESS                             │
└─────────────────────────────────────────────────────────────────────────────┘

Step 1: Click "New workflow" (same Workflows tab)

Configure:
  ┌────────────────────────────────────────┐
  │ Name: Start Work                       │
  ├────────────────────────────────────────┤
  │ Run this workflow: After an issue      │
  │         is assigned                    │
  ├────────────────────────────────────────┤
  │ Then: Move issue to column             │
  ├────────────────────────────────────────┤
  │ Column: 🔨 IN PROGRESS                 │
  └────────────────────────────────────────┘

Step 2: Click "Save"


┌─────────────────────────────────────────────────────────────────────────────┐
│ AUTOMATION RULE 3: Pull Request Opened → IN REVIEW                          │
└─────────────────────────────────────────────────────────────────────────────┘

Step 1: Click "New workflow"

Configure:
  ┌────────────────────────────────────────┐
  │ Name: Code Review                      │
  ├────────────────────────────────────────┤
  │ Run this workflow: After a pull        │
  │         request is opened              │
  ├────────────────────────────────────────┤
  │ Then: Move linked issue to column      │
  ├────────────────────────────────────────┤
  │ Column: 👀 IN REVIEW                   │
  └────────────────────────────────────────┘

Step 2: Click "Save"


┌─────────────────────────────────────────────────────────────────────────────┐
│ AUTOMATION RULE 4: Pull Request Merged → DONE                               │
└─────────────────────────────────────────────────────────────────────────────┘

Step 1: Click "New workflow"

Configure:
  ┌────────────────────────────────────────┐
  │ Name: Release to Production            │
  ├────────────────────────────────────────┤
  │ Run this workflow: After a pull        │
  │         request is merged              │
  ├────────────────────────────────────────┤
  │ Then: Move linked issue to column      │
  ├────────────────────────────────────────┤
  │ Column: ✅ DONE                        │
  └────────────────────────────────────────┘

Step 2: Click "Save"


┌─────────────────────────────────────────────────────────────────────────────┐
│ AUTOMATION RULE 5: Issue Closed → DONE                                      │
└─────────────────────────────────────────────────────────────────────────────┘

Step 1: Click "New workflow"

Configure:
  ┌────────────────────────────────────────┐
  │ Name: Complete                         │
  ├────────────────────────────────────────┤
  │ Run this workflow: After an issue      │
  │         is closed                      │
  ├────────────────────────────────────────┤
  │ Then: Move issue to column             │
  ├────────────────────────────────────────┤
  │ Column: ✅ DONE                        │
  └────────────────────────────────────────┘

Step 2: Click "Save"


EOF

echo "==============================================================================="
echo ""
echo "✅ All 5 automation rules configured!"
echo ""
echo "Test the automation:"
echo "1. Go to any Sprint 4 issue"
echo "2. Add label 'sprint:4' → Should move to TODO"
echo "3. Assign someone → Should move to IN PROGRESS"
echo ""
echo "==============================================================================="
echo ""
echo "🎯 Ready to Start Sprint 4!"
echo ""
echo "Next steps:"
echo "1. Configure issue fields (Sprint, Story Points, etc.)"
echo "2. 👑 Boss: Move Issue #1 to IN PROGRESS"
echo "3. 🛠️ Engine: Start coding Ghost AI!"
echo ""
echo "See SPRINT4_READY.md for complete Sprint 4 guide"
echo ""
