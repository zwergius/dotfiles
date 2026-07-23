# Issue Tracker Instructions

Use these instructions when a repository configures an issue tracker in
`docs/agents/issue-tracker.md`. That project-owned file is the source of truth
for the provider, entity locations, commands, and Wayfinder operations.

Do not infer a provider from the git remote, installed tools, or prior projects.
Follow the configured tracker contract.

## Default Workflow

Project implementation work should have an issue in the configured tracker. If
a task does not have one, ask whether to create it before editing.

Before editing:

- Read `docs/agents/issue-tracker.md`.
- Fetch the relevant issue and linked specification using the configured
  provider operations.
- Identify the acceptance criteria and non-goals.
- If the issue lacks acceptance criteria or the scope is ambiguous, ask for
  clarification before editing.
- Keep the implementation scoped to the issue's acceptance criteria.

Generic editing, testing, and handoff discipline belongs to the shared Way of
Working instructions rather than this companion.

## Tracker Updates

When changing tracker data, preserve existing context and make focused updates:

- Fetch the relevant entity before editing it.
- Prefer updating existing entities over creating duplicates.
- Use identifiers, project names, team names, and workflow states exactly as the
  tracker reports them.
- Add comments for discussion or progress notes; edit fields only when the user
  asks for a field-level workflow change.
- Keep descriptions and comments in clear Markdown.
- After implementation, post a progress comment or change status only when the
  user asks for that update.
- Create follow-up issues only when the user asks or when deferred work is
  required to preserve the intended scope.

## Review Against an Issue

Review against the linked issue only. Look for acceptance-criteria gaps, bugs,
broken data flow, unnecessary scope expansion, security issues, bad
abstractions, missing loading or error states, and code that will be difficult
for future agents to modify.

Do not suggest unrelated improvements unless they are severe.

Use `Safe to merge` only when there are no blocking findings, and include any
residual risk or test gaps.
