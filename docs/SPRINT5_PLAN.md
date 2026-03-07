# 🎯 Sprint 5 Planning - v2.1 UX Polish Update

**Sprint Goal:** Improve gameplay experience, fix bugs, add polish

---

## 📋 Backlog Items

### From User/Player Feedback

| # | Issue | Priority | Est. Points |
|---|-------|----------|-------------|
| 1 | Maze tunnel pass-through (left/right sides) | High | 5 |
| 2 | UX smoothness improvements | High | 8 |
| 3 | 5-second countdown before game starts | Medium | 3 |

### Product Owner Suggestions

| # | Issue | Priority | Est. Points |
|---|-------|----------|-------------|
| 4 | Ghost speed balancing per level | Medium | 3 |
| 5 | Power pellet visual indicator (timer) | Medium | 5 |
| 6 | Pause menu overlay with resume button | Low | 3 |
| 7 | Keyboard shortcuts (P=pause, M=mute, R=restart) | Low | 2 |
| 8 | Mobile swipe gesture improvements | Medium | 5 |
| 9 | Sound volume control | Low | 2 |
| 10 | Bonus fruit spawning (cherry, strawberry) | Medium | 8 |

---

## 🎯 Sprint 5 Committed Issues (26 points)

### Issue #23: Maze Tunnel Pass-Through
**Priority:** High  
**Points:** 5  
**Assignee:** 🛠️ Engine

**User Story:**
As a player, I want to pass through the tunnel on left/right sides of the maze so that I can escape ghosts strategically.

**Acceptance Criteria:**
- [ ] Left edge of maze connects to right edge
- [ ] Right edge of maze connects to left edge
- [ ] Pac-Man can pass through
- [ ] Ghosts can pass through
- [ ] Works on all levels

---

### Issue #24: UX Smoothness Improvements
**Priority:** High  
**Points:** 8  
**Assignee:** 🛠️ Engine

**User Story:**
As a player, I want smooth, responsive controls so that the game feels polished and professional.

**Acceptance Criteria:**
- [ ] No input lag on direction changes
- [ ] Smooth Pac-Man animation (60 FPS target)
- [ ] Ghost movement is fluid (not jerky)
- [ ] No stuttering during gameplay
- [ ] Mobile touch response <100ms
- [ ] No frame drops during power pellet mode

**QA Focus:** 🪨 Rocky to test on multiple devices
**BA Focus:** 💫 Pretty to gather user feedback

---

### Issue #25: 5-Second Game Start Countdown
**Priority:** Medium  
**Points:** 3  
**Assignee:** 🛠️ Engine

**User Story:**
As a player, I want a countdown timer before the game starts so that I can prepare and anticipate the action.

**Acceptance Criteria:**
- [ ] Show "3... 2... 1... GO!" overlay
- [ ] Each number displays for ~1 second
- [ ] Countdown is visible on screen
- [ ] Sound effect for each count
- [ ] Game starts after "GO!"
- [ ] Works on level start too

---

### Issue #26: Power Pellet Timer Indicator
**Priority:** Medium  
**Points:** 5  
**Assignee:** 🛠️ Engine

**User Story:**
As a player, I want to see how much time is left on power mode so that I can strategize my ghost hunting.

**Acceptance Criteria:**
- [ ] Visual timer bar or countdown
- [ ] Shows remaining power mode time
- [ ] Updates in real-time
- [ ] Changes color when <3 seconds left
- [ ] Visible during gameplay

---

### Issue #27: Mobile Swipe Gesture Improvements
**Priority:** Medium  
**Points:** 5  
**Assignee:** 🛠️ Engine

**User Story:**
As a mobile player, I want responsive swipe controls so that I can play comfortably on touch devices.

**Acceptance Criteria:**
- [ ] Swipe detection sensitivity improved
- [ ] No accidental direction changes
- [ ] Works in landscape and portrait
- [ ] Visual feedback on swipe
- [ ] Tested on iOS and Android

---

