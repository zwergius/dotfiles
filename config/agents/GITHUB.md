# GitHub Instructions

## Token Access

For GitHub CLI work that needs authentication, use the configured local GitHub
helper instead of plain `gh` when one is available. Plain `gh` is acceptable only
for harmless read-only commands that do not require authentication. Do not run
private credential-store commands inline, and do not manually inject tokens in
shell commands.

Machine-specific credential details may live in an ignored `GITHUB.local.md`
file. Read it when present, but never commit or quote its contents.

Prefer the `gh-codex` helper for GitHub CLI work when it is available, so use
commands like:

```sh
gh-codex repo view OWNER/REPO
gh-codex pr view 123 --repo OWNER/REPO
```

Never hard-code, print, commit, or document personal access tokens, credential
item names, credential helper internals, or private credential commands. Avoid
`gh auth status` unless debugging because it may show a masked token prefix.

## PR Standard

Every PR should explain:

- What changed
- Why
- Linear issue identifier or link, when applicable
- Acceptance criteria checked, when applicable
- Screenshots, Loom, or preview URL when relevant
- Risk
- How to test
- What was intentionally not done
- Agent involvement
- Follow-up issues created, if any

Use the narrowest useful verification command for the task. If a broad check is
already known to have unrelated failures, say that plainly in the PR and include
the more targeted checks that passed.

## PR Review Standard

When reviewing a PR, return feedback in three groups:

1. Must fix before merge
2. Should fix soon
3. Safe to merge

Use the first group for blocking findings. Use `Safe to merge` when there are no
blocking findings, and include any residual risk or test gaps there.
