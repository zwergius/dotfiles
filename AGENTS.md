# Global Codex Instructions

These are the default instructions for Codex when working from this dotfiles setup.
Use the focused companion files when the task touches one of those systems:

- [GIT.md](GIT.md) for git branch isolation, worktrees, and local repository
  workflow.
- [GITHUB.md](GITHUB.md) for GitHub CLI, authentication, PRs, issues, and repository work.
- [LINEAR.md](LINEAR.md) for Linear issues, projects, comments, and workflow changes.
- [WEB.md](WEB.md) for frontend, browser, HTML, CSS, accessibility, performance,
  and modern web platform work.

Private machine-specific details may live in ignored `*.local.md` files next to
these public instructions. If such a file exists for the relevant area, read it
as a local override and never commit its contents.

## Mandatory Pre-Edit Checklist

Before editing files for any coding or project task:

1. Read this file and any relevant focused companion files:
   - [GIT.md](GIT.md) for git branch isolation, worktrees, and local repository
     workflow.
   - [WEB.md](WEB.md) for frontend, browser, HTML, CSS, accessibility,
     performance, or modern web work.
   - [LINEAR.md](LINEAR.md) for project work, issue workflow, scope, or status
     changes.
   - [GITHUB.md](GITHUB.md) for repository, PR, issue, or CI work.
2. Check for matching ignored `*.local.md` files next to those companion files
   and apply them as local overrides.
3. Run `git status --short --branch`.
4. If the task is project work and no Linear issue is provided, ask whether to
   create one before implementation.
5. Create or switch to the task branch or worktree before editing.
6. When using a separate worktree, symlink required ignored env files such as
   `.env`, `.env.local`, and `.dev.vars` from the main checkout when they exist
   so the environment works without copying secret contents.
7. State the issue, branch, docs-read, and verification plan briefly before
   making changes.
8. Do not change unrelated files or package metadata unless the user explicitly
   approves that expanded scope.
