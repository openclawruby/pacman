# 🏆 Pac-Man Scrum Team Workflow

*Professional Agile Development Process*

---

## 👥 Team Roles & Responsibilities

| Role | Member | Responsibilities |
|------|--------|------------------|
| **Scrum Master** | 👑 Boss | Remove blockers, facilitate ceremonies, ensure process adherence |
| **Developer** | 🛠️ Engine | Implementation, coding, unit testing |
| **Senior Developer** | ✈️ Pilot | Code reviews, architecture decisions, mentoring |
| **QA Tester** | 🪨 Rocky | Test plans, manual testing, bug reports |
| **Business Analyst** | 💫 Pretty | Requirements, user stories, acceptance criteria |
| **Assistant** | 🌱 Little | Documentation, automation, support tasks |

---

## 📋 Project Board Structure

### Columns (Kanban Flow)

```
┌─────────────┬─────────────┬─────────────┬─────────────┬─────────────┐
│   BACKLOG   │    TODO     │  IN PROGRESS│  IN REVIEW  │    DONE     │
├─────────────┼─────────────┼─────────────┼─────────────┼─────────────┤
│ Future ideas│ Ready to    │ Currently   │ PR open,    │ Completed,  │
│ & icebox    │ start       │ working     │ awaiting    │ tested,     │
│             │ Sprint 4    │             │ review      │ merged      │
└─────────────┴─────────────┴─────────────┴─────────────┴─────────────┘
```

### Swimlanes (Optional - for GitHub Projects)
- **Sprint 4** (Current) - Ghost AI, Levels, UI Polish
- **Sprint 5** (Next) - Bonus Fruits, Ghost Behavior Refinement
- **Bugs** - Critical fixes

---

## 🔄 Task Flow (End-to-End)

### 1. Backlog Refinement (💫 Pretty + 👑 Boss)
- BA creates user stories with acceptance criteria
- Scrum Master prioritizes based on value
- Team estimates effort during sprint planning

### 2. Sprint Planning (Full Team)
- Select stories for sprint (Sprint 4 = Ghost AI + Levels + UI)
- Break into tasks
- Assign to developers
- **Definition of Ready:**
  - [ ] Clear description
  - [ ] Acceptance criteria defined
  - [ ] Estimated effort
  - [ ] Dependencies identified

### 3. Development (🛠️ Engine)
```
TODO → IN PROGRESS
```
- Create feature branch: `feature/ghost-ai`
- Implement with TDD approach
- Update unit tests
- Mark task as IN PROGRESS

### 4. Code Review (✈️ Pilot)
```
IN PROGRESS → IN REVIEW
```
- Developer opens PR
- Senior Developer reviews:
  - [ ] Code quality
  - [ ] Test coverage
  - [ ] Follows architecture
  - [ ] No security issues
- Request changes or approve

### 5. QA Testing (🪨 Rocky)
```
IN REVIEW → (back to IN PROGRESS if bugs found)
```
- QA tests against acceptance criteria
- Manual testing on multiple devices
- Bug reports linked to PR
- Sign off for production

### 6. Release (👑 Boss + 🛠️ Engine)
```
IN REVIEW → DONE
```
- Scrum Master approves merge
- Developer merges to `develop`
- Auto-deploy to staging via CI/CD
- Tag release: `v2.0.0`
- Deploy to production (GitHub Pages)

---

## 📅 Sprint Cadence

| Ceremony | When | Duration | Attendees |
|----------|------|----------|-----------|
| **Sprint Planning** | Sprint start | 2 hours | Full team |
| **Daily Standup** | Every day | 15 min | Full team |
| **Sprint Review** | Sprint end | 1 hour | Full team + stakeholders |
| **Retrospective** | Sprint end | 1 hour | Full team |

### Daily Standup Format
Each team member answers:
1. What did I do yesterday?
2. What will I do today?
3. Any blockers?

---

## 🎯 Sprint 4 Board Setup

### Current Sprint Goals
1. ✅ Add Ghost AI (🛠️ Engine, ✈️ Pilot review)
2. ✅ Add Multiple Levels (🛠️ Engine, ✈️ Pilot review)
3. ✅ Add Start/Game Over Screens (🛠️ Engine, 🪨 Rocky QA)

### Issue Labels Structure
| Label | Purpose | Color |
|-------|---------|-------|
| `sprint:4` | Current sprint | Blue |
| `sprint:5` | Next sprint | Light blue |
| `feature` | New functionality | Green |
| `bug` | Defect to fix | Red |
| `enhancement` | Improvement | Yellow |
| `priority:high` | Must-have | Orange |
| `priority:medium` | Should-have | Light orange |
| `game-mechanic` | Gameplay feature | Purple |
| `ui` | User interface | Pink |
| `blocked` | Waiting on something | Gray |

