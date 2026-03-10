# 📋 Changelog - Pac-Man

All notable changes to this project will be documented in this file.

---

## [v2.5] - 2026-03-10 - Multiplayer & Social 🎉

### 🆕 New Features

#### Multiplayer Modes
- **⚔️ Competitive Mode** - 2P turn-based battle
  - Player 1 and Player 2 take turns
  - Highest score wins
  - Automatic player switching
  - Results screen with winner announcement

- **🤝 Cooperative Mode** - 2P team gameplay
  - Shared lives pool (6 lives total)
  - Work together to complete levels
  - Combined team score

#### Social Features
- **📤 Share Score** - Share your achievements
  - Web Share API integration (mobile)
  - Clipboard fallback (desktop)
  - Formatted share text with score and level

- **🏆 Leaderboards** - Track top scores
  - Local storage (top 10 scores)
  - Shows: name, score, level, date
  - Clear all option
  - Accessible from Game Over screen

### 🎨 UI Updates
- New Mode Selection Screen
  - Beautiful card-based design
  - Mode descriptions
  - Easy navigation
- Updated Game Over screen
  - Competitive results panel
  - Cooperative results panel
  - Share button
  - Leaderboard button
- Version updated to v2.5

### 🐛 Bug Fixes
- Fixed mode reset on main menu return
- Fixed score tracking in multiplayer modes

### 📝 Technical
- Added game mode state management
- Added player state tracking (P1/P2)
- LocalStorage schema for leaderboards
- Sprint 9 documentation added

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot (pending)
- **QA:** 🪨 Rocky (pending)
- **BA:** 💫 Pretty
- **SM:** 👑 Boss

---

## [v2.4] - 2026-03-09 - Bug Fixes & Polish

### 🐛 Bug Fixes
- Fixed tunnel wrap-around (left/right pass-through)
- Ghosts now properly pass through tunnels
- Fixed edge collision detection

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot
- **QA:** 🪨 Rocky
- **SM:** 👑 Boss

---

## [v2.3] - 2026-03-08 - UX Polish

### 🆕 New Features
- 📚 Onboarding Tutorial
- ⚙️ Settings Menu
- ⏸️ Pause Menu
- ✨ Animations & Effects
- 🏆 Achievements System

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot
- **QA:** 🪨 Rocky
- **SM:** 👑 Boss

---

## [v2.2] - 2026-03-07 - Advanced Features

### 🆕 New Features
- Multiplayer mode (local)
- Power-up system
- User feedback form
- Performance optimization

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot
- **QA:** 🪨 Rocky
- **SM:** 👑 Boss

---

## [v2.1] - 2026-03-06 - UX Polish Update

### 🆕 New Features
- Tunnel pass-through (left/right edges)
- 5-second countdown before game start
- Power pellet timer
- Bonus fruit system
- Mobile swipe improvements

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot
- **QA:** 🪨 Rocky
- **SM:** 👑 Boss

---

## [v2.0] - 2026-03-05 - Ghost AI Update

### 🆕 New Features
- 👻 Ghost AI with 4 personalities
  - Blinky (direct chase)
  - Pinky (ambush ahead)
  - Inky (vector-based)
  - Clyde (scatter/chase)
- 🎯 Multiple levels with difficulty scaling
- 🎮 Start/Game Over UI screens
- 🧪 QA Test Plan
- 📝 Code Review process

### 👥 Team Credits
- **Dev:** 🛠️ Engine
- **Review:** ✈️ Pilot
- **QA:** 🪨 Rocky
- **BA:** 💫 Pretty
- **SM:** 👑 Boss

---

## [v1.0] - 2026-03-04 - Initial Release

### 🆕 Features
- Basic Pac-Man gameplay
- Single maze layout
- Dot collection
- Ghost avoidance
- Score tracking
- Lives system

---

**Version Format:** [MAJOR.MINOR] - DATE - Name

**Types of Changes:**
- 🆕 New Features
- 🐛 Bug Fixes
- 🎨 UI/UX Updates
- 📝 Documentation
- ⚡ Performance
