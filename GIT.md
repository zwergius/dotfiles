# Git Instructions

Use this companion file for git branch isolation, worktrees, and local
repository workflow.

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
