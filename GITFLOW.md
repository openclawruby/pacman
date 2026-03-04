# GitFlow Workflow

## Branch Structure

```
master (production)
  ↑
develop (integration)
  ↑
  ├── feature/mobile-controls
  ├── feature/power-pellets
  └── release/v1.0
```

## Branches

| Branch | Purpose | Created From | Merges To |
|--------|---------|--------------|-----------|
| `master` | Production code | - | - |
| `develop` | Integration branch | master | master |
| `feature/*` | New features | develop | develop |
| `release/*` | Release prep | develop | master + develop |
| `hotfix/*` | Urgent fixes | master | master + develop |

## Workflow

### 1. Start a Feature
```bash
git checkout develop
git pull
git checkout -b feature/my-feature
# work on feature...
git push -u origin feature/my-feature
```

### 2. Finish a Feature
```bash
git checkout develop
git merge --no-ff feature/my-feature
git push
git branch -d feature/my-feature
```

### 3. Create Release
```bash
git checkout develop
git checkout -b release/v1.0
# final tweaks, bump version
git checkout master
git merge --no-ff release/v1.0
git tag -a v1.0 -m "Release v1.0"
git push --tags
git checkout develop
git merge --no-ff release/v1.0
git push
```

### 4. Hotfix
```bash
git checkout master
git checkout -b hotfix/fix-bug
# fix bug
git checkout master
git merge --no-ff hotfix/fix-bug
git tag -a v1.1 -m "Hotfix v1.1"
git checkout develop
git merge --no-ff hotfix/fix-bug
git push
```

## Rules

- **Never push directly to master**
- **Always create PRs for review**
- **Keep develop shippable**
- **Delete branches after merge**

## Current Branches

- `master` - Production (v0.1)
- `develop` - Development (current work)
