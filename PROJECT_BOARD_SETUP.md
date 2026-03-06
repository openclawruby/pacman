# 📋 GitHub Project Board Setup Guide

*Complete setup for Pac-Man Scrum Team*

---

## Step 1: Create the Project

1. Go to: **https://github.com/users/openclawruby/projects**
2. Click **"New project"**
3. Choose **"Kanban"** template
4. Name: `🟡 Pac-Man Development`
5. Click **"Create"**

---

## Step 2: Configure Columns

Click **"..."** → **"Edit workflow"** → **"Columns"**

### Default Columns (Rename/Add)
| Column | Purpose | WIP Limit |
|--------|---------|-----------|
| `📦 BACKLOG` | Future ideas, icebox | None |
| `📋 TODO` | Sprint 4 committed work | 5 |
| `🔨 IN PROGRESS` | Currently being developed | 3 |
| `👀 IN REVIEW` | PR open, awaiting review | 4 |
| `✅ DONE` | Completed, tested, merged | None |

**To rename:** Click column name → Edit → Save

---

## Step 3: Add Custom Fields

Click **"..."** → **"Edit workflow"** → **"Fields"** → **"Add field"**

### Required Fields
| Field Name | Type | Options |
|------------|------|---------|
| `Sprint` | Single select | Sprint 4, Sprint 5, Sprint 6, Backlog |
| `Story Points` | Number | 1, 2, 3, 5, 8, 13 |
| `Assignee Role` | Single select | 🛠️ Engine, ✈️ Pilot, 🪨 Rocky, 💫 Pretty, 👑 Boss, 🌱 Little |
| `Priority` | Single select | High, Medium, Low |
| `Status` | Single select | On Track, At Risk, Blocked |

---

## Step 4: Set Up Automation

Click **"..."** → **"Edit workflow"** → **"Workflows"** → **"New workflow"**

### Automation Rules

#### 1. Issue Created → BACKLOG
```
Trigger: When an item is added to the project
Action: Set column to "📦 BACKLOG"
```

#### 2. Labeled sprint:4 → TODO
```
Trigger: When issue labeled "sprint:4"
Action: Move to column "📋 TODO"
```

#### 3. Assigned to Developer → IN PROGRESS
```
Trigger: When assignee is set to 🛠️ Engine
Action: Move to column "🔨 IN PROGRESS"
```

#### 4. PR Opened → IN REVIEW
```
Trigger: When pull request opened
Action: Move to column "👀 IN REVIEW"
```

#### 5. PR Merged → DONE
```
Trigger: When pull request merged
Action: Move to column "✅ DONE"
```

#### 6. Issue Closed → DONE
```
Trigger: When issue closed
Action: Move to column "✅ DONE"
```

---

## Step 5: Create Sprint 4 Issues

Copy/paste each issue below. **All issues auto-populate to project board!**

---

### Issue #1: Add Ghost AI 🎮
**Title:** `Add Ghost AI 🎮`
**Labels:** `feature` `game-mechanic` `priority:high` `sprint:4`
**Assignee:** 🛠️ Engine
**Story Points:** 8
**Sprint:** Sprint 4

**Description:**
```markdown
## User Story
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

**Files to Modify:**
- `index.html` - Ghost rendering, AI logic
- `SCRUM_WORKFLOW.md` - Update when complete

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky
- [ ] Merged to develop branch
- [ ] Deployed to staging
```

---

### Issue #2: Add Multiple Levels 🎯
**Title:** `Add Multiple Levels 🎯`
**Labels:** `feature` `game-mechanic` `priority:high` `sprint:4`
**Assignee:** 🛠️ Engine
**Story Points:** 5
**Sprint:** Sprint 4

