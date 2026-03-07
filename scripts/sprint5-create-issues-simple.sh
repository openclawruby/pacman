#!/bin/bash
REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"

echo "Creating Sprint 5 Issues..."

# Issue 23: Tunnel
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Maze Tunnel Pass-Through (Left/Right) 🚇","body":"## User Story\nAs a player, I want to pass through the tunnel on left/right sides.\n\n## Acceptance Criteria\n- [ ] Left edge connects to right edge\n- [ ] Pac-Man can pass through\n- [ ] Ghosts can pass through\n- [ ] Works on all levels\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky","labels":["feature","game-mechanic","priority:high","sprint:5"]}' | grep -q '"number"' && echo "✅ #23: Tunnel Pass-Through"

# Issue 24: UX Smoothness
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"UX Smoothness Improvements ⚡","body":"## User Story\nAs a player, I want smooth, responsive controls.\n\n## Acceptance Criteria\n- [ ] No input lag\n- [ ] 60 FPS target\n- [ ] Smooth animations\n- [ ] Mobile touch <100ms\n- [ ] No frame drops\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky (FPS tests)","labels":["enhancement","ux","priority:high","sprint:5"]}' | grep -q '"number"' && echo "✅ #24: UX Smoothness"

# Issue 25: Countdown
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"5-Second Game Start Countdown ⏱️","body":"## User Story\nAs a player, I want a countdown timer before game starts.\n\n## Acceptance Criteria\n- [ ] Show 3... 2... 1... GO!\n- [ ] Each number ~1 second\n- [ ] Sound effects\n- [ ] Works on level start\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky","labels":["enhancement","ui","priority:medium","sprint:5"]}' | grep -q '"number"' && echo "✅ #25: Countdown Timer"

# Issue 26: Power Timer
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Power Pellet Timer Indicator ⚡","body":"## User Story\nAs a player, I want to see power mode time remaining.\n\n## Acceptance Criteria\n- [ ] Visual timer bar\n- [ ] Real-time updates\n- [ ] Color change <3s\n- [ ] Visible during gameplay\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky","labels":["enhancement","ui","priority:medium","sprint:5"]}' | grep -q '"number"' && echo "✅ #26: Power Timer"

# Issue 27: Mobile Swipe
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Mobile Swipe Gesture Improvements 📱","body":"## User Story\nAs a mobile player, I want responsive swipe controls.\n\n## Acceptance Criteria\n- [ ] Improved sensitivity\n- [ ] No accidental inputs\n- [ ] Landscape/portrait\n- [ ] Visual feedback\n- [ ] iOS + Android tested\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky","labels":["enhancement","mobile","priority:medium","sprint:5"]}' | grep -q '"number"' && echo "✅ #27: Mobile Swipe"

# Issue 28: Bonus Fruit
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Bonus Fruit System 🍒","body":"## User Story\nAs a player, I want bonus fruits for extra points.\n\n## Acceptance Criteria\n- [ ] Spawns after X dots\n- [ ] Stays 10 seconds\n- [ ] Different fruits per level\n- [ ] Points: 100-5000\n- [ ] Sound when eaten\n\n## Definition of Done\n- [ ] Code by 🛠️ Engine\n- [ ] Review by ✈️ Pilot\n- [ ] QA by 🪨 Rocky","labels":["feature","game-mechanic","priority:medium","sprint:5"]}' | grep -q '"number"' && echo "✅ #28: Bonus Fruit"

# Issue 29: QA Plan
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"QA Test Plan - Sprint 5 UX & Polish 🧪","body":"## QA Test Plan\n\n### Test Cases\n- [ ] Tunnel pass-through\n- [ ] UX smoothness (FPS)\n- [ ] Countdown timer\n- [ ] Power pellet timer\n- [ ] Mobile gestures\n- [ ] Bonus fruits\n\n### Performance\n- [ ] 60 FPS desktop\n- [ ] 30+ FPS mobile\n- [ ] No memory leaks\n\n**Assigned:** 🪨 Rocky","labels":["testing","qa","priority:high","sprint:5"]}' | grep -q '"number"' && echo "✅ #29: QA Plan"

# Issue 30: BA Requirements
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"BA Requirements & User Feedback 📊","body":"## BA Tasks\n\n### User Feedback\n- [ ] Create feedback form\n- [ ] Collect v2.0 feedback\n- [ ] Gather UX pain points\n\n### Sprint 6 Planning\n- [ ] Prioritize backlog\n- [ ] Define success metrics\n- [ ] Document user requests\n\n**Assigned:** 💫 Pretty","labels":["documentation","ba","priority:medium","sprint:5"]}' | grep -q '"number"' && echo "✅ #30: BA Requirements"

# Issue 31: Code Review
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Code Review Checklist - Sprint 5 📝","body":"## Code Review Checklist\n\n### Features\n- [ ] Tunnel implementation\n- [ ] UX smoothness\n- [ ] Countdown timer\n- [ ] Power timer\n- [ ] Mobile gestures\n- [ ] Bonus fruits\n\n### Performance\n- [ ] No memory leaks\n- [ ] FPS targets met\n- [ ] Efficient rendering\n\n**Assigned:** ✈️ Pilot","labels":["code-review","priority:high","sprint:5"]}' | grep -q '"number"' && echo "✅ #31: Code Review"

# Issue 32: Release
curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Sprint 5 Release v2.1 🚀","body":"## Release Checklist - v2.1.0\n\n### Pre-Release\n- [ ] All stories in DONE\n- [ ] No critical bugs\n- [ ] QA sign-off\n- [ ] Code review complete\n\n### Release\n- [ ] Merge to main\n- [ ] Tag v2.1.0\n- [ ] Deploy to Pages\n- [ ] Release notes\n\n**Team:** 🛠️ Engine ✈️ Pilot 🪨 Rocky 💫 Pretty 👑 Boss","labels":["release","priority:high","sprint:5"]}' | grep -q '"number"' && echo "✅ #32: Release v2.1"

echo ""
echo "✅ Sprint 5 issues created!"
