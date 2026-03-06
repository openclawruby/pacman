# GitHub Issues Drafts for Pac-Man Project

*Copy these into GitHub when creating issues*

---

## Issue #1: Add Ghost AI 🎮

### Description
Implement ghost enemies that chase Pac-Man through the maze. This is the next major feature for v2.0.

### Acceptance Criteria
- [ ] 4 ghosts with distinct behaviors (like classic Pac-Man)
- [ ] Ghosts move through the maze autonomously
- [ ] Ghosts can collide with Pac-Man (end game or lose life)
- [ ] Ghosts are affected by power pellets (turn blue, can be eaten)
- [ ] Ghosts respawn after being eaten
- [ ] Smooth movement animation (not teleporting)

### Technical Notes
**Suggested Ghost Personalities:**
1. **Blinky (Red)** - Direct chase, always targets Pac-Man's current position
2. **Pinky (Pink)** - Ambush, targets 4 tiles ahead of Pac-Man's direction
3. **Inky (Cyan)** - Unpredictable, uses vector between Blinky and Pac-Man
4. **Clyde (Orange)** - Random, chases when far, scatters when close

**Implementation Approach:**
- Add `Ghost` class in `pacman.py`
- Each ghost needs: position, direction, personality/behavior, state (normal/scared/eaten)
- Pathfinding: simple target-based movement (no need for A* initially)
- Collision detection with Pac-Man
- Render ghosts (can use simple colored circles initially, upgrade to sprites later)

**Files to Modify:**
- `pacman.py` - Main game logic
- `index.html` - Rendering and controls
- May need to refactor maze data structure for ghost navigation

### References
- Classic Pac-Man ghost AI: https://gameinternals.com/post/2270526672/understanding-pacman-ghost-behavior
- Sprint Plan: `/SPRINT_PLAN.md` (Sprint 3 completed, this is Sprint 4)

### Labels
`feature` `game-mechanic` `priority:high` `sprint:4`

### Assignee
🛠️ Engine

---

## Issue #2: Add Multiple Levels 🎯

### Description
Implement level progression system. When Pac-Man clears all dots, advance to the next level with increased difficulty.

### Acceptance Criteria
- [ ] Detect when all dots are consumed
- [ ] Show "Level Complete" message
- [ ] Load next level after brief delay
- [ ] Increase difficulty per level (ghost speed, fewer power pellet effects, etc.)
- [ ] Display current level on screen
- [ ] Persist high score across levels
- [ ] Game over when all lives lost

### Technical Notes
**Level Progression Ideas:**
- Level 1: 1 ghost, slow speed
- Level 2: 2 ghosts, normal speed
- Level 3: 3 ghosts, faster
- Level 4+: 4 ghosts, max speed, shorter power pellet duration

**Difficulty Scaling:**
- Ghost movement speed (+10% per level)
- Power pellet effect duration (-1 second per level, min 3 seconds)
- Bonus fruit value (+100 points per level)
- Extra life every 10,000 points

**Implementation:**
- Add `level` variable to game state
- Create `loadLevel(levelNum)` function
- Reset positions but keep score
- Modify maze layout per level (optional, can start with same maze)
- Add level indicator to HUD

**Files to Modify:**
- `pacman.py` - Level logic, win condition
- `index.html` - Level display in HUD, level complete screen

### References
- Current scoring system: Already implemented in Sprint 3
- Power pellets: Already implemented, need to adjust duration per level

### Labels
`feature` `game-mechanic` `priority:high` `sprint:4`

### Assignee
🛠️ Engine

---

## Issue #3: Add Bonus Fruits 🍒

### Description
Spawn bonus fruits periodically in the maze for extra points. Classic Pac-Man feature that adds strategic depth.

### Acceptance Criteria
- [ ] Fruit appears at maze center after X dots eaten
- [ ] Fruit stays visible for limited time (10 seconds)
- [ ] Pac-Man can eat fruit for bonus points
- [ ] Different fruits per level (cherry, strawberry, peach, etc.)
- [ ] Points increase with each fruit type (100 → 5000)
- [ ] Visual indicator of which fruit will appear next

### Technical Notes
**Fruit Types & Points:**
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

**Implementation:**
- Timer-based spawn (every 30-40 seconds or after % of dots eaten)
- Fruit object with position, type, timer
- Collision detection with Pac-Man
- Render fruit sprite or emoji
- Add to HUD: next fruit preview

### Labels
`feature` `enhancement` `priority:medium` `sprint:5`

### Assignee
🛠️ Engine

---

## Issue #4: Improve Ghost Behavior Patterns 🧠

### Description
Once basic ghost AI is working, refine behaviors to match classic Pac-Man's sophisticated targeting system.

### Acceptance Criteria
- [ ] Blinky enters "Cruise Mode" when Pac-Man is far (targets tile, not Pac-Man)
- [ ] Pinky's ambush target is accurate (4 tiles ahead)
- [ ] Inky's vector calculation works correctly
- [ ] Clyde's scatter/chase threshold is balanced
- [ ] Ghosts enter scatter mode periodically (7 seconds)
- [ ] Ghosts exit scatter mode and return to chase (20 seconds)

### Technical Notes
**Scatter/Chase Cycles:**
- Scatter: 7 seconds → Ghosts go to corner targets
- Chase: 20 seconds → Ghosts use their personality AI
- After 4 cycles, ghosts stay in chase mode permanently

**Corner Targets (Scatter Mode):**
- Blinky: Top-right corner
- Pinky: Top-left corner
- Inky: Bottom-right corner
- Clyde: Bottom-left corner

**This is an enhancement issue** - depends on Issue #1 being completed first.

### Labels
`enhancement` `game-mechanic` `priority:medium` `sprint:5` `depends:#1`

### Assignee
🛠️ Engine

---

## Issue #5: Add Start Screen & Game Over Screen 🎬

### Description
Polish the game flow with proper start screen, game over screen, and restart functionality.

### Acceptance Criteria
- [ ] Start screen with title and "Press Start" prompt
- [ ] Game over screen with final score
- [ ] "Play Again" button on game over
- [ ] High score display on start screen
- [ ] Pause menu (already have pause button, add menu overlay)
- [ ] Sound effects for start/game over

### Technical Notes
**Already Partially Done:**
- Sprint 3 added start screen instead of auto-start
- Need to verify it's working properly in latest version
- May need enhancement based on current state

**Game Over Flow:**
1. Pac-Man loses all lives
2. Show "GAME OVER" overlay
3. Display final score and high score
4. "Play Again" button resets game state
5. "Main Menu" button returns to start screen

### Labels
`enhancement` `ui` `priority:medium` `sprint:4`

### Assignee
🛠️ Engine

---

## How to Use These

1. Go to: https://github.com/openclawruby/pacman/issues
2. Click **"New issue"**
3. Copy/paste the title and description
4. Add labels (create them if needed)
5. Assign to 🛠️ Engine
6. Click **"Submit new issue"**

**Pro tip:** Create all 5 issues first, then the project board will auto-populate with them!

---

_Need more issues or different details? Just ask!_
