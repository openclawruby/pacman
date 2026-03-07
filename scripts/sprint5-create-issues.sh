#!/bin/bash
#===============================================================================
# Sprint 5 - Create All Issues
#
# Creates 10 Sprint 5 issues with proper labels and descriptions
#
# Usage: export GITHUB_TOKEN=ghp_... && ./scripts/sprint5-create-issues.sh
#===============================================================================

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"

echo "🚀 Creating Sprint 5 Issues..."
echo "Repository: $REPO"
echo ""

create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    
    response=$(curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -H "Content-Type: application/json" \
        -d "{\"title\": \"$title\", \"body\": \"$body\", \"labels\": $labels}")
    
    if echo "$response" | grep -q '"number"'; then
        issue_num=$(echo "$response" | grep -o '"number": [0-9]*' | cut -d':' -f2 | tr -d ' ')
        echo "✅ Created #$issue_num: $title"
    else
        echo "❌ Failed: $title"
    fi
}

# Issue #23: Tunnel Pass-Through
create_issue \
    "Maze Tunnel Pass-Through (Left/Right) 🚇" \
    "## User Story
As a player, I want to pass through the tunnel on left/right sides of the maze so that I can escape ghosts strategically.

## Acceptance Criteria
- [ ] Left edge of maze connects to right edge
- [ ] Right edge of maze connects to left edge
- [ ] Pac-Man can pass through
- [ ] Ghosts can pass through
- [ ] Works on all levels

## Technical Notes
- Wrap-around logic for x-coordinate
- Handle edge cases (when partially through tunnel)
- Ghost AI should use tunnel strategically

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["feature", "game-mechanic", "priority:high", "sprint:5"]'

# Issue #24: UX Smoothness
create_issue \
    "UX Smoothness Improvements ⚡" \
    "## User Story
As a player, I want smooth, responsive controls so that the game feels polished and professional.

## Acceptance Criteria
- [ ] No input lag on direction changes
- [ ] Smooth Pac-Man animation (60 FPS target)
- [ ] Ghost movement is fluid (not jerky)
- [ ] No stuttering during gameplay
- [ ] Mobile touch response <100ms
- [ ] No frame drops during power pellet mode

## Technical Notes
- Optimize game loop timing
- Smooth interpolation for ghost movement
- Reduce DOM manipulation
- RequestAnimationFrame for rendering

## QA Focus
- 🪨 Rocky to test FPS on multiple devices
- Performance benchmarks required

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky (FPS tests)" \
    '["enhancement", "ux", "priority:high", "sprint:5"]'

# Issue #25: Countdown Timer
create_issue \
    "5-Second Game Start Countdown ⏱️" \
    "## User Story
As a player, I want a countdown timer before the game starts so that I can prepare and anticipate the action.

## Acceptance Criteria
- [ ] Show \"3... 2... 1... GO!\" overlay
- [ ] Each number displays for ~1 second
- [ ] Countdown is visible on screen
- [ ] Sound effect for each count
- [ ] Game starts after \"GO!\"
- [ ] Works on level start too

## Technical Notes
- Overlay similar to level complete screen
- Countdown animation (scale effect)
- Audio cues for each number

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["enhancement", "ui", "priority:medium", "sprint:5"]'

# Issue #26: Power Pellet Timer
create_issue \
    "Power Pellet Timer Indicator ⚡" \
    "## User Story
As a player, I want to see how much time is left on power mode so that I can strategize my ghost hunting.

## Acceptance Criteria
- [ ] Visual timer bar or countdown
- [ ] Shows remaining power mode time
- [ ] Updates in real-time
- [ ] Changes color when <3 seconds left
- [ ] Visible during gameplay

## Technical Notes
- Progress bar or numeric countdown
- Position: Top of screen or near Pac-Man
- Color change: Green → Yellow → Red

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["enhancement", "ui", "priority:medium", "sprint:5"]'

