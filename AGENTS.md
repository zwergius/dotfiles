# Global Codex Instructions

This file is the global startup guide for Codex sessions on this machine. Keep
it short: local repository instructions should define the project-specific way
of working.

## Start Here

Before editing files for any coding or project task:

1. Read the nearest repo-local `AGENTS.md` in the current workspace first.
2. Treat that local file as the primary source of truth for project workflow,
   verification, branch naming, issue handling, and environment setup.
3. Read any companion files referenced by the local `AGENTS.md`.
4. Check for matching ignored `*.local.md` files next to any instruction files
   you read, apply them as local overrides, and never commit or quote their
   contents.
5. State a short startup receipt before editing: docs read, local overrides
   checked, scope, issue or none, branch/worktree, expected files, and
   verification plan.

If you have not done these steps, do not edit files.

## Global Companion Files

Use these focused global references when the local `AGENTS.md` or task scope
calls for them:

- [GITHUB.md](GITHUB.md) for GitHub CLI, authentication, PRs, issues, and CI.
- [LINEAR.md](LINEAR.md) for Linear issues, projects, comments, and workflow
  changes.
- [WEB.md](WEB.md) for frontend, browser, HTML, CSS, accessibility,
  performance, and modern web platform work.

## Fallback Git Isolation

When a local `AGENTS.md` does not define stricter rules, use these defaults:

- Start coding work on its own branch or isolated worktree before editing.
- If the work has a Linear issue, use one issue per branch/worktree and include
  the issue ID in the branch name, for example `codex/ABC-123-short-task`.
- Before switching branches or creating a worktree, inspect
  `git status --short --branch`; do not overwrite or move uncommitted work that
  may belong to the user or another thread.
- Prefer in-repo worktrees such as `.worktrees/codex-short-task` when creating
  a worktree manually.
- In separate worktrees, symlink required ignored env files from the main
  checkout when present, such as `.env`, `.env.local`, and `.dev.vars`; do not
  copy, print, or commit secret contents.
- If `.worktrees/` is not ignored, add only the minimal ignore rule needed
  before creating an in-repo worktree.