**Description:**
```markdown
## User Story
As a player, I want to progress through multiple levels with increasing difficulty so that the game stays challenging.

## Acceptance Criteria
- [ ] Detect when all dots are consumed
- [ ] Show "Level Complete" message
- [ ] Load next level after brief delay
- [ ] Increase difficulty per level (ghost speed, power pellet duration)
- [ ] Display current level on screen
- [ ] Persist high score across levels

## Technical Notes
**Level Progression:**
- Level 1: 1 ghost, slow
- Level 2: 2 ghosts, normal
- Level 3: 3 ghosts, faster
- Level 4+: 4 ghosts, max speed

**Difficulty Scaling:**
- Ghost speed +10% per level
- Power pellet duration -1s per level (min 3s)

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky
- [ ] Merged to develop branch
```

---

### Issue #3: Start/Game Over Screens 🎬
**Title:** `Add Start Screen & Game Over Screen 🎬`
**Labels:** `enhancement` `ui` `priority:medium` `sprint:4`
**Assignee:** 🛠️ Engine
**Story Points:** 3
**Sprint:** Sprint 4

**Description:**
```markdown
## User Story
As a player, I want proper start and game over screens so that the game feels polished and professional.

## Acceptance Criteria
- [ ] Start screen with title and "Press Start" button
- [ ] Game over screen with final score
- [ ] "Play Again" button on game over
- [ ] High score display on start screen
- [ ] Sound effects for start/game over

## Technical Notes
**Current State:** Start screen exists but button may not work (CSS bug being fixed)

**Game Over Flow:**
1. Pac-Man loses all lives
2. Show "GAME OVER" overlay
3. Display final score
4. "Play Again" resets game

## Definition of Done
- [ ] Code implemented by 🛠️ Engine
- [ ] Code reviewed by ✈️ Pilot
- [ ] QA tested by 🪨 Rocky
- [ ] Mobile tested
```

---

### Issue #4: QA Test Plan - Ghost AI 🧪
**Title:** `QA Test Plan - Ghost AI 🧪`
**Labels:** `testing` `qa` `priority:high` `sprint:4`
**Assignee:** 🪨 Rocky
**Story Points:** 3
**Sprint:** Sprint 4

**Description:**
```markdown
## QA Test Plan

### Test Cases for Ghost AI (Issue #1)

**TC1: Ghost Movement**
- [ ] Ghosts move through maze without getting stuck
- [ ] Ghosts don't pass through walls
- [ ] Ghost movement is smooth (not teleporting)

**TC2: Ghost Personalities**
- [ ] Blinky chases Pac-Man directly
- [ ] Pinky ambushes ahead of Pac-Man
- [ ] Inky has unpredictable movement
- [ ] Clyde scatters when close

**TC3: Power Pellets**
- [ ] Ghosts turn blue when power pellet eaten
- [ ] Pac-Man can eat vulnerable ghosts
- [ ] Ghosts respawn after being eaten
- [ ] Power mode lasts 10 seconds

**TC4: Collision Detection**
- [ ] Ghost catches Pac-Man = game over
- [ ] Multiple ghosts can catch Pac-Man
- [ ] Collision works on mobile

### Devices to Test
- [ ] Desktop (Chrome, Firefox, Safari)
- [ ] Mobile iOS (Safari)
- [ ] Mobile Android (Chrome)
- [ ] Tablet

### Sign-off
- [ ] All test cases pass
- [ ] No critical bugs
- [ ] Ready for production
- [ ] QA approved by 🪨 Rocky
```

---

### Issue #5: Code Review Checklist - Sprint 4 📝
**Title:** `Code Review Checklist - Sprint 4 📝`
**Labels:** `code-review` `priority:high` `sprint:4`
**Assignee:** ✈️ Pilot
**Story Points:** 5
**Sprint:** Sprint 4