# Issue #27: Mobile Swipe Improvements
create_issue \
    "Mobile Swipe Gesture Improvements 📱" \
    "## User Story
As a mobile player, I want responsive swipe controls so that I can play comfortably on touch devices.

## Acceptance Criteria
- [ ] Swipe detection sensitivity improved
- [ ] No accidental direction changes
- [ ] Works in landscape and portrait
- [ ] Visual feedback on swipe
- [ ] Tested on iOS and Android

## Technical Notes
- Adjust swipe threshold distance
- Add visual direction indicator
- Test on multiple screen sizes

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky (mobile testing)" \
    '["enhancement", "mobile", "priority:medium", "sprint:5"]'

# Issue #28: Bonus Fruit System
create_issue \
    "Bonus Fruit System 🍒" \
    "## User Story
As a player, I want bonus fruits to appear for extra points so that the game is more exciting and rewarding.

## Acceptance Criteria
- [ ] Fruit spawns after X dots eaten
- [ ] Fruit stays for 10 seconds
- [ ] Different fruits per level (cherry, strawberry, peach, etc.)
- [ ] Points scale with fruit type (100-5000)
- [ ] Visual indicator of next fruit
- [ ] Sound effect when eaten

## Technical Notes
**Fruit Types:**
| Level | Fruit | Points |
|-------|-------|--------|
| 1 | Cherry | 100 |
| 2 | Strawberry | 300 |
| 3 | Peach | 500 |
| 4 | Apple | 700 |
| 5 | Grape | 1000 |
| 6 | Galaxian | 2000 |
| 7 | Bell | 3000 |
| 8+ | Key | 5000 |

## Definition of Done
- [ ] Code by 🛠️ Engine
- [ ] Review by ✈️ Pilot
- [ ] QA by 🪨 Rocky" \
    '["feature", "game-mechanic", "priority:medium", "sprint:5"]'

# Issue #29: QA Test Plan
create_issue \
    "QA Test Plan - Sprint 5 UX & Polish 🧪" \
    "## QA Test Plan for Sprint 5

### Test Cases

**TC1: Tunnel Pass-Through**
- [ ] Pac-Man passes through left/right edges
- [ ] Ghosts use tunnel correctly
- [ ] No collision issues in tunnel
- [ ] Works on all levels

**TC2: UX Smoothness**
- [ ] FPS monitoring (target: 60 FPS)
- [ ] Input lag testing (<50ms)
- [ ] Animation smoothness
- [ ] No frame drops

**TC3: Countdown Timer**
- [ ] 3-2-1-GO sequence displays
- [ ] Timing is accurate (~1s each)
- [ ] Sound effects play
- [ ] Game starts on GO

**TC4: Power Pellet Timer**
- [ ] Timer displays correctly
- [ ] Updates in real-time
- [ ] Color changes at <3s
- [ ] Accurate countdown

**TC5: Mobile Gestures**
- [ ] Swipe sensitivity tested
- [ ] No accidental inputs
- [ ] Works landscape/portrait
- [ ] iOS + Android tested

**TC6: Bonus Fruits**
- [ ] Fruits spawn correctly
- [ ] Timer works (10s)
- [ ] Points awarded correctly
- [ ] All fruit types appear

### Devices to Test
- [ ] Desktop Chrome/Firefox/Safari
- [ ] Mobile iOS Safari
- [ ] Mobile Android Chrome
- [ ] Tablet

### Performance Benchmarks
- [ ] 60 FPS on desktop
- [ ] 30+ FPS on mobile
- [ ] No memory leaks
- [ ] Load time <2s

### Sign-off
- [ ] All tests pass
- [ ] Performance targets met
- [ ] QA approved by 🪨 Rocky" \
    '["testing", "qa", "priority:high", "sprint:5"]'

# Issue #30: BA Requirements
create_issue \
    "BA Requirements & User Feedback 📊" \
    "## BA Tasks for Sprint 5

