# 🧪 Sprint 9 QA Test Plan

**Version:** v2.5 - Multiplayer & Social  
**Date:** March 10, 2026  
**QA Lead:** 🪨 Rocky  
**Status:** 🟡 IN PROGRESS

---

## 📋 Test Overview

| Test Area | Tests | Status |
|-----------|-------|--------|
| Mode Selection | 5 tests | ⚪ TODO |
| Competitive Mode | 8 tests | ⚪ TODO |
| Cooperative Mode | 10 tests | ⚪ TODO |
| Leaderboards | 6 tests | ⚪ TODO |
| Share Score | 4 tests | ⚪ TODO |
| Accessibility | 6 tests | ⚪ TODO |
| Cross-Browser | 4 tests | ⚪ TODO |
| Mobile | 5 tests | ⚪ TODO |

**Total:** 48 test cases

---

## 🎮 Test Cases

### 1. Mode Selection Screen

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| MS-01 | Mode screen appears | Click START on main menu | Mode selection screen displays | ⚪ |
| MS-02 | Classic mode select | Click Classic mode | Game starts in classic mode | ⚪ |
| MS-03 | Competitive mode select | Click Competitive mode | Alert shows, game ready for P1 | ⚪ |
| MS-04 | Cooperative mode select | Click Cooperative mode | Alert shows, P2 Pac-Man visible | ⚪ |
| MS-05 | Back button | Click Back button | Returns to main menu | ⚪ |

---

### 2. Competitive Mode (2P Turn-Based)

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| CM-01 | P1 starts first | Select Competitive mode | P1 turn message appears | ⚪ |
| CM-02 | P1 game ends | P1 loses all lives | "Player 2's Turn" screen shows | ⚪ |
| CM-03 | P2 gameplay | P2 starts turn | P2 controls work (arrows) | ⚪ |
| CM-04 | Score tracking | Both players complete | P1 and P2 scores displayed | ⚪ |
| CM-05 | Winner announcement | Scores differ | Winner text shows correctly | ⚪ |
| CM-06 | Tie game | Same scores | "It's a Tie!" message | ⚪ |
| CM-07 | Play again | Click Play Again | New game, scores reset | ⚪ |
| CM-08 | Leaderboard save | Game ends | Both P1 and P2 scores saved | ⚪ |

---

### 3. Cooperative Mode (2P Team)

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| CO-01 | Two Pac-Men visible | Start Cooperative | Yellow (P1) and Pink (P2) appear | ⚪ |
| CO-02 | P1 controls | Use Arrow keys | Yellow Pac-Man moves | ⚪ |
| CO-03 | P2 controls | Use WASD keys | Pink Pac-Man moves | ⚪ |
| CO-04 | Shared lives | P1 dies | Lives decrease from 6 | ⚪ |
| CO-05 | P2 death | P2 dies | Lives decrease, P2 respawns | ⚪ |
| CO-06 | Both die at once | Both hit ghost | Lives decrease by 2 | ⚪ |
| CO-07 | Game over | Lives reach 0 | Team score displayed | ⚪ |
| CO-08 | Score sharing | Eat dots | Single combined score | ⚪ |
| CO-09 | Power pellets | Either eats | Both benefit from vulnerable ghosts | ⚪ |
| CO-10 | Level complete | All dots eaten | Both advance to next level | ⚪ |

---

### 4. Leaderboards

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| LB-01 | Button visible | Game Over screen | Leaderboard button shows | ⚪ |
| LB-02 | Open leaderboard | Click button | Panel displays top 10 | ⚪ |
| LB-03 | Empty state | No scores yet | "No scores yet!" message | ⚪ |
| LB-04 | Score saved | Complete game | Score appears in list | ⚪ |
| LB-05 | Top 10 limit | 11+ scores | Only top 10 retained | ⚪ |
| LB-06 | Clear all | Click Clear + confirm | All scores removed | ⚪ |

---

### 5. Share Score

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| SS-01 | Button visible | Game Over screen | Share button shows | ⚪ |
| SS-02 | Web Share (mobile) | Click on mobile | Native share dialog opens | ⚪ |
| SS-03 | Clipboard fallback | Click on desktop | "Copied to clipboard" alert | ⚪ |
| SS-04 | Share text format | Check copied text | Includes score, level, URL | ⚪ |

---

### 6. Accessibility Features

| ID | Test | Steps | Expected | Status |
|----|------|-------|----------|--------|
| AC-01 | Colorblind toggle | Enable in Settings | Ghost colors change | ⚪ |
| AC-02 | Colorblind - Blinky | Check red ghost | Brighter red (#FF4444) | ⚪ |
| AC-03 | Colorblind - Pinky | Check pink ghost | Blue (#4488FF) | ⚪ |
| AC-04 | Colorblind - Inky | Check cyan ghost | Green (#44FF44) | ⚪ |
| AC-05 | Large Pac-Man | Enable setting | Pac-Man size increases | ⚪ |
| AC-06 | Reduced animation | Enable setting | Mouth doesn't animate | ⚪ |

---

### 7. Cross-Browser Testing

| ID | Test | Browser | Expected | Status |
|----|------|---------|----------|--------|
| CB-01 | Desktop Chrome | Chrome 120+ | All features work | ⚪ |
| CB-02 | Desktop Firefox | Firefox 120+ | All features work | ⚪ |
| CB-03 | Desktop Safari | Safari 17+ | All features work | ⚪ |
| CB-04 | Desktop Edge | Edge 120+ | All features work | ⚪ |

---

### 8. Mobile Testing

| ID | Test | Device | Expected | Status |
|----|------|--------|----------|--------|
| MB-01 | iOS Safari | iPhone 12+ | Touch controls work | ⚪ |
| MB-02 | Android Chrome | Pixel/Samsung | Touch controls work | ⚪ |
| MB-03 | Mode selection | Mobile | Buttons tappable | ⚪ |
| MB-04 | Web Share | Mobile | Native share works | ⚪ |
| MB-05 | Responsive UI | Various sizes | UI scales properly | ⚪ |

---

## 🐛 Bug Tracking

| ID | Severity | Description | Status |
|----|----------|-------------|--------|
| - | - | No bugs reported yet | - |

---

## ✅ Sign-off Criteria

- [ ] All 48 test cases executed
- [ ] Zero critical bugs
- [ ] Zero high-priority bugs
- [ ] Medium bugs < 5
- [ ] All modes playable
- [ ] Leaderboards working
- [ ] Share functionality working
- [ ] Accessibility features working

---

## 📊 Test Results Summary

| Category | Pass | Fail | Skip |
|----------|------|------|------|
| Mode Selection | 0 | 0 | 5 |
| Competitive Mode | 0 | 0 | 8 |
| Cooperative Mode | 0 | 0 | 10 |
| Leaderboards | 0 | 0 | 6 |
| Share Score | 0 | 0 | 4 |
| Accessibility | 0 | 0 | 6 |
| Cross-Browser | 0 | 0 | 4 |
| Mobile | 0 | 0 | 5 |
| **TOTAL** | **0** | **0** | **48** |

---

**QA Sign-off:** ⚪ PENDING  
**Date:** ___________  
**Signed by:** 🪨 Rocky
