# Sprint 4: Ghosts & AI

**Goal:** Add intelligent ghost enemies with unique behaviors

**Duration:** 1-2 weeks  
**Priority:** High (core gameplay)

---

## Team Assignments

| Role | Name | Sprint 4 Tasks |
|------|------|----------------|
| Developer | 🛠️ Engine | Ghost AI, pathfinding |
| Senior Developer | ✈️ Pilot | Code review, optimization |
| QA Tester | 🪨 Rocky | Ghost behavior tests |
| Business Analyst | 💫 Pretty | UX feedback, difficulty balancing |
| Scrum Master | 👑 Boss | Sprint coordination |
| Assistant | 🌱 Little | Documentation |

---

## Tasks

### 4.1: Ghost AI Foundation
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Create Ghost class with base properties | ⬜ Todo | 🛠️ Engine | P0 |
| Implement basic movement (random valid directions) | ⬜ Todo | 🛠️ Engine | P0 |
| Add ghost rendering (sprites/colors) | ⬜ Todo | 🛠️ Engine | P0 |
| Add collision detection with Pac-Man | ⬜ Todo | 🛠️ Engine | P0 |

### 4.2: Four Unique Ghosts
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| **Blinky (Red)** - Aggressive chaser | ⬜ Todo | 🛠️ Engine | P1 |
| **Pinky (Pink)** - Ambusher (targets ahead) | ⬜ Todo | 🛠️ Engine | P1 |
| **Inky (Cyan)** - Unpredictable (mix of strategies) | ⬜ Todo | 🛠️ Engine | P1 |
| **Clyde (Orange)** - Random/shy behavior | ⬜ Todo | 🛠️ Engine | P1 |

### 4.3: Ghost States
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Implement Scatter mode (return to corners) | ⬜ Todo | 🛠️ Engine | P1 |
| Implement Chase mode (pursue Pac-Man) | ⬜ Todo | 🛠️ Engine | P0 |
| Implement Frightened mode (after power pellet) | ⬜ Todo | 🛠️ Engine | P0 |
| Implement Eaten state (return to ghost house) | ⬜ Todo | 🛠️ Engine | P2 |
| Add mode transitions (timed) | ⬜ Todo | 🛠️ Engine | P1 |

### 4.4: Pathfinding
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Implement A* or BFS pathfinding | ⬜ Todo | 🛠️ Engine | P1 |
| Optimize for performance (cache paths) | ⬜ Todo | 🛠️ Engine | P2 |
| Add tunnel handling (wrap-around) | ⬜ Todo | 🛠️ Engine | P1 |

### 4.5: Game Mechanics
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Ghost house (spawn point) | ⬜ Todo | 🛠️ Engine | P1 |
| Ghost release timing (staggered) | ⬜ Todo | 🛠️ Engine | P2 |
| Scoring: eating ghosts (200, 400, 800, 1600) | ⬜ Todo | 🛠️ Engine | P1 |
| Death animation (Pac-Man caught) | ⬜ Todo | 🛠️ Engine | P2 |
| Extra life at 10,000 points | ⬜ Todo | 🛠️ Engine | P2 |

### 4.6: QA & Testing
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Test ghost collision detection | ⬜ Todo | 🪨 Rocky | P0 |
| Test power pellet behavior | ⬜ Todo | 🪨 Rocky | P0 |
| Test all 4 ghost AI behaviors | ⬜ Todo | 🪨 Rocky | P1 |
| Test difficulty balance | ⬜ Todo | 💫 Pretty | P1 |
| Performance testing (mobile) | ⬜ Todo | 🪨 Rocky | P1 |

### 4.7: Polish
| Task | Status | Assignee | Priority |
|------|--------|----------|----------|
| Ghost eyes (direction indicator) | ⬜ Todo | 🛠️ Engine | P2 |
| Ghost animations (movement) | ⬜ Todo | 🛠️ Engine | P2 |
| Sound effects (ghost movement, eaten) | ⬜ Todo | 🛠️ Engine | P2 |
| Difficulty settings (easy/medium/hard) | ⬜ Todo | 🛠️ Engine | P3 |

---

## Acceptance Criteria

- [ ] 4 ghosts with distinct AI behaviors
- [ ] Ghosts chase Pac-Man intelligently
- [ ] Power pellets make ghosts vulnerable
- [ ] Eating ghosts gives bonus points
- [ ] Ghosts return to house when eaten
- [ ] Game becomes progressively harder
- [ ] Mobile performance stays smooth (60fps)
- [ ] All QA tests pass

---

## Technical Notes

### Ghost AI Personalities

**Blinky (Shadow)**
- Targets Pac-Man's current position
- Becomes more aggressive as game progresses
- Red color, fast speed

**Pinky (Speedy)**
- Targets 4 tiles ahead of Pac-Man
- Attempts to ambush
- Pink color

**Inky (Bashful)**
- Uses Blinky's position + Pac-Man's target
- Unpredictable vector-based movement
- Cyan color

**Clyde (Pokey)**
- Chases when far, scatters when close
- Random behavior element
- Orange color

### Frightened Mode
- Triggered by power pellet (10 seconds)
- Ghosts turn blue
- Move slower, random directions
- Can be eaten for bonus points
- Eyes return to ghost house

---

## Dependencies

- ✅ Sprint 1: Foundation (complete)
- ✅ Sprint 2: Mobile UX (complete)
- ✅ Sprint 3: Game Features v1.0 (complete)
- ⬜ Sprint 4: Ghosts & AI (this sprint)
- ⬜ Sprint 5: Levels & Progression (next)

---

## Timeline

| Week | Focus |
|------|-------|
| Week 1 | Ghost AI basics, 4 personalities |
| Week 2 | States, pathfinding, polish |
| Week 3 | QA, balance, release |

---

## Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| AI performance on mobile | High | Optimize pathfinding, cache results |
| Difficulty balance | Medium | Playtesting, adjustable parameters |
| Scope creep | Medium | Stick to core 4 ghosts first |

---

**Created:** 2026-03-06  
**Status:** Ready to start  
**Next:** Kickoff meeting, assign P0 tasks
