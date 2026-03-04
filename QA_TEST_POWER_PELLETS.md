# QA Test Cases - Power Pellets

## Test Suite: Power Pellet Functionality

### TC-PP-001: Power Pellet Collection
| Field | Value |
|-------|-------|
| **ID** | TC-PP-001 |
| **Priority** | High |
| **Feature** | Power Pellets |
| **Title** | Player can collect power pellets |

**Preconditions:**
- Game loaded
- Player at position near power pellet

**Steps:**
1. Move Pac-Man to a power pellet
2. Observe collection

**Expected Result:**
- Power pellet disappears from maze
- Score increases by 50 points
- All ghosts become vulnerable (turn blue)

---

### TC-PP-002: Ghost Vulnerability Duration
| Field | Value |
|-------|-------|
| **ID** | TC-PP-002 |
| **Priority** | High |
| **Feature** | Power Pellets |
| **Title** | Ghosts remain vulnerable for 10 seconds |

**Preconditions:**
- Game loaded

**Steps:**
1. Collect a power pellet
2. Wait 5 seconds
3. Observe ghost color

**Expected Result:**
- Ghosts remain blue after 5 seconds

---

### TC-PP-003: Ghost Vulnerability Expiration
| Field | Value |
|-------|-------|
| **ID** | TC-PP-003 |
| **Priority** | High |
| **Feature** | Power Pellets |
| **Title** | Ghosts regain normal state after 10 seconds |

**Preconditions:**
- Game loaded

**Steps:**
1. Collect a power pellet
2. Wait 11 seconds
3. Observe ghost color

**Expected Result:**
- Ghosts return to original colors

---

### TC-PP-004: Eating Vulnerable Ghost
| Field | Value |
|-------|-------|
| **ID** | TC-PP-004 |
| **Priority** | High |
| **Feature** | Power Pellets |
| **Title** | Player can eat vulnerable ghosts |

**Preconditions:**
- Game loaded, power pellet collected

**Steps:**
1. Collect power pellet (ghosts turn blue)
2. Move to ghost position

**Expected Result:**
- Ghost respawns at center
- Score increases by 200 points

---

### TC-PP-005: Multiple Ghost Eating
| Field | Value |
|-------|-------|
| **ID** | TC-PP-005 |
| **Priority** | Medium |
| **Feature** | Power Pellets |
| **Title** | Player can eat multiple ghosts in one power mode |

**Preconditions:**
- Game loaded

**Steps:**
1. Collect power pellet
2. Eat one ghost
3. Immediately move to another ghost

**Expected Result:**
- Both ghosts can be eaten during same power mode

---

### TC-PP-006: Power Pellet Animation
| Field | Value |
|-------|-------|
| **ID** | TC-PP-006 |
| **Priority** | Low |
| **Feature** | Power Pellets |
| **Title** | Power pellets have pulsing animation |

**Preconditions:**
- Game loaded

**Steps:**
1. Observe power pellets in corners

**Expected Result:**
- Power pellets pulse/glow (animation visible)

---

### TC-PP-007: Power Pellet Respawn
| Field | Value |
|-------|-------|
| **ID** | TC-PP-007 |
| **Priority** | High |
| **Feature** | Power Pellets |
| **Title** | Power pellets respawn on game restart |

**Preconditions:**
- Game over occurred

**Steps:**
1. Click "Play Again"
2. Observe corner positions

**Expected Result:**
- All 4 power pellets are present in corners

---

## Scoring Verification Matrix

| Action | Expected Points |
|--------|-----------------|
| Collect dot | 10 |
| Collect power pellet | 50 |
| Eat vulnerable ghost | 200 |

---

## Browser Compatibility
- [ ] Chrome (desktop)
- [ ] Firefox (desktop)
- [ ] Safari (desktop)
- [ ] Chrome (mobile)
- [ ] Safari (iOS)

---

## Defects Found
*To be completed during testing*

---
**QA Tester:** DigitalClaw  
**Date:** 2026-03-04  
**Status:** Pending Execution
