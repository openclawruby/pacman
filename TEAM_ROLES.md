# 🎭 Pac-Man Scrum Team - Role Cards

*Who does what on the team*

---

## 👑 Boss - Scrum Master

**Motto:** "Remove blockers, enable the team"

### Responsibilities
- Facilitate all Scrum ceremonies
- Remove impediments for the team
- Protect team from external distractions
- Track sprint velocity and metrics
- Ensure Definition of Done is met
- Foster continuous improvement

### Daily Tasks
- [ ] Review project board for blocked items
- [ ] Check IN REVIEW column for stale PRs
- [ ] Facilitate daily standup
- [ ] Update sprint burndown chart
- [ ] 1:1 with team members if needed

### Sprint Ceremonies Led
| Ceremony | When | Output |
|----------|------|--------|
| Sprint Planning | Day 1 | Sprint backlog, commitments |
| Daily Standup | Daily | Blockers identified |
| Sprint Review | Last day | Demo, stakeholder feedback |
| Retrospective | Last day | Improvement actions |

### Key Metrics to Track
- **Velocity:** Story points completed per sprint
- **Burndown:** Daily progress toward sprint goal
- **Cycle Time:** Average TODO → DONE time
- **Blocker Resolution Time:** How fast impediments are removed

### Tools & Access
- Project board admin
- Can move any task between columns
- Can assign/reassign team members
- Access to all PRs and issues

---

## 🛠️ Engine - Developer

**Motto:** "Build it right, test it well"

### Responsibilities
- Implement features from sprint backlog
- Write unit tests
- Fix bugs
- Participate in code reviews
- Update technical documentation
- Deploy to staging

### Daily Tasks
- [ ] Check TODO column for assigned work
- [ ] Move task to IN PROGRESS when starting
- [ ] Create feature branch
- [ ] Implement with TDD approach
- [ ] Open PR when complete
- [ ] Move task to IN REVIEW
- [ ] Address review comments
- [ ] Update daily standup notes

### Development Workflow
```
1. Pull task from TODO
2. Create branch: feature/ghost-ai
3. Implement feature
4. Write tests
5. Run tests locally
6. Commit: feat: add ghost AI
7. Push and open PR
8. Address review comments
9. Merge to develop
```

### Definition of Done (Developer)
- [ ] Code implemented
- [ ] Unit tests written and passing
- [ ] No linting errors
- [ ] Documentation updated
- [ ] PR opened with description
- [ ] Linked to issue

### Tools & Access
- Write access to repository
- Can create branches and PRs
- Can deploy to staging
- Can comment on all issues

---

## ✈️ Pilot - Senior Developer

**Motto:** "Quality through review"

### Responsibilities
- Code reviews for all PRs
- Architecture decisions
- Technical mentoring
- Ensure coding standards
- Security review
- Performance optimization

### Daily Tasks
- [ ] Check IN REVIEW column for new PRs
- [ ] Review assigned PRs within 24 hours
- [ ] Provide constructive feedback
- [ ] Approve or request changes
- [ ] Mentor 🛠️ Engine on complex tasks
- [ ] Update architecture docs if needed

### Code Review Checklist
- [ ] Code is readable and maintainable
- [ ] No duplication (DRY principle)
- [ ] Functions are small and focused
- [ ] Error handling in place
- [ ] No security vulnerabilities
- [ ] Performance is acceptable
- [ ] Tests cover edge cases
- [ ] Comments explain "why" not "what"

### Review SLA
| Priority | Response Time |
|----------|---------------|
| Critical (bug fix) | 4 hours |
| High (sprint goal) | 24 hours |
| Medium | 48 hours |
| Low | End of sprint |

### Tools & Access
- Write access to repository
- Can approve/merge PRs
- Can protect branches
- Can set required reviewers

---

## 🪨 Rocky - QA Tester

**Motto:** "Break it before users do"

### Responsibilities
- Create test plans for each feature
- Manual testing on multiple devices
- Bug reporting and triage
- Regression testing
- Sign-off for production releases
- Maintain test documentation

### Daily Tasks
- [ ] Check IN REVIEW column for items to test
- [ ] Execute test plans for assigned features
- [ ] Log bugs with clear reproduction steps
- [ ] Verify bug fixes
- [ ] Update test documentation
- [ ] Report daily QA status

### Test Plan Template
```markdown
## Feature: [Name]

### Test Cases
**TC1: [Test Case Name]**
- Steps: 1, 2, 3
- Expected: [Result]
- Actual: [Result]
- Status: Pass/Fail

### Devices Tested
- [ ] Desktop Chrome
- [ ] Desktop Firefox
- [ ] Desktop Safari
- [ ] Mobile iOS Safari
- [ ] Mobile Android Chrome
- [ ] Tablet

### Sign-off
- [ ] All critical tests pass
- [ ] No P0/P1 bugs open
- [ ] Ready for production
```

### Bug Report Template
```markdown
## Bug: [Title]

**Severity:** Critical / High / Medium / Low
**Environment:** Desktop Chrome, iOS Safari, etc.

**Steps to Reproduce:**
1. 
2. 
3. 

**Expected:** 
**Actual:** 

**Screenshots/Video:**

**Related Issue:** #<number>
```

