# Global Codex Instructions

These are the default instructions for Codex when working from this dotfiles setup.
Use the focused companion files when the task touches one of those systems:

- [GITHUB.md](GITHUB.md) for GitHub CLI, authentication, PRs, issues, and repository work.
- [LINEAR.md](LINEAR.md) for Linear issues, projects, comments, and workflow changes.

Private machine-specific details may live in ignored `*.local.md` files next to
these public instructions. If such a file exists for the relevant area, read it
as a local override and never commit its contents.

## Git Branch Isolation

For coding work in a git repository, start each new Codex thread on its own branch
or isolated worktree before editing. When the work has a Linear issue, include
the issue ID in the branch name, for example `codex/ABC-123-short-task`.
Otherwise, prefer a branch name like `codex/short-task`.

Before switching branches or creating a worktree, inspect git status. If there are
uncommitted changes that may belong to the user or another thread, do not
overwrite or move them; either create a separate worktree from the current HEAD or
ask the user how to proceed.

When creating a worktree manually, prefer placing it inside the repository
workspace, for example `.worktrees/codex-short-task`, instead of `/tmp` or
`/private/tmp`. This keeps file edits inside the Codex workspace permissions and
avoids repeated approval prompts for normal code changes.

If an in-repo worktree path is ignored by git, use it for isolation. If it is not
ignored, add only the minimal ignore rule needed for `.worktrees/` before creating
the worktree.

When the Codex app already provides an isolated worktree for the thread, use that
isolation and keep commits/branches scoped to the task.
