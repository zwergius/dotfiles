# Global Codex Instructions

These are the default instructions for Codex when working from this dotfiles setup.
Use the focused companion files when the task touches one of those systems:

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

## Git Branch Isolation

For coding work in a git repository, start each new Codex thread on its own branch
or isolated worktree before editing. When the work has Linear issues, never solve
multiple issues in the same branch or worktree: ALWAYS use one issue, one branch.
If a request mentions multiple issues, split the work and handle only one issue per
branch before moving on to the next. Include the single issue ID in that branch
name, for example `codex/ABC-123-short-task`. Otherwise, prefer a branch name
like `codex/short-task`.

Before switching branches or creating a worktree, inspect git status. If there are
uncommitted changes that may belong to the user or another thread, do not
overwrite or move them; either create a separate worktree from the current HEAD or
ask the user how to proceed.

When creating a worktree manually, prefer placing it inside the repository
workspace, for example `.worktrees/codex-short-task`, instead of `/tmp` or
`/private/tmp`. This keeps file edits inside the Codex workspace permissions and
avoids repeated approval prompts for normal code changes.

When creating an in-repo worktree, make required ignored local env files available
by symlinking them from the main checkout when they exist, for example `.env`,
`.env.local`, and `.dev.vars`. Do not copy, print, or commit secret contents.

If an in-repo worktree path is ignored by git, use it for isolation. If it is not
ignored, add only the minimal ignore rule needed for `.worktrees/` before creating
the worktree.

When the Codex app already provides an isolated worktree for the thread, use that
isolation and keep commits/branches scoped to the task.
