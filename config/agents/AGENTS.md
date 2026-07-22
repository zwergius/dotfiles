# Global Agent Instructions

This file is the global startup guide for agent sessions on this machine. The
marked section is also the canonical source used by the agent-workflow setup
skill. Keep project-specific commands and conventions in each repository's own
`AGENTS.md`.

<!-- agent-workflows:shared:start -->
## Way of Working

### Start

Before editing files for any coding or project task:

1. Read the nearest repo-local `AGENTS.md` in the current workspace first and
   treat it as the primary source for project-specific workflow, commands, and
   verification.
2. Read every companion file that the repo-local instructions or task scope
   require.
3. Check for ignored `*.local.md` files next to each instruction file, apply
   them as local overrides, and never commit or quote their contents.
4. Inspect the current implementation and git status before proposing changes.
5. Confirm branch or worktree isolation before editing. Do not disturb unrelated
   user changes.
6. Install dependencies only when the repository requires them or they are
   missing; otherwise preserve the existing lockfile and installation state.
7. State a short startup receipt before editing: docs read, local overrides
   checked, scope, issue or none, branch/worktree, expected files, and
   verification plan.

If these steps are incomplete, do not edit files.

### Work

- Implement only the agreed scope and preserve existing behavior unless the
  task explicitly changes it.
- Follow existing architecture, naming, style, and testing conventions.
- Avoid unrelated refactors and opportunistic cleanup.
- Add or update tests when a change affects logic, data flow, permissions,
  integrations, or user-visible behavior.
- Keep secrets, credentials, private paths, and machine-specific details out of
  tracked files.

### Finish

Before handing work back:

1. Run the planned checks, including focused verification for changed files.
2. Run `git diff --check` and inspect the full diff for unrelated changes.
3. Remove accidental temporary files, logs, screenshots, and generated output.
4. Report changed behavior, files touched, checks run, and anything skipped or
   still requiring an external service.
5. Leave the branch or worktree scoped to the task and never bypass git hooks.
6. If an issue tracker was used, state whether it needs a comment, status
   change, or follow-up issue.
<!-- agent-workflows:shared:end -->

## Global Companion Files

Use these focused global references when the local `AGENTS.md`, equivalent agent
instruction file, or task scope calls for them. Read a relevant companion once
before taking action; a Markdown link does not automatically load its contents.

- [GIT.md](GIT.md) for git branch isolation, worktrees, and local repository
  workflow.
- [GITHUB.md](GITHUB.md) for GitHub CLI, authentication, PRs, issues, and CI.
- [ISSUE_TRACKER.md](ISSUE_TRACKER.md) for provider-neutral issue lifecycle,
  scope, updates, and review guidance.
- [WEB.md](WEB.md) for frontend, browser, HTML, CSS, accessibility,
  performance, and modern web platform work.
