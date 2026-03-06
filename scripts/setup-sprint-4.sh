#!/bin/bash
#===============================================================================
# Pac-Man Sprint 4 - Create All Issues
# 
# Creates 6 Sprint 4 issues with proper labels and descriptions
#
# Usage: 
#   export GITHUB_TOKEN=ghp_your_token_here
#   ./scripts/setup-sprint-4.sh
#===============================================================================

set -e

REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-}"

if [ -z "$TOKEN" ]; then
    echo "❌ GITHUB_TOKEN not set!"
    echo ""
    echo "Get a token: https://github.com/settings/tokens (scope: repo)"
    echo "Then run: export GITHUB_TOKEN=ghp_your_token_here"
    exit 1
fi

echo "🚀 Creating Sprint 4 Issues..."
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
        log_success "Created #$issue_num: $title"
    else
        log_error "Failed: $title"
    fi
}

log_success() { echo "✅ $1"; }
log_error() { echo "❌ $1"; }

# Issue 1
create_issue \
    "Add Ghost AI 🎮" \
    "## User Story\nAs a player, I want ghost enemies that chase me through the maze so that the game has challenge and excitement.\n\n## Acceptance Criteria\n- [ ] 4 ghosts with distinct behaviors (Blinky, Pinky, Inky, Clyde)\n- [ ] Ghosts move autonomously\n- [ ] Collision with Pac-Man ends game\n- [ ] Power pellets make ghosts vulnerable\n- [ ] Ghosts respawn when eaten\n- [ ] Smooth animation\n\n## Technical Notes\n**Ghost Personalities:**\n1. Blinky (Red) - Direct chase\n2. Pinky (Pink) - Ambush 4 tiles ahead\n3. Inky (Cyan) - Unpredictable vector-based\n4. Clyde (Orange) - Random/scatter\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky\n- [ ] Merged to develop" \
    '["feature", "game-mechanic", "priority:high", "sprint:4"]'

# Issue 2
create_issue \
    "Add Multiple Levels 🎯" \
    "## User Story\nAs a player, I want to progress through multiple levels with increasing difficulty.\n\n## Acceptance Criteria\n- [ ] Detect when all dots consumed\n- [ ] Show Level Complete message\n- [ ] Load next level\n- [ ] Increase difficulty per level\n- [ ] Display current level\n- [ ] Persist high score\n\n## Technical Notes\n**Progression:**\n- Level 1: 1 ghost, slow\n- Level 2: 2 ghosts, normal\n- Level 3: 3 ghosts, faster\n- Level 4+: 4 ghosts, max speed\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky" \
    '["feature", "game-mechanic", "priority:high", "sprint:4"]'

# Issue 3
create_issue \
    "Add Start Screen & Game Over Screen 🎬" \
    "## User Story\nAs a player, I want proper start and game over screens for a polished experience.\n\n## Acceptance Criteria\n- [ ] Start screen with Press Start button\n- [ ] Game over screen with final score\n- [ ] Play Again button\n- [ ] High score on start screen\n- [ ] Sound effects\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky\n- [ ] Mobile tested" \
    '["enhancement", "ui", "priority:medium", "sprint:4"]'

# Issue 4
create_issue \
    "QA Test Plan - Ghost AI 🧪" \
    "## QA Test Plan\n\n### TC1: Ghost Movement\n- [ ] Ghosts move without getting stuck\n- [ ] No wall passing\n- [ ] Smooth animation\n\n### TC2: Ghost Personalities\n- [ ] Blinky chases directly\n- [ ] Pinky ambushes ahead\n- [ ] Inky unpredictable\n- [ ] Clyde scatters\n\n### TC3: Power Pellets\n- [ ] Ghosts turn blue\n- [ ] Pac-Man can eat ghosts\n- [ ] Ghosts respawn\n- [ ] 10 second duration\n\n### Devices\n- [ ] Desktop Chrome/Firefox/Safari\n- [ ] Mobile iOS/Android\n\n### Sign-off\n- [ ] All tests pass\n- [ ] QA approved by 🪨 Rocky" \
    '["testing", "qa", "priority:high", "sprint:4"]'

# Issue 5
create_issue \
    "Code Review Checklist - Sprint 4 📝" \
    "## Code Review Checklist\n\n### Ghost AI\n- [ ] Clean readable code\n- [ ] Performant (no lag)\n- [ ] No memory leaks\n- [ ] Error handling\n\n### Multiple Levels\n- [ ] Logic is sound\n- [ ] Difficulty balanced\n- [ ] High score persists\n\n### UI Polish\n- [ ] Start button works\n- [ ] Game over correct\n- [ ] Sound effects work\n\n### Review Sign-off\n- [ ] All PRs reviewed\n- [ ] Comments addressed\n- [ ] Approved by ✈️ Pilot" \
    '["code-review", "priority:high", "sprint:4"]'

# Issue 6
create_issue \
    "Sprint 4 Release v2.0 🚀" \
    "## Release Checklist - v2.0.0\n\n### Pre-Release (👑 Boss)\n- [ ] All stories in DONE\n- [ ] No critical bugs\n- [ ] QA sign-off\n- [ ] Code review complete\n- [ ] Docs updated\n\n### Release (🛠️ Engine)\n- [ ] Merge to main\n- [ ] Tag v2.0.0\n- [ ] CI/CD deploys\n- [ ] Verify production\n\n### Release Notes (💫 Pretty)\n- [ ] Draft notes\n- [ ] Team credits\n- [ ] Publish\n\n**Team:** 🛠️ Engine ✈️ Pilot 🪨 Rocky 💫 Pretty 👑 Boss" \
    '["release", "priority:high", "sprint:4"]'

echo ""
echo "================================"
echo "✅ All 6 Sprint 4 issues created!"
echo "================================"
echo ""
echo "View: https://github.com/$REPO/issues"
