# Obsidian + Claude Code — Portable Memory Setup

A hybrid long-term memory system for Claude Code using Obsidian as the knowledge base.

## What this does

Gives Claude Code persistent, cross-session memory without token bloat or context leakage.

| Layer | Where | Purpose |
|---|---|---|
| **Global** | `~/claude-memory/` | Identity, conventions, cross-project lessons. Loaded every session via `~/.claude/CLAUDE.md` |
| **Per-project** | Each repo's `CLAUDE.md` + `my_tickets/` | Codebase-specific context. Read only when working in that repo |

## Quick start

```bash
# 1. Close Obsidian first, then:
bash install.sh

# 2. Open Obsidian — vaults appear in the switcher automatically

# 3. In each vault: Settings → Community plugins → enable all installed plugins

# 4. Fill in the (fill in:) placeholders in ~/claude-memory/Identity.md and Conventions.md
```

## What gets installed

- `~/claude-memory/` — global vault with seed files (Index, Identity, Conventions, Context/, Sessions/)
- `~/.claude/CLAUDE.md` — global memory pointer loaded by every Claude Code session
- `~/.claude/hooks/append_daily_note.sh` — Stop hook that logs sessions automatically
- Per-repo `CLAUDE.md` scaffolds with `my_tickets/` pointers
- Per-repo `.obsidian/app.json` with `secret_*` excluded from graph and search
- Per-repo `.gitignore` block for Obsidian metadata
- Obsidian plugins: Dataview, Templater, Obsidian Git, Natural Language Dates

## Security conventions

- Files named `secret_*` are gitignored and excluded from Obsidian graph, MCP search, and graphify
- Do **not** enable the Obsidian Local REST API on any repo vault that contains `my_tickets/` with credentials
- `my_tickets/` should be gitignored in every repo — the script checks and warns if not

## Repo structure expected

Each repo you add should follow this pattern:
```
my-repo/
├── CLAUDE.md          ← project context (created by install.sh)
├── my_tickets/        ← personal knowledge base (gitignored, stays local)
└── ...
```

## Plugins installed (all vaults)

| Plugin | Why |
|---|---|
| **Dataview** | Query vault as a database — useful over my_tickets/ |
| **Templater** | Auto-populate frontmatter on new notes |
| **Obsidian Git** | Auto-commit ~/claude-memory/ to a private backup repo |
| **Natural Language Dates** | `@today` and `[[2026-05-27]]` resolve in Dataview queries |

## Upgrade path

The Stop hook (append_daily_note.sh) is a minimal stub — it logs session metadata only.
To add AI-powered extraction (auto-summarise what Claude did each session into memory), see:
https://www.mindstudio.ai/blog/self-evolving-claude-code-memory-obsidian-hooks
