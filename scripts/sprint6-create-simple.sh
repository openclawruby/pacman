#!/bin/bash
REPO="openclawruby/pacman"
TOKEN="${GITHUB_TOKEN:-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}"

echo "Creating Sprint 6 Issues..."

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Multiplayer Mode (Local) 🎮","body":"## User Story\nAs a player, I want to play with a friend on the same device.\n\n## Acceptance Criteria\n- [ ] 2-player mode\n- [ ] Score tracking for both\n- [ ] Winner announcement\n\n**Assigned:** 🛠️ Engine","labels":["feature","multiplayer","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #33: Multiplayer"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Power-Up System ⚡","body":"## User Story\nAs a player, I want temporary power-ups.\n\n## Acceptance Criteria\n- [ ] 3 power-up types\n- [ ] Random spawn\n- [ ] Visual indicator\n- [ ] Timer\n\n**Assigned:** 🛠️ Engine","labels":["feature","game-mechanic","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #34: Power-Ups"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"User Feedback Form 📊","body":"## User Story\nAs a BA, I want to collect user feedback.\n\n## Acceptance Criteria\n- [ ] In-game feedback button\n- [ ] Rating 1-5 stars\n- [ ] Comment box\n\n**Assigned:** 💫 Pretty","labels":["enhancement","feedback","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #35: Feedback Form"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Performance Optimization (Mobile) ⚡","body":"## User Story\nAs a mobile player, I want smooth 60 FPS.\n\n## Acceptance Criteria\n- [ ] 60 FPS on modern mobile\n- [ ] 30 FPS on older\n- [ ] No frame drops\n\n**Assigned:** 🛠️ Engine","labels":["enhancement","performance","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #37: Performance"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"QA Test Plan - Sprint 6 🧪","body":"## QA Test Plan\n- [ ] Multiplayer\n- [ ] Power-ups\n- [ ] Feedback form\n- [ ] Performance (60 FPS)\n- [ ] User testing (10+ players)\n\n**Assigned:** 🪨 Rocky","labels":["testing","qa","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #39: QA Plan"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"User Testing Sessions 👥","body":"## User Testing\n- [ ] 10+ players\n- [ ] Feedback collected\n- [ ] Issues documented\n- [ ] Usability score\n\n**Assigned:** 🪨 Rocky","labels":["testing","user-feedback","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #40: User Testing"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Code Review Checklist - Sprint 6 📝","body":"## Code Review\n- [ ] Multiplayer\n- [ ] Power-ups\n- [ ] Feedback form\n- [ ] Performance\n- [ ] No memory leaks\n- [ ] 60 FPS achieved\n\n**Assigned:** ✈️ Pilot","labels":["code-review","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #41: Code Review"

curl -s -X POST "https://api.github.com/repos/$REPO/issues" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: application/json" \
    -d '{"title":"Sprint 6 Release v2.2 🚀","body":"## Release v2.2.0\n- [ ] All stories in DONE\n- [ ] QA sign-off\n- [ ] Code review\n- [ ] User feedback collected\n- [ ] Release notes\n\n**Team:** 🛠️ Engine ✈️ Pilot 🪨 Rocky 💫 Pretty 👑 Boss","labels":["release","priority:high","sprint:6"]}' | grep -q '"number"' && echo "✅ #42: Release v2.2"

echo ""
echo "✅ Sprint 6 issues created!"
