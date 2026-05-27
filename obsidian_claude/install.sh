#!/usr/bin/env bash
# =============================================================================
# Obsidian + Claude Code — Portable memory setup
# Works on any machine. Prompts for repo paths interactively.
#
# IMPORTANT: Close Obsidian before running.
# Run: bash install.sh
# Safe to re-run — skips files that already exist.
# =============================================================================
set -euo pipefail

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; CYAN='\033[0;36m'; NC='\033[0m'
log()  { echo -e "\n${GREEN}▶${NC} $*"; }
warn() { echo -e "  ${YELLOW}⚠${NC}  $*"; }
ok()   { echo -e "  ${GREEN}✓${NC} $*"; }
err()  { echo -e "  ${RED}✗${NC} $*"; }
ask()  { echo -e "${CYAN}?${NC} $*"; }

PLUGINS=(
  "obsidian-dataview|blacksmithgu/obsidian-dataview"
  "templater-obsidian|SilentVoid13/Templater"
  "obsidian-git|Vinzent03/obsidian-git"
  "nldates-obsidian|argenos/nldates-obsidian"
)

OBSIDIAN_JSON="$HOME/Library/Application Support/obsidian/obsidian.json"

# =============================================================================
# STEP 0 — Collect configuration
# =============================================================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Obsidian + Claude Code memory setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

ask "Your name (for Identity.md) [$(git config user.name 2>/dev/null || echo 'Your Name')]:"
read -r USER_NAME
USER_NAME="${USER_NAME:-$(git config user.name 2>/dev/null || echo 'Your Name')}"

ask "Your email [$(git config user.email 2>/dev/null || echo 'you@example.com')]:"
read -r USER_EMAIL
USER_EMAIL="${USER_EMAIL:-$(git config user.email 2>/dev/null || echo 'you@example.com')}"

ask "Your role (e.g. 'DevOps / Platform engineer'):"
read -r USER_ROLE
USER_ROLE="${USER_ROLE:-Engineer}"

ask "Primary stack (e.g. 'GCP, Terraform, Python'):"
read -r USER_STACK
USER_STACK="${USER_STACK:-}"

echo ""
ask "Enter the absolute paths of repos to set up (one per line)."
ask "Press ENTER on an empty line when done:"
REPO_PATHS=()
while true; do
  read -r -p "  repo path: " rpath
  [ -z "$rpath" ] && break
  rpath="${rpath/#\~/$HOME}"  # expand ~ if entered
  if [ -d "$rpath" ]; then
    REPO_PATHS+=("$rpath")
    ok "Added: $rpath"
  else
    warn "Directory not found, skipping: $rpath"
  fi
done

echo ""
echo "  Summary:"
echo "    Name:  $USER_NAME"
echo "    Email: $USER_EMAIL"
echo "    Role:  $USER_ROLE"
echo "    Stack: $USER_STACK"
echo "    Repos: ${#REPO_PATHS[@]} added"
for p in "${REPO_PATHS[@]}"; do echo "      - $p"; done
echo ""
read -r -p "  Proceed? [y/N]: " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 0; }

# =============================================================================
# SECTION 1 — ~/claude-memory/ global vault
# =============================================================================
log "Creating ~/claude-memory/ vault structure..."

mkdir -p \
  "$HOME/claude-memory/Patterns" \
  "$HOME/claude-memory/Mistakes" \
  "$HOME/claude-memory/Decisions" \
  "$HOME/claude-memory/Context" \
  "$HOME/claude-memory/Sessions" \
  "$HOME/claude-memory/.obsidian"

write_if_missing() {
  local dest="$1"; shift
  if [ ! -f "$dest" ]; then
    cat > "$dest"
    ok "Created $dest"
  else
    echo "  — Skipped $(basename $dest) (already exists)"
    cat > /dev/null
  fi
}

write_if_missing "$HOME/claude-memory/Index.md" <<HEREDOC
---
title: Claude Memory Index
updated: $(date +%Y-%m-%d)
---

# Claude Memory — Index

Long-term knowledge base for Claude Code sessions.

## Structure