---

## 🔗 GitHub Integration

### Branch Strategy (GitFlow)
```
main (production)
  ↑
develop (staging)
  ↑
feature/* (feature branches)
  ↑
hotfix/* (urgent fixes)
```

### PR Template
```markdown
## Description
What does this PR do?

## Type of Change
- [ ] Feature
- [ ] Bug fix
- [ ] Refactoring

## Testing
- [ ] Unit tests pass
- [ ] Manual testing completed
- [ ] QA approved (@🪨 Rocky)

## Reviewers
- [ ] Code review by @✈️ Pilot

## Screenshots (if applicable)

## Related Issues
Closes #<issue-number>
```

### CI/CD Pipeline
```yaml
# .github/workflows/deploy.yml
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./
```

---

## 📊 Automation Rules (GitHub Projects)

### Configure in Project Settings → Automation

| Trigger | Action |
|---------|--------|
| Issue opened | Add to BACKLOG |
| Issue labeled `sprint:4` | Move to TODO |
| Issue assigned to 🛠️ Engine | Move to IN PROGRESS |
| PR opened | Add to IN REVIEW |
| PR merged | Move to DONE |
| Issue closed | Move to DONE |

### Manual Moves
- Scrum Master can move any task
- Developers move their own tasks
- QA can move to IN REVIEW after testing

---

## 🚀 Release Process

### Pre-Release Checklist (👑 Boss)
- [ ] All sprint stories in DONE
- [ ] No critical bugs open
- [ ] QA sign-off complete
- [ ] Documentation updated
- [ ] Version number incremented

### Release Steps (🛠️ Engine)
```bash
# 1. Merge develop to main
git checkout main
git merge develop
git tag -a v2.0.0 -m "Release v2.0.0 - Ghost AI + Levels"
git push origin main --tags

# 2. CI/CD auto-deploys to GitHub Pages
# 3. Verify production: https://openclawruby.github.io/pacman
```

### Release Notes Template
```markdown
## v2.0.0 - Ghost AI Update

### New Features
- 👻 Ghost AI with 4 distinct personalities
- 🎯 Level progression system
- 🎬 Start screen & Game Over screen

### Improvements
- Fixed start button CSS bug
- Added debug logging

### Bug Fixes
- Resolved mobile control responsiveness

### Team
- Dev: 🛠️ Engine
- Review: ✈️ Pilot
- QA: 🪨 Rocky
- BA: 💫 Pretty
- SM: 👑 Boss
```

---

## 📈 Metrics & Reporting

### Sprint Metrics (👑 Boss tracks)
- **Velocity:** Story points completed per sprint
- **Burndown:** Daily progress chart
- **Cycle Time:** TODO → DONE duration
- **Defect Rate:** Bugs found in QA

### Dashboard (GitHub Projects)
- Issues by status (pie chart)
- Sprint progress (burndown)
- Team workload (assignee distribution)

---

## 🎭 Role-Specific Views

### 👑 Boss (Scrum Master)
- Monitor all columns
- Identify blocked tasks
- Facilitate daily standups
- Remove impediments
- Track sprint velocity

### 🛠️ Engine (Developer)
- Focus on IN PROGRESS column
- Pull from TODO when available
- Update task status daily
- Link PRs to issues

### ✈️ Pilot (Senior Dev)
- Monitor IN REVIEW column
- Prioritize code reviews
- Ensure code quality standards
- Mentor on architecture

### 🪨 Rocky (QA)
- Test items in IN REVIEW
- Create bug reports
- Verify fixes
- Sign off on releases

### 💫 Pretty (BA)
- Maintain BACKLOG
- Refine user stories
- Clarify requirements
- Validate acceptance criteria

---

## 📞 Communication Channels

| Purpose | Channel |
|---------|---------|
| Daily standup | GitHub Issues comments |
| Code review | PR comments |
| Blockers | @mention Scrum Master |
| Questions | Issue discussions |
| Release announcements | GitHub Releases |

---

## 🎯 Success Criteria

### Sprint Success
- [ ] All committed stories completed
- [ ] No critical bugs in production
- [ ] Team velocity maintained/improved
- [ ] Retrospective actions implemented

### Project Success
- [ ] v2.0 released with Ghost AI
- [ ] v2.1 released with Levels
- [ ] User engagement metrics improved
- [ ] Code quality maintained

---

_Document Version: 1.0_
_Last Updated: 2026-03-06_
_Next Review: Sprint 4 Retrospective_
