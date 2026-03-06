# 🛠️ Pac-Man Project Scripts

Automation scripts for project setup and development workflow.

---

## Quick Start

### 1. Get GitHub Token
```bash
# Go to: https://github.com/settings/tokens
# Create token with scope: repo
# Copy the token (starts with ghp_)
```

### 2. Set Token
```bash
export GITHUB_TOKEN=ghp_your_token_here
```

### 3. Run Scripts
```bash
# Create all Sprint 4 issues
./scripts/setup-sprint-4.sh
```

---

## Available Scripts

### `setup-sprint-4.sh`
Creates all 6 Sprint 4 issues with proper labels, descriptions, and metadata.

**What it does:**
- Creates 6 issues (Ghost AI, Levels, UI, QA, Review, Release)
- Adds labels: `sprint:4`, `priority:*`, `feature`, etc.
- Includes full acceptance criteria and technical notes

**Usage:**
```bash
export GITHUB_TOKEN=ghp_...
./scripts/setup-sprint-4.sh
```

---

## Security Notes

⚠️ **Never commit tokens to Git!**

- Scripts use `GITHUB_TOKEN` environment variable
- Token is not stored in any file
- GitHub secret scanning will block pushes with tokens

If you accidentally commit a token:
1. GitHub will block the push
2. Go to the URL in the error message
3. Allow or revoke the token
4. Remove token from commit history

---

## Script Development

### Best Practices
1. Use environment variables for secrets
2. Add error handling (`set -e`)
3. Provide clear usage instructions
4. Log progress with emoji indicators
5. Test with dry-run when possible

### Common Patterns
```bash
# Check for required token
TOKEN="${GITHUB_TOKEN:-}"
if [ -z "$TOKEN" ]; then
    echo "❌ GITHUB_TOKEN not set!"
    exit 1
fi

# Make API call
response=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/...")

# Check response
if echo "$response" | grep -q '"number"'; then
    echo "✅ Success"
else
    echo "❌ Failed"
fi
```

---

## Troubleshooting

### "GITHUB_TOKEN not set"
```bash
export GITHUB_TOKEN=ghp_your_token_here
```

### "Permission denied"
```bash
chmod +x scripts/*.sh
```

### "Problems parsing JSON"
- Check for unescaped quotes in issue body
- Use `\n` for newlines in JSON
- Test with `echo "$body" | jq .`

### "Rate limit exceeded"
- Wait a few minutes
- GitHub API limit: 5000 requests/hour for authenticated users

---

## Additional Resources

- [GitHub API Docs](https://docs.github.com/en/rest)
- [GitHub CLI](https://cli.github.com/) - Alternative to curl
- [Secret Scanning](https://docs.github.com/en/code-security/secret-scanning)

---

_Scripts maintained by 🌱 Little (Assistant)_