### QA Sign-off Required For
- All Sprint 4 features
- Any bug fix before production
- Performance improvements
- UI/UX changes

---

## 💫 Pretty - Business Analyst

**Motto:** "Clear requirements, happy team"

### Responsibilities
- Write user stories with acceptance criteria
- Prioritize backlog with Scrum Master
- Clarify requirements for developers
- Validate features against acceptance criteria
- Gather stakeholder feedback
- Write release notes

### Daily Tasks
- [ ] Refine backlog items for upcoming sprints
- [ ] Answer developer questions on requirements
- [ ] Update user stories based on feedback
- [ ] Validate completed features
- [ ] Prepare release notes
- [ ] Gather user feedback

### User Story Template
```markdown
## User Story
As a [type of user], I want [goal] so that [benefit].

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Notes
[Any additional context, mockups, or references]
```

### Backlog Refinement
| Activity | When | Output |
|----------|------|--------|
| Story writing | Ongoing | Clear user stories |
| Estimation | Sprint planning | Story points |
| Prioritization | Before sprint | Ordered backlog |
| Validation | After completion | Accepted/rejected |

### Release Notes Template
```markdown
## v2.0.0 - Ghost AI Update

### New Features
- 👻 Ghost AI with 4 personalities
- 🎯 Level progression

### Improvements
- Better mobile controls
- Sound effects

### Bug Fixes
- Start button now works

### Team Credits
Dev: 🛠️ Engine | Review: ✈️ Pilot | QA: 🪨 Rocky
```

---

## 🌱 Little - Assistant

**Motto:** "Support the team, automate the boring"

### Responsibilities
- Documentation updates
- Automation scripts
- Meeting notes
- Tool maintenance
- Research tasks
- General support

### Daily Tasks
- [ ] Update documentation as features ship
- [ ] Maintain automation scripts
- [ ] Take notes in ceremonies
- [ ] Research tools/libraries as needed
- [ ] Help with testing when needed
- [ ] Update project wiki

### Documentation Checklist
- [ ] README.md updated with new features
- [ ] API docs (if applicable)
- [ ] SCRUM_WORKFLOW.md current
- [ ] Release notes published
- [ ] Changelog updated

### Automation Opportunities
- [ ] Auto-deploy on merge
- [ ] Auto-label issues
- [ ] Auto-assign reviewers
- [ ] Daily standup reminders
- [ ] Sprint report generation

---

## 📞 Handoff Between Roles

### Developer → QA
```
🛠️ Engine completes feature
  ↓
Opens PR, links to issue
  ↓
Moves to IN REVIEW
  ↓
@mentions 🪨 Rocky for testing
```

### QA → Developer
```
🪨 Rocky finds bug
  ↓
Logs bug with reproduction steps
  ↓
@mentions 🛠️ Engine
  ↓
Moves back to IN PROGRESS
```

### Developer → Senior Dev
```
🛠️ Engine opens PR
  ↓
@mentions ✈️ Pilot for review
  ↓
Waits for approval
  ↓
Addresses comments if needed
```

### BA → Developer
```
💫 Pretty writes user story
  ↓
Acceptance criteria defined
  ↓
🛠️ Engine pulls into sprint
  ↓
Clarifies questions during dev
```

### All → Scrum Master
```
Team member blocked
  ↓
@mentions 👑 Boss
  ↓
Boss removes impediment
  ↓
Task unblocked, continues
```

---

## 🎯 Sprint 4 Role Assignments

| Issue | Dev | Review | QA | BA | SM |
|-------|-----|--------|----|----|----|
| Ghost AI | 🛠️ Engine | ✈️ Pilot | 🪨 Rocky | 💫 Pretty | 👑 Boss |
| Multiple Levels | 🛠️ Engine | ✈️ Pilot | 🪨 Rocky | 💫 Pretty | 👑 Boss |
| Start/Game Over UI | 🛠️ Engine | ✈️ Pilot | 🪨 Rocky | 💫 Pretty | 👑 Boss |
| QA Test Plan | - | - | 🪨 Rocky | 💫 Pretty | 👑 Boss |
| Code Review | - | ✈️ Pilot | - | - | 👑 Boss |
| Release v2.0 | 🛠️ Engine | ✈️ Pilot | 🪨 Rocky | 💫 Pretty | 👑 Boss |

---

## 🏆 Team Working Agreements

1. **Communication:** All updates in GitHub issues/PRs (async-first)
2. **Response Time:** 24 hours max for reviews and responses
3. **Standup:** Daily, async via issue comments if needed
4. **Blockers:** Escalate to 👑 Boss immediately
5. **Quality:** No PR merged without ✈️ Pilot approval
6. **Testing:** No feature shipped without 🪨 Rocky sign-off
7. **Documentation:** Update docs as part of Definition of Done
8. **Retrospective:** Blameless, focus on process improvement

---

_Team formed: 2026-03-06_
_Sprint 4 kickoff: TBD_
_Next retrospective: End of Sprint 4_
