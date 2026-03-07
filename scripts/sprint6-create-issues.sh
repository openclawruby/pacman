#!/bin/bash
# Sprint 6 - Create All Issues (Improved Process)

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"

echo "🚀 Creating Sprint 6 Issues (Improved Process)..."
echo ""

create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    
    response=$(curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
        -H "Authorization: token $TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"title\": \"$title\", \"body\": \"$body\", \"labels\": $labels}")
    
    if echo "$response" | grep -q '"number"'; then
        issue_num=$(echo "$response" | grep -o '"number": [0-9]*' | cut -d':' -f2 | tr -d ' ')
        echo "✅ Created #$issue_num: $title"
    else
        echo "❌ Failed: $title"
    fi
}

# Issue 33: Multiplayer
create_issue \
    "Multiplayer Mode (Local) 🎮" \
    "## User Story
As a player, I want to play with a friend on the same device.

## Acceptance Criteria
- [ ] 2-player mode on same device
- [ ] Split-screen or turn-based
- [ ] Score tracking for both players
- [ ] Winner announcement
- [ ] Works on mobile and desktop

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["feature", "multiplayer", "priority:high", "sprint:6"]'

# Issue 34: Power-Ups
create_issue \
    "Power-Up System ⚡" \
    "## User Story
As a player, I want temporary power-ups for excitement.

## Acceptance Criteria
- [ ] 3 power-up types (speed, invincibility, extra life)
- [ ] Random spawn in maze
- [ ] Visual indicator when active
- [ ] Timer for duration
- [ ] Sound effects

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["feature", "game-mechanic", "priority:high", "sprint:6"]'

# Issue 35: Feedback Form
create_issue \
    "User Feedback Form 📊" \
    "## User Story
As a BA, I want to collect user feedback.

## Acceptance Criteria
- [ ] In-game feedback button
- [ ] Rating system (1-5 stars)
- [ ] Comment box
- [ ] Submit to form
- [ ] Anonymous option

## Definition of Done
- [ ] Code by 💫 Pretty
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["enhancement", "feedback", "priority:high", "sprint:6"]'

# Issue 37: Performance
create_issue \
    "Performance Optimization (Mobile) ⚡" \
    "## User Story
As a mobile player, I want smooth 60 FPS gameplay.

## Acceptance Criteria
- [ ] 60 FPS on modern mobile
- [ ] 30 FPS on older devices
- [ ] No frame drops
- [ ] Optimized rendering
- [ ] Reduced memory usage

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky (FPS tests)" \
    '["enhancement", "performance", "priority:high", "sprint:6"]'

# Issue 39: QA Plan
create_issue \
    "QA Test Plan - Sprint 6 🧪" \
    "## QA Test Plan

### Test Cases
- [ ] Multiplayer mode
- [ ] Power-up system
- [ ] Feedback form
- [ ] Performance (60 FPS)

### User Testing
- [ ] 10+ players
- [ ] Feedback collected
- [ ] Issues documented

**Assigned:** 🪨 Rocky" \
    '["testing", "qa", "priority:high", "sprint:6"]'

# Issue 40: User Testing
create_issue \
    "User Testing Sessions 👥" \
    "## User Story
As a QA tester, I want real user testing.

## Acceptance Criteria
- [ ] 10+ players tested
- [ ] Feedback collected
- [ ] Issues documented
- [ ] Usability score calculated
- [ ] Recommendations for Sprint 7

**Assigned:** 🪨 Rocky" \
    '["testing", "user-feedback", "priority:high", "sprint:6"]'

# Issue 41: Code Review
create_issue \
    "Code Review Checklist - Sprint 6 📝" \
    "## Code Review Checklist

### Features
- [ ] Multiplayer implementation
- [ ] Power-up system
- [ ] Feedback form
- [ ] Performance optimizations

### Quality
- [ ] No memory leaks
- [ ] 60 FPS achieved
- [ ] Efficient rendering

**Assigned:** ✈️ Pilot" \
    '["code-review", "priority:high", "sprint:6"]'

# Issue 42: Release
create_issue \
    "Sprint 6 Release v2.2 🚀" \
    "## Release Checklist - v2.2.0

### Pre-Release
- [ ] All stories in DONE
- [ ] No critical bugs
- [ ] QA sign-off
- [ ] Code review complete
- [ ] User feedback collected

### Release
- [ ] Merge to main
- [ ] Tag v2.2.0
- [ ] Deploy to Pages
- [ ] Release notes
- [ ] Retrospective scheduled

**Team:** 🛠️ Engine ✈️ Pilot 🪨 Rocky 💫 Pretty 👑 Boss" \
    '["release", "priority:high", "sprint:6"]'

echo ""
echo "✅ Sprint 6 issues created!"
echo ""
echo "📋 Sprint 6 Parameters:"
echo "   • Duration: 1 week (7 days)"
echo "   • Velocity: 40 points"
echo "   • Buffer: 20% (included)"
echo "   • User Testing: 2 days"
echo ""