**Description:**
```markdown
## Code Review Checklist

### Ghost AI (Issue #1)
- [ ] Code is clean and readable
- [ ] Ghost AI is performant (no lag)
- [ ] No memory leaks
- [ ] Error handling in place
- [ ] Comments explain complex logic

### Multiple Levels (Issue #2)
- [ ] Level progression logic is sound
- [ ] Difficulty scaling is balanced
- [ ] High score persists correctly
- [ ] No edge case bugs

### UI Polish (Issue #3)
- [ ] Start button works on all devices
- [ ] Game over screen displays correctly
- [ ] Sound effects work
- [ ] Mobile responsive

### Architecture Review
- [ ] Code follows existing patterns
- [ ] No duplication
- [ ] Functions are modular
- [ ] Easy to extend for future features

### Security
- [ ] No XSS vulnerabilities
- [ ] No eval() or dangerous patterns
- [ ] Input validation where needed

### Review Sign-off
- [ ] All PRs reviewed
- [ ] Comments addressed
- [ ] Approved for merge
- [ ] Reviewed by ✈️ Pilot
```

---

### Issue #6: Sprint 4 Release 🚀
**Title:** `Sprint 4 Release v2.0 🚀`
**Labels:** `release` `priority:high` `sprint:4`
**Assignee:** 👑 Boss
**Story Points:** 2
**Sprint:** Sprint 4

**Description:**
```markdown
## Release Checklist - v2.0.0

### Pre-Release (👑 Boss)
- [ ] All sprint stories in DONE
- [ ] No critical bugs open
- [ ] QA sign-off complete (🪨 Rocky)
- [ ] Code review complete (✈️ Pilot)
- [ ] Documentation updated

### Release Steps (🛠️ Engine)
- [ ] Merge develop to main
- [ ] Create release tag: v2.0.0
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
- [ ] Update sprint board
- [ ] Sprint retrospective scheduled
- [ ] Sprint 5 planning prepared

### Release Info
**Version:** v2.0.0
**Name:** Ghost AI Update
**Date:** TBD
**Team:**
- Dev: 🛠️ Engine
- Review: ✈️ Pilot
- QA: 🪨 Rocky
- BA: 💫 Pretty
- SM: 👑 Boss
```

---

## Step 6: Link Repository to Project

1. In Project, click **"..."** → **"Settings"**
2. Under **"Repositories"** click **"Add repositories"**
3. Select: `openclawruby/pacman`
4. Click **"Add"**

**Result:** All existing issues auto-import to BACKLOG!

---

## Step 7: Create Views (Filters)

Click **"..."** → **"Views"** → **"New view"**

### View 1: Sprint 4 Board
```
Name: Sprint 4
Filter: Sprint = Sprint 4
Group by: Column
```

### View 2: My Tasks (per role)
```
Name: Engine's Tasks
Filter: Assignee = 🛠️ Engine
Group by: Column
```

### View 3: Blocked Items
```
Name: Blocked
Filter: Status = Blocked
Group by: Assignee
```

### View 4: QA Queue
```
Name: QA Queue
Filter: Column = IN REVIEW
Group by: Priority
```

---

## Step 8: Sprint Dashboard

### Add Widgets (GitHub Projects Beta)
1. Click **"Insights"** tab
2. Add charts:
   - **Issues by status** (pie chart)
   - **Sprint burndown** (line chart)
   - **Issues by assignee** (bar chart)

---

## ✅ Setup Complete!

Your board should now have:
- ✅ 5 columns (BACKLOG → DONE)
- ✅ Custom fields (Sprint, Story Points, Role, Priority, Status)
- ✅ 6 automation rules
- ✅ 6 Sprint 4 issues created
- ✅ Repository linked
- ✅ Custom views configured

---

## 🎯 Next Steps

1. **Scrum Master (👑 Boss):** Review board, assign team members
2. **Developer (🛠️ Engine):** Start pulling TODO items
3. **BA (💫 Pretty):** Refine backlog for Sprint 5
4. **QA (🪨 Rocky):** Prepare test plans
5. **Senior Dev (✈️ Pilot):** Monitor review queue

---

_Quick Links:_
- _Project: https://github.com/users/openclawruby/projects_
- _Repo: https://github.com/openclawruby/pacman_
- _Workflow Doc: /pacman/SCRUM_WORKFLOW.md_