### User Feedback Collection
- [ ] Create feedback form/survey
- [ ] Collect feedback on v2.0 (Ghost AI)
- [ ] Gather UX pain points
- [ ] Analyze player behavior

### Sprint 6 Planning
- [ ] Prioritize backlog based on feedback
- [ ] Define success metrics for v2.1
- [ ] Document user requests
- [ ] Prepare Sprint 6 recommendations

### Success Metrics
- [ ] Define FPS targets
- [ ] Define user satisfaction score
- [ ] Track bug reports
- [ ] Monitor play session length

### Deliverables
- [ ] User feedback report
- [ ] Sprint 6 backlog priorities
- [ ] Success metrics document

**Assigned:** 💫 Pretty" \
    '["documentation", "ba", "priority:medium", "sprint:5"]'

# Issue #31: Code Review
create_issue \
    "Code Review Checklist - Sprint 5 📝" \
    "## Code Review Checklist - Sprint 5

### Tunnel Pass-Through (#23)
- [ ] Wrap-around logic correct
- [ ] Edge cases handled
- [ ] Ghost AI uses tunnel
- [ ] No boundary exploits

### UX Smoothness (#24)
- [ ] Game loop optimized
- [ ] RequestAnimationFrame used
- [ ] No unnecessary DOM updates
- [ ] Smooth interpolation

### Countdown Timer (#25)
- [ ] Timing accurate
- [ ] Overlay renders correctly
- [ ] Sound sync correct
- [ ] No blocking code

### Power Pellet Timer (#26)
- [ ] Timer accurate
- [ ] Visual updates smooth
- [ ] Color logic correct
- [ ] No performance impact

### Mobile Gestures (#27)
- [ ] Touch events optimized
- [ ] Swipe detection accurate
- [ ] No false positives
- [ ] Cross-browser tested

### Bonus Fruits (#28)
- [ ] Spawn logic correct
- [ ] Timer works properly
- [ ] Points scale correctly
- [ ] All fruit types work

### Performance Audit
- [ ] No memory leaks
- [ ] FPS targets met
- [ ] No blocking operations
- [ ] Efficient rendering

### Review Sign-off
- [ ] All PRs reviewed
- [ ] Comments addressed
- [ ] Approved by ✈️ Pilot" \
    '["code-review", "priority:high", "sprint:5"]'

# Issue #32: Sprint 5 Release
create_issue \
    "Sprint 5 Release v2.1 🚀" \
    "## Release Checklist - v2.1 UX Polish Update

### Pre-Release (👑 Boss)
- [ ] All sprint stories in DONE
- [ ] No critical bugs open
- [ ] QA sign-off complete (🪨 Rocky)
- [ ] Code review complete (✈️ Pilot)
- [ ] Documentation updated

### Release Steps (🛠️ Engine)
- [ ] Merge develop to main
- [ ] Create release tag: v2.1.0
- [ ] CI/CD deploys to GitHub Pages
- [ ] Verify production: https://openclawruby.github.io/pacman

### Release Notes (💫 Pretty)
- [ ] Draft release notes
- [ ] Include team credits
- [ ] List new features
- [ ] List bug fixes
- [ ] Publish to GitHub Releases

### Post-Release
- [ ] Monitor for bugs (24 hours)
- [ ] Collect user feedback
- [ ] Update sprint board
- [ ] Sprint retrospective scheduled
- [ ] Sprint 6 planning prepared

---

**Version:** v2.1.0
**Name:** UX Polish Update
**Date:** TBD
**Team:**
- Dev: 🛠️ Engine
- Review: ✈️ Pilot
- QA: 🪨 Rocky
- BA: 💫 Pretty
- SM: 👑 Boss" \
    '["release", "priority:high", "sprint:5"]'

echo ""
echo "================================"
echo "✅ All 10 Sprint 5 issues created!"
echo "================================"
echo ""
echo "View: https://github.com/$REPO/issues"
