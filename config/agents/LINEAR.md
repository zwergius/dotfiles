# Linear Instructions

Use Linear when the task is about Linear issues, projects, initiatives, comments,
customer needs, team workflows, or status updates.

Project work should have a Linear issue. If a project task does not have one, ask
to create a Linear issue before starting implementation.

Prefer the Linear app tools when they are available. Use structured Linear
operations for reading, creating, and updating Linear entities instead of relying
on browser automation or ad hoc text copying.

## Default Workflow

Before editing:

- Read the Linear issue, linked spec, and relevant existing files.
- Identify the acceptance criteria and non-goals.
- If the issue lacks acceptance criteria or the scope is ambiguous, ask for
  clarification before editing.
- Check current implementation patterns before adding new ones.
- Inspect current git status so unrelated work is not disturbed.

While editing:

- Implement only the stated acceptance criteria.
- Do not change unrelated files.
- Do not refactor opportunistically.
- Preserve existing behavior unless the issue explicitly changes it.
- Follow existing code style, architecture, naming, and UI conventions.
- Add or update tests when the change affects logic, data flow, permissions,
  integrations, or user-visible behavior.

Before opening a PR:

- Run the relevant checks for the files touched.
- Use the narrowest useful verification command for the task.
- If a broad check is already known to have unrelated failures, say that plainly
  in the PR and include the more targeted checks that passed.
- Review the diff for unrelated changes.

## Linear Updates

When changing Linear data, preserve existing issue context and make focused
updates:

- Fetch the relevant issue, project, initiative, or document before editing it.
- Prefer updating existing entities over creating duplicates.
- Use issue identifiers, project names, and team names exactly as Linear reports
  them.
- Add comments for discussion or progress notes; edit issue fields only when the
  user asked for a field-level workflow change.
- Keep descriptions and comments in clear Markdown.
- After implementation, post a concise progress comment or move issue status
  only when the user asked for that Linear update.

## PR Standard

For PR creation, description, review formatting, GitHub CLI, and authentication
details, follow [GITHUB.md](GITHUB.md).

Create follow-up Linear issues only when the user asks or when deferred work is
required to preserve the intended scope.

## PR Review Standard

Review against the linked Linear issue only. Look for acceptance criteria gaps,
bugs, broken data flow, unnecessary scope expansion, security issues, bad
abstractions, missing loading or error states, and code that will be hard for
future agents to modify.

Do not suggest unrelated improvements unless they are severe.

Use `Safe to merge` only when there are no blocking findings, and include any
residual risk or test gaps there.
