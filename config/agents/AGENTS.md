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

### Commands and Verification

- Discover the repository's canonical commands from its instructions, manifests,
  task runner, and CI configuration. Do not invent commands when the project
  already defines them.
- In Node.js projects, use the package manager selected by the `packageManager`
  field or lockfile. Prefer scripts from `package.json` over invoking local tools
  directly with `npx`, `pnpm exec`, or equivalent commands.
- Invoke a tool directly only when no suitable project script exists or when a
  focused check requires arguments that the script cannot express. Do not add a
  package script solely for a one-off agent command.
- Plan verification in proportion to the changed behavior. Run the narrowest
  relevant check first, then broader type checking, linting, tests, or builds
  when the affected surface and repository conventions warrant them.
- Never claim a check passed unless it ran successfully. Report the exact checks
  run and explain anything skipped, unavailable, or requiring an external
  service.

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

## Provider-first integrations

Before designing an automation or service integration, identify which platform
owns the event and check its current official capabilities: native triggers,
workflows, hosted execution, authentication, retries, and delivery controls.
Prefer a supported platform feature that meets the requirement. Check the whole
path from trigger to execution before claiming it fits; a native event alone
may not provide a suitable place to run the work.

If custom code or infrastructure is still needed, state which native options
were checked and the concrete gap each leaves. Build only the smallest adapter
for that gap. Include the choice and its operational cost in the reviewable
proposal before implementation. Apply this to every provider, not just GitHub.

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
