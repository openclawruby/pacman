# 🛠️ Sprint 9 Implementation Plan

**Start Date:** March 10, 2026  
**Status:** 🟡 IN PROGRESS

---

## 📋 Implementation Order

### Phase 1: Game Mode Selection (Day 1)
- [ ] Add mode selection screen after start screen
- [ ] Classic Mode (existing gameplay)
- [ ] Competitive Mode (2P turn-based)
- [ ] Cooperative Mode (2P simultaneous)

### Phase 2: Competitive Mode (Day 1-2)
- [ ] P1 and P2 score tracking
- [ ] Turn-based gameplay
- [ ] Winner announcement
- [ ] Play again option

### Phase 3: Cooperative Mode (Day 2-3)
- [ ] Second Pac-Man (P2 - different color)
- [ ] Shared lives pool
- [ ] Both must complete level
- [ ] Revive mechanic

### Phase 4: Leaderboards (Day 3-4)
- [ ] localStorage implementation
- [ ] Top 10 scores display
- [ ] Current rank indicator
- [ ] Clear leaderboard option

### Phase 5: Share Score (Day 4)
- [ ] Share button on Game Over
- [ ] Web Share API integration
- [ ] Clipboard fallback
- [ ] Formatted share text

### Phase 6: Accessibility (Day 5)
- [ ] Colorblind mode toggle
- [ ] Larger Pac-Man option
- [ ] Reduced animation toggle
- [ ] High contrast colors

### Phase 7: QA + Review (Day 6-7)
- [ ] Test all modes
- [ ] Code review
- [ ] Bug fixes
- [ ] v2.5 release

---

## 🎨 UI Components to Add

### Mode Selection Screen
```html
<div id="modeSelectScreen">
    <h2>SELECT MODE</h2>
    <button onclick="selectMode('classic')">🎮 Classic</button>
    <button onclick="selectMode('competitive')">⚔️ Competitive (2P)</button>
    <button onclick="selectMode('cooperative')">🤝 Cooperative (2P)</button>
</div>
```

### Leaderboard Panel
```html
<div id="leaderboardPanel">
    <h3>🏆 Leaderboard</h3>
    <ol id="leaderboardList"></ol>
</div>
```

### Share Button (Game Over)
```html
<button onclick="shareScore()">📤 Share Score</button>
```

---

## 💾 Data Structures

### Leaderboard Entry
```javascript
{
    name: "Player1",
    score: 5000,
    date: "2026-03-10",
    level: 5,
    mode: "classic"
}
```

### Game State Additions
```javascript
let gameMode = 'classic'; // classic, competitive, cooperative
let player2 = null; // For 2P modes
let p1Score = 0;
let p2Score = 0;
let currentPlayer = 1; // For turn-based
```

---

## 📁 Files to Modify

| File | Changes |
|------|---------|
| `index.html` | Add UI components, game logic |
| `docs/SPRINT9_PLAN.md` | Track progress |
| `docs/CHANGELOG.md` | Add v2.5 notes |

---

## ✅ Definition of Done (Per Feature)

- [ ] Code implemented
- [ ] Tested locally
- [ ] No console errors
- [ ] Works on mobile + desktop
- [ ] Documented in changelog

---

**Next Step:** Start Phase 1 - Mode Selection Screen
