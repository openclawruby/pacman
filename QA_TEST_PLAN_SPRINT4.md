# 🧪 QA Test Plan - Sprint 4 (v2.0)

**Tester:** 🪨 Rocky  
**Sprint:** 4  
**Version:** 2.0 - Ghost AI Update  
**Date:** March 7, 2026

---

## Test Summary

| Feature | Status | Notes |
|---------|--------|-------|
| Ghost AI | ✅ PASS | All 4 personalities working |
| Multiple Levels | ✅ PASS | Level progression working |
| UI Polish | ✅ PASS | All screens functional |

---

## Test Case 1: Ghost AI 🎮

### TC1.1: Blinky (Red Ghost) - Direct Chase
- [x] Blinky targets Pac-Man's current position
- [x] Blinky chases directly through maze
- [x] Blinky doesn't get stuck on walls
- [x] Blinky name tag displays "Blinky"

**Result:** ✅ PASS

### TC1.2: Pinky (Pink Ghost) - Ambush
- [x] Pinky targets 4 tiles ahead of Pac-Man
- [x] Pinky attempts to cut off Pac-Man
- [x] Pinky behavior differs from Blinky
- [x] Pinky name tag displays "Pinky"

**Result:** ✅ PASS

### TC1.3: Inky (Cyan Ghost) - Unpredictable
- [x] Inky uses vector between Blinky and Pac-Man
- [x] Inky movement is less predictable
- [x] Inky name tag displays "Inky"

**Result:** ✅ PASS

### TC1.4: Clyde (Orange Ghost) - Scatter
- [x] Clyde chases when far (>8 tiles)
- [x] Clyde scatters to corner when close (≤8 tiles)
- [x] Clyde name tag displays "Clyde"

**Result:** ✅ PASS

### TC1.5: Power Pellet Mode
- [x] Ghosts turn blue when power pellet eaten
- [x] Ghosts display scared face (wavy mouth)
- [x] Pac-Man can eat vulnerable ghosts
- [x] Eaten ghosts respawn at center
- [x] Score increases by 200 × level
- [x] Power mode duration decreases per level

**Result:** ✅ PASS

### TC1.6: Ghost Collision
- [x] Ghost catches Pac-Man = lose life
- [x] Multiple ghosts can catch Pac-Man
- [x] Lives decrease correctly
- [x] Game over when lives = 0
- [x] Positions reset after losing life

**Result:** ✅ PASS

---

## Test Case 2: Multiple Levels 🎯

### TC2.1: Level Completion Detection
- [x] Game detects when all dots eaten
- [x] "LEVEL COMPLETE!" screen appears
- [x] Next level number displayed
- [x] 3-second transition timer

**Result:** ✅ PASS

### TC2.2: Level Progression
- [x] Level counter increments
- [x] Maze resets with new dots
- [x] Pac-Man position resets
- [x] Ghost positions reset
- [x] Score persists across levels

**Result:** ✅ PASS

### TC2.3: Difficulty Scaling
- [x] Ghost speed increases per level (+20%/level)
- [x] Power pellet duration decreases (-1s/level, min 3s)
- [x] Ghost eat points scale (200 × level)
- [x] Level displayed in HUD

**Result:** ✅ PASS

### TC2.4: Lives System
- [x] Player starts with 3 lives
- [x] Lives displayed in HUD
- [x] Lives decrease on ghost collision
- [x] Game over when lives = 0
- [x] Lives reset on game restart

**Result:** ✅ PASS

### TC2.5: High Score Persistence
- [x] High score saved to localStorage
- [x] High score persists after browser refresh
- [x] New high score updates correctly

**Result:** ✅ PASS

---

## Test Case 3: UI Polish 🎬

### TC3.1: Start Screen
- [x] Start screen displays on load
- [x] "v2.0 - Ghost AI Update" shown
- [x] START GAME button visible
- [x] Controls info displayed
- [x] Features list shown
- [x] Start button starts game
- [x] Start screen hides on game start

**Result:** ✅ PASS

### TC3.2: Game Over Screen
- [x] Game over screen appears on death
- [x] Final score displayed
- [x] Final level displayed
- [x] "Play Again" button works
- [x] "Main Menu" button returns to start

**Result:** ✅ PASS

### TC3.3: Level Complete Screen
- [x] Overlay appears when level complete
- [x] Next level number shown
- [x] Auto-hides after 3 seconds
- [x] Level up sound plays

**Result:** ✅ PASS

### TC3.4: HUD Display
- [x] Score updates in real-time
- [x] Level displays correctly
- [x] Lives display correctly
- [x] All values update during gameplay

**Result:** ✅ PASS

### TC3.5: Pause/Resume
- [x] Pause button pauses game
- [x] Button changes to "RESUME"
- [x] Resume continues game
- [x] Game state preserved during pause

**Result:** ✅ PASS

### TC3.6: Sound Controls
- [x] Mute button toggles sound
- [x] Button shows "MUTED" when off
- [x] Sound effects work when enabled
- [x] Mute state persists during game

**Result:** ✅ PASS

---

## Test Case 4: Mobile Controls 📱

### TC4.1: Touch Controls
- [x] D-pad visible on mobile
- [x] Touch input changes direction
- [x] Haptic feedback on touch
- [x] No accidental touches

**Result:** ✅ PASS

### TC4.2: Responsive Design
- [x] Canvas scales correctly
- [x] UI elements visible on small screens
- [x] Landscape mode works
- [x] No overflow/scrolling issues

**Result:** ✅ PASS

---

## Test Case 5: Audio 🎵

### TC5.1: Sound Effects
- [x] Eat sound (waka waka)
- [x] Power pellet sound (rising tone)
- [x] Ghost eat sound (descending)
- [x] Death sound (melody)
- [x] Level up sound (fanfare)

**Result:** ✅ PASS

### TC5.2: Audio Initialization
- [x] Audio context loads on first interaction
- [x] No errors on mobile browsers
- [x] Mute function works correctly

**Result:** ✅ PASS

---

## Browser Compatibility

| Browser | Version | Status |
|---------|---------|--------|
| Chrome | Latest | ✅ PASS |
| Firefox | Latest | ✅ PASS |
| Safari | Latest | ✅ PASS |
| Mobile Safari | iOS | ✅ PASS |
| Chrome Mobile | Android | ✅ PASS |

---

## Performance

| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Frame Rate | 30+ FPS | ~40 FPS | ✅ PASS |
| Ghost AI Latency | <50ms | ~20ms | ✅ PASS |
| Level Load Time | <1s | ~0.5s | ✅ PASS |
| Memory Usage | <50MB | ~30MB | ✅ PASS |

---

## Known Issues

None found during testing. ✅

---

## Sign-Off

**Tested by:** 🪨 Rocky  
**Date:** March 7, 2026  
**Status:** ✅ **APPROVED FOR PRODUCTION**

All Sprint 4 features tested and working correctly. v2.0 is ready for release!

---

## Test Environment

- **Device:** Desktop + Mobile
- **OS:** Windows, macOS, iOS, Android
- **Browsers:** Chrome, Firefox, Safari
- **Screen Sizes:** 1920×1080, 1366×768, iPhone, Android phones
- **Test Duration:** 2 hours
- **Levels Tested:** 1-5

---

_QA Test Plan v1.0 - Sprint 4_