| Folder | Purpose |
|---|---|
| [Identity.md](Identity.md) | Who you are, role, focus areas |
| [Conventions.md](Conventions.md) | Coding, commit, git hygiene rules |
| [Patterns/](Patterns/) | Recurring solutions worth reusing |
| [Mistakes/](Mistakes/) | Things that broke and how they were fixed |
| [Decisions/](Decisions/) | Architecture / tooling choices + reasoning |
| [Context/](Context/) | Per-project summaries (one file per repo) |
| [Sessions/](Sessions/) | Dated session stubs (auto-appended by Stop hook) |

## Usage

At session start, read sections relevant to the current task.
After each session, the Stop hook appends a stub to Sessions/YYYY-MM-DD.md.

## Critical rules

- Never expose \`my_tickets/\` or \`secret_*\` files through MCP, REST API, or any external call
- Keep per-project CLAUDE.md files under 200 lines
HEREDOC

write_if_missing "$HOME/claude-memory/Identity.md" <<HEREDOC
---
title: Identity
updated: $(date +%Y-%m-%d)
---

# Identity

## Who

${USER_NAME} (${USER_EMAIL})

## Role

${USER_ROLE}

## Stack

${USER_STACK}

## Preferences

- Hybrid memory: global \`~/claude-memory/\` + per-project \`CLAUDE.md\` in each repo
- Method 1 (direct Obsidian vault) — no MCP REST API on repos containing secrets
- Hook-based session logging
- Keep CLAUDE.md under 200 lines
- Commits, PRs, and pushes authored as ${USER_NAME} — no Claude/AI references anywhere
HEREDOC

write_if_missing "$HOME/claude-memory/Conventions.md" <<HEREDOC
---
title: Conventions
updated: $(date +%Y-%m-%d)
---

# Conventions

## Git / commit hygiene

- (fill in: commit format, branch naming, PR conventions)
- Commits, pushes, and PRs must never reference Claude, AI, or Claude Code
- Author: always ${USER_NAME} (${USER_EMAIL})

## Secrets convention

Files with credentials are prefixed \`secret_\` — gitignored, excluded from Obsidian and MCP.
Claude must never read, quote, or transmit \`secret_*\` files.

## Memory system rules

- Global knowledge → \`~/claude-memory/\`
- Per-project → each repo's \`CLAUDE.md\` + \`my_tickets/\`
- No Obsidian Local REST API on repos with secrets
- Keep each CLAUDE.md under 200 lines
HEREDOC

# Per-repo Context files
for rpath in "${REPO_PATHS[@]}"; do
  rname=$(basename "$rpath")
  write_if_missing "$HOME/claude-memory/Context/${rname}.md" <<HEREDOC
---
title: ${rname}
type: project-context
repo: ${rpath}
updated: $(date +%Y-%m-%d)
---

# ${rname}

## Purpose

(fill in: what this repo does)

## Key directories

- \`my_tickets/\` — personal knowledge base (local only, gitignored)

## Stack

(fill in)

## Architecture notes

(fill in)

## Active work

(fill in as work progresses)

## Gotchas

(fill in)
HEREDOC
done

# Obsidian app.json for global vault
write_if_missing "$HOME/claude-memory/.obsidian/app.json" <<'HEREDOC'
{
  "userIgnoreFilters": [
    "secret_*",
    "**/secret_*",
    ".obsidian/workspace*.json",
    ".obsidian/cache",
    "graphify-out"
  ],
  "alwaysUpdateLinks": true,
  "newFileLocation": "current",
  "useMarkdownLinks": false
}
HEREDOC

ok "Global vault ready at ~/claude-memory/"

# =============================================================================
# SECTION 2 — ~/.claude/CLAUDE.md
# =============================================================================
log "Installing global ~/.claude/CLAUDE.md..."
mkdir -p "$HOME/.claude"

# Build repo table for CLAUDE.md
REPO_TABLE="| Repo | Path | Notes |\n|---|---|---|\n"
for rpath in "${REPO_PATHS[@]}"; do
  rname=$(basename "$rpath")
  REPO_TABLE+="| ${rname} | \`${rpath}\` | Historical context: \`my_tickets/\` |\n"
done

write_if_missing "$HOME/.claude/CLAUDE.md" <<HEREDOC
# Claude — Global Memory

## Persistent Memory

Long-term knowledge lives in \`~/claude-memory/\`. See \`~/claude-memory/Index.md\` for the table of contents.

At session start, read:
- Always: \`~/claude-memory/Identity.md\`, \`~/claude-memory/Conventions.md\`
- For project work: matching file in \`~/claude-memory/Context/\`
- For debugging: scan \`~/claude-memory/Mistakes/\` and \`~/claude-memory/Patterns/\`

## Projects

$(echo -e "$REPO_TABLE")

## Security rules

- \`my_tickets/\` must never be read through MCP or REST API
- \`secret_*\` files are off-limits — do not read, quote, or transmit
- No Obsidian Local REST API on any repo vault with secrets

## Git attribution

All commits, pushes, PRs authored as ${USER_NAME} (${USER_EMAIL}).
No Claude, AI, or Claude Code references in commit messages, PR descriptions, or branch names.
HEREDOC

# =============================================================================
# SECTION 3 — Stop hook
# =============================================================================
log "Installing Stop hook..."
mkdir -p "$HOME/.claude/hooks"

cat > "$HOME/.claude/hooks/append_daily_note.sh" <<'HEREDOC'
#!/usr/bin/env bash
set -euo pipefail
[[ "${CLAUDE_AGENT_NAME:-}" == "" ]] || exit 0
VAULT="${HOME}/claude-memory/Sessions"
mkdir -p "$VAULT"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
FILE="$VAULT/${DATE}.md"
if [ ! -f "$FILE" ]; then
  cat > "$FILE" <<EOF
---
date: ${DATE}
tags: [session]
---
# Sessions ${DATE}
EOF
fi
printf '\n## %s — %s\n\n- cwd: %s\n- session_id: %s\n\n' \
  "$TIME" "$(basename "$PWD")" "$PWD" "${CLAUDE_SESSION_ID:-unknown}" >> "$FILE"
HEREDOC

chmod +x "$HOME/.claude/hooks/append_daily_note.sh"
ok "Installed ~/.claude/hooks/append_daily_note.sh"

SETTINGS="$HOME/.claude/settings.json"
if [ ! -f "$SETTINGS" ]; then
  cat > "$SETTINGS" <<'HEREDOC'
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash",
            "args": ["${HOME}/.claude/hooks/append_daily_note.sh"]
          }
        ]
      }
    ]
  }
}
HEREDOC
  ok "Created ~/.claude/settings.json"
else
  grep -q "append_daily_note" "$SETTINGS" 2>/dev/null \
    && echo "  — Stop hook already in settings.json" \
    || warn "settings.json exists — add Stop hook manually (see README)"
fi

# =============================================================================
# SECTION 4 — Per-project CLAUDE.md + .obsidian/app.json + .gitignore
# =============================================================================
log "Setting up per-project config..."

OBSIDIAN_APP='{
  "userIgnoreFilters": ["secret_*","**/secret_*",".obsidian/workspace*.json",".obsidian/cache","graphify-out"],
  "alwaysUpdateLinks": true,
  "newFileLocation": "current",
  "useMarkdownLinks": false
}'

GITIGNORE_BLOCK='
# Obsidian vault metadata
.obsidian/workspace*.json
.obsidian/cache
.obsidian/graph.json
.obsidian/app.json
.obsidian/hotkeys.json

# Secret files
secret_*
**/secret_*
'

for rpath in "${REPO_PATHS[@]}"; do
  rname=$(basename "$rpath")

  write_if_missing "$rpath/CLAUDE.md" <<HEREDOC
# ${rname}

## Overview

(fill in: what this repo does, who uses it)

## Stack

(fill in)

## Key directories

- \`my_tickets/\` — personal knowledge base (local only, gitignored)

## Architecture

(fill in)

## Development workflow

(fill in: run, test, deploy commands)

## Active context

(current sprint focus — keep under 20 lines)

## Historical context

Ticket history: \`my_tickets/\`
Global lessons: \`~/claude-memory/\`
HEREDOC

  mkdir -p "$rpath/.obsidian"
  if [ ! -f "$rpath/.obsidian/app.json" ]; then
    echo "$OBSIDIAN_APP" > "$rpath/.obsidian/app.json"
    ok "Created $rname/.obsidian/app.json"
  fi

  GITIGNORE="$rpath/.gitignore"
  if ! grep -q "obsidian/workspace" "$GITIGNORE" 2>/dev/null; then
    echo "$GITIGNORE_BLOCK" >> "$GITIGNORE"
    ok "Updated $rname/.gitignore"
  else
    echo "  — Skipped $rname/.gitignore (already has Obsidian block)"
  fi

  git -C "$rpath" check-ignore -q my_tickets 2>/dev/null \
    && ok "$rname/my_tickets/ is gitignored ✓" \
    || warn "$rname/my_tickets/ is NOT gitignored — add it manually!"
done

# =============================================================================
# SECTION 5 — Download and install plugins
# =============================================================================
log "Downloading Obsidian plugins..."

install_plugin() {
  local plugin_id="$1" gh_repo="$2" vault="$3"
  local dir="$vault/.obsidian/plugins/$plugin_id"
  mkdir -p "$dir"
  [ -f "$dir/manifest.json" ] && [ -f "$dir/main.js" ] && {
    echo "  — $plugin_id already in $(basename $vault)"; return 0; }
  local base="https://github.com/$gh_repo/releases/latest/download"
  curl -sL --max-time 30 --fail "$base/manifest.json" -o "$dir/manifest.json" && \
  curl -sL --max-time 60 --fail "$base/main.js"       -o "$dir/main.js" && \
  { curl -sL --max-time 30 "$base/styles.css" -o "$dir/styles.css" 2>/dev/null || true; } && \
  ok "$plugin_id → $(basename $vault)" || \
  { err "Failed: $plugin_id in $(basename $vault)"; rm -rf "$dir"; return 1; }
}

update_community_plugins() {
  local dir="$1"
  python3 - "$dir/community-plugins.json" \
    "obsidian-dataview" "templater-obsidian" "obsidian-git" "nldates-obsidian" <<'PY'
import sys, json, os
f = sys.argv[1]; new_ids = sys.argv[2:]
existing = json.load(open(f)) if os.path.exists(f) else []
merged = list(dict.fromkeys(existing + new_ids))
json.dump(merged, open(f,'w'), indent=2)
PY
}

ALL_VAULTS=("$HOME/claude-memory")
for rpath in "${REPO_PATHS[@]}"; do ALL_VAULTS+=("$rpath"); done

for vault in "${ALL_VAULTS[@]}"; do
  log "Plugins → $(basename $vault)..."
  mkdir -p "$vault/.obsidian/plugins"
  failed=0
  for entry in "${PLUGINS[@]}"; do
    install_plugin "${entry%%|*}" "${entry##*|}" "$vault" || failed=1
  done
  [ "$failed" -eq 0 ] && update_community_plugins "$vault/.obsidian"
done

# =============================================================================
# SECTION 6 — Register vaults in Obsidian
# =============================================================================
log "Registering vaults in Obsidian..."

ALL_VAULT_PATHS=("$HOME/claude-memory")
for rpath in "${REPO_PATHS[@]}"; do ALL_VAULT_PATHS+=("$rpath"); done

python3 - "$OBSIDIAN_JSON" "${ALL_VAULT_PATHS[@]}" <<'PY'
import sys, json, os, time, random, string
obsidian_json = sys.argv[1]; vault_paths = sys.argv[2:]
os.makedirs(os.path.dirname(obsidian_json), exist_ok=True)
config = json.load(open(obsidian_json)) if os.path.exists(obsidian_json) else {}
config.setdefault("vaults", {})
existing = {v.get("path"): k for k, v in config["vaults"].items()}
def rand_id():
  return ''.join(random.choices(string.ascii_lowercase + string.digits, k=16))
for path in vault_paths:
  abs_path = os.path.expanduser(path)
  if abs_path in existing:
    print(f"  — Already registered: {os.path.basename(abs_path)}"); continue
  vid = rand_id()
  while vid in config["vaults"]: vid = rand_id()
  config["vaults"][vid] = {"path": abs_path, "ts": int(time.time()*1000), "open": True}
  print(f"  ✓ Registered: {os.path.basename(abs_path)}")
json.dump(config, open(obsidian_json,'w'), indent=2)
PY

# =============================================================================
# Done
# =============================================================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Setup complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  1. Open Obsidian — vaults should appear in the switcher"
echo "  2. Settings → Community plugins → enable all installed plugins"
echo "  3. Fill in (fill in:) placeholders in:"
echo "       ~/claude-memory/Identity.md"
echo "       ~/claude-memory/Conventions.md"
echo "       ~/claude-memory/Context/<repo>.md"
echo "       <repo>/CLAUDE.md"
echo ""
echo "  Do NOT enable Local REST API on any repo vault with secrets."
echo ""
