#!/bin/bash
# Sprint 4 Project Board Setup Script
# Creates all issues with proper labels, assignments, and metadata

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-}"

if [ -z "$TOKEN" ]; then
    echo "❌ GITHUB_TOKEN not set!"
    echo ""
    echo "Usage:"
    echo "  export GITHUB_TOKEN=ghp_your_token_here"
    echo "  ./scripts/setup-sprint-4.sh"
    exit 1
fi

echo "🚀 Setting up Sprint 4 Project Board..."
echo "Repository: $REPO"
echo ""

# Function to create an issue with all metadata
create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"
    local assignee="$4"
    
    echo "Creating: $title"
    
    response=$(curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
        -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d "{
            \"title\": \"$title\",
            \"body\": \"$body\",
            \"labels\": [$labels],
            \"assignees\": [\"$assignee\"]
        }")
    
    if echo "$response" | grep -q '"number"'; then
        issue_num=$(echo "$response" | grep -o '"number": [0-9]*' | cut -d':' -f2 | tr -d ' ')
        issue_url=$(echo "$response" | grep -o '"html_url": "[^"]*"' | cut -d'"' -f4)
        echo "✅ Created #$issue_num: $issue_url"
        echo ""
    else
        echo "❌ Failed: $response"
        echo ""
    fi
}

# Issue 1: Ghost AI
create_issue \
    "Add Ghost AI 🎮" \
    "## User Story
As a player, I want ghost enemies that chase me through the maze so that the game has challenge and excitement.

## Acceptance Criteria
- [ ] 4 ghosts with distinct behaviors (Blinky, Pinky, Inky, Clyde)
- [ ] Ghosts move through the maze autonomously
- [ ] Ghosts can collide with Pac-Man (end game or lose life)
- [ ] Ghosts are affected by power pellets (turn blue, can be eaten)
- [ ] Ghosts respawn after being eaten
- [ ] Smooth movement animation

## Technical Notes
**Ghost Personalities:**
1. **Blinky (Red)** - Direct chase
2. **Pinky (Pink)** - Ambush, 4 tiles ahead
3. **Inky (Cyan)** - Unpredictable, vector-based
4. **Clyde (Orange)** - Random/scatter

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky
- [ ] Merged to develop branch" \
    "\"feature\", \"game-mechanic\", \"priority:high\", \"sprint:4\"" \
    "openclawruby"

# Issue 2: Multiple Levels
create_issue \
    "Add Multiple Levels 🎯" \
    "## User Story
As a player, I want to progress through multiple levels with increasing difficulty so that the game stays challenging.

## Acceptance Criteria
- [ ] Detect when all dots are consumed
- [ ] Show \"Level Complete\" message
- [ ] Load next level after brief delay
- [ ] Increase difficulty per level
- [ ] Display current level on screen
- [ ] Persist high score across levels

## Technical Notes
**Level Progression:**
- Level 1: 1 ghost, slow
- Level 2: 2 ghosts, normal
- Level 3: 3 ghosts, faster
- Level 4+: 4 ghosts, max speed

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky" \
    "\"feature\", \"game-mechanic\", \"priority:high\", \"sprint:4\"" \
    "openclawruby"

# Issue 3: UI Polish
create_issue \
    "Add Start Screen & Game Over Screen 🎬" \
    "## User Story
As a player, I want proper start and game over screens so that the game feels polished and professional.

## Acceptance Criteria
- [ ] Start screen with title and \"Press Start\" button
- [ ] Game over screen with final score
- [ ] \"Play Again\" button on game over
- [ ] High score display on start screen
- [ ] Sound effects for start/game over

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky
- [ ] Mobile tested" \
    "\"enhancement\", \"ui\", \"priority:medium\", \"sprint:4\"" \
    "openclawruby"

# Issue 4: QA Test Plan
create_issue \
    "QA Test Plan - Ghost AI 🧪" \
    "## QA Test Plan for Ghost AI

### Test Cases
**TC1: Ghost Movement**
- [ ] Ghosts move without getting stuck
- [ ] Ghosts don't pass through walls
- [ ] Movement is smooth

**TC2: Ghost Personalities**
- [ ] Blinky chases directly
- [ ] Pinky ambushes ahead
- [ ] Inky is unpredictable
- [ ] Clyde scatters when close

**TC3: Power Pellets**
- [ ] Ghosts turn blue
- [ ] Pac-Man can eat ghosts
- [ ] Ghosts respawn
- [ ] Power mode lasts 10s

### Devices
- [ ] Desktop Chrome
- [ ] Desktop Firefox
- [ ] Mobile iOS
- [ ] Mobile Android

### Sign-off
- [ ] All tests pass
- [ ] Ready for production
- [ ] QA approved by 🪨 Rocky" \
    "\"testing\", \"qa\", \"priority:high\", \"sprint:4\"" \
    "openclawruby"

# Issue 5: Code Review
create_issue \
    "Code Review Checklist - Sprint 4 📝" \
    "## Code Review Checklist

### Ghost AI
- [ ] Code is clean and readable
- [ ] Ghost AI is performant
- [ ] No memory leaks
- [ ] Error handling in place

### Multiple Levels
- [ ] Level progression logic sound
- [ ] Difficulty scaling balanced
- [ ] High score persists

### UI Polish
- [ ] Start button works on all devices
- [ ] Game over screen correct
- [ ] Sound effects work

### Review Sign-off
- [ ] All PRs reviewed
- [ ] Comments addressed
- [ ] Approved for merge
- [ ] Reviewed by ✈️ Pilot" \
    "\"code-review\", \"priority:high\", \"sprint:4\"" \
    "openclawruby"

# Issue 6: Release
create_issue \
    "Sprint 4 Release v2.0 🚀" \
    "## Release Checklist - v2.0.0

### Pre-Release (👑 Boss)
- [ ] All sprint stories in DONE
- [ ] No critical bugs open
- [ ] QA sign-off complete
- [ ] Code review complete
- [ ] Documentation updated

### Release Steps (🛠️ Engine)
- [ ] Merge develop to main
- [ ] Create tag: v2.0.0
- [ ] CI/CD deploys to Pages
- [ ] Verify production

### Release Notes (💫 Pretty)
- [ ] Draft release notes
- [ ] Include team credits
- [ ] Publish to Releases

**Version:** v2.0.0
**Name:** Ghost AI Update
**Team:** 🛠️ Engine, ✈️ Pilot, 🪨 Rocky, 💫 Pretty, 👑 Boss" \
    "\"release\", \"priority:high\", \"sprint:4\"" \
    "openclawruby"

echo "================================"
echo "✅ Sprint 4 setup complete!"
echo "================================"
echo ""
echo "Next steps:"
echo "1. Go to: https://github.com/$REPO/issues"
echo "2. Create Project board: https://github.com/users/openclawruby/projects"
echo "3. Link repo to project (issues auto-import)"
echo "4. Configure columns and automation (see PROJECT_BOARD_SETUP.md)"
echo ""
echo "Documentation:"
echo "- SCRUM_WORKFLOW.md - Full team workflow"
echo "- TEAM_ROLES.md - Role responsibilities"
echo "- PROJECT_BOARD_SETUP.md - Board setup guide"