### Issue #28: Bonus Fruit System
**Priority:** Medium  
**Points:** 8  
**Assignee:** 🛠️ Engine

**User Story:**
As a player, I want bonus fruits to appear for extra points so that the game is more exciting and rewarding.

**Acceptance Criteria:**
- [ ] Fruit spawns after X dots eaten
- [ ] Fruit stays for 10 seconds
- [ ] Different fruits per level (cherry, strawberry, peach, etc.)
- [ ] Points scale with fruit type (100-5000)
- [ ] Visual indicator of next fruit
- [ ] Sound effect when eaten

---

### Issue #29: QA Test Plan - UX & Polish
**Priority:** High  
**Points:** 3  
**Assignee:** 🪨 Rocky

**User Story:**
As a QA tester, I want comprehensive test cases so that I can verify all UX improvements.

**Acceptance Criteria:**
- [ ] Test plan for tunnel pass-through
- [ ] Test plan for UX smoothness (FPS testing)
- [ ] Test plan for countdown timer
- [ ] Test plan for power pellet timer
- [ ] Test plan for mobile gestures
- [ ] Test plan for bonus fruits
- [ ] Performance benchmarks defined
- [ ] Device matrix for testing

---

### Issue #30: BA Requirements & User Feedback
**Priority:** Medium  
**Points:** 3  
**Assignee:** 💫 Pretty

**User Story:**
As a BA, I want to gather user feedback so that we can prioritize future improvements.

**Acceptance Criteria:**
- [ ] User feedback form/survey created
- [ ] Collect feedback on v2.0 (Ghost AI)
- [ ] Prioritize Sprint 6 backlog
- [ ] Document UX pain points
- [ ] Define success metrics for v2.1

---

### Issue #31: Code Review - Sprint 5
**Priority:** High  
**Points:** 5  
**Assignee:** ✈️ Pilot

**User Story:**
As a senior developer, I want to review all code changes so that quality is maintained.

**Acceptance Criteria:**
- [ ] Review tunnel implementation
- [ ] Review UX smoothness changes
- [ ] Review countdown timer code
- [ ] Review power pellet timer
- [ ] Review mobile gesture improvements
- [ ] Review bonus fruit system
- [ ] Performance audit
- [ ] Security check

---

### Issue #32: Sprint 5 Release v2.1
**Priority:** High  
**Points:** 2  
**Assignee:** 👑 Boss

**User Story:**
As a Scrum Master, I want to coordinate the release so that all features are delivered successfully.

**Acceptance Criteria:**
- [ ] All issues in DONE
- [ ] QA sign-off complete
- [ ] Code review approved
- [ ] Release notes written
- [ ] GitHub release published
- [ ] Live deployment verified
- [ ] Sprint retrospective scheduled

---

## 📊 Sprint 5 Summary

| Metric | Value |
|--------|-------|
| **Total Issues** | 10 |
| **Total Points** | 45 |
| **Committed Points** | 26 (Issues #23-32) |
| **Sprint Duration** | 2 weeks (target) |
| **Team Velocity** | 26 points (from Sprint 4) |

---

## 🎯 Sprint 5 Goal

**Deliver v2.1 - UX Polish Update** with:
- ✅ Maze tunnel pass-through
- ✅ Smooth UX (60 FPS target)
- ✅ 5-second countdown
- ✅ Power pellet timer
- ✅ Mobile gesture improvements
- ✅ Bonus fruit system

---

## 📅 Sprint 5 Timeline

| Week | Focus |
|------|-------|
| Week 1 | Core features (#23, #24, #25) |
| Week 2 | Polish features (#26, #27, #28) + QA/Review |

---

## 🏆 Definition of Done (Sprint 5)

- [ ] Code implemented and tested
- [ ] Code review approved (✈️ Pilot)
- [ ] QA testing complete (🪨 Rocky)
- [ ] UX smoothness verified (60 FPS)
- [ ] Mobile tested (iOS + Android)
- [ ] Performance benchmarks met
- [ ] Release notes published

---

_Sprint 5 Planning v1.0 - Ready to Start!_
