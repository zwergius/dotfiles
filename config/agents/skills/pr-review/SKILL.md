---
name: pr-review
description: Review pull requests for bugs, security issues, performance problems, code quality, and missing tests. Use when the user asks to review a PR or provide an approve, request-changes, or comment verdict.
---

# PR Review

Review the pull request without modifying its code. Post the completed review to
the pull request unless the user explicitly asks for a local-only review, dry
run, or no posted comments.

## Gather Context

1. Read the repository instructions and documented coding standards.
2. Read the PR title, description, linked issue or specification, base branch,
   and commit list.
3. Inspect the complete PR diff against its base and the surrounding code needed
   to understand each change.
4. Inspect relevant tests and verification results. Run focused read-only checks
   when needed to confirm a suspected problem.
5. Verify every finding against the current code before reporting it.

## What to Check

1. **Bugs** — Logic errors, off-by-one errors, incorrect state transitions,
   race conditions, and null or undefined handling.
2. **Security** — Injection, authorization bypasses, exposed secrets, unsafe
   input handling, SSRF, and privilege boundary violations.
3. **Performance** — N+1 queries, unbounded work, memory leaks, unnecessary
   repeated operations, and regressions on hot paths.
4. **Style and quality** — Misleading names, dead code, missing error handling,
   and deviations from repository conventions that affect correctness or
   readability. Do not report cosmetic nitpicks.
5. **Tests** — Missing coverage for changed behavior, weak assertions, and
   untested edge cases or failure paths.

## Report Findings

Order findings by severity, with the most serious first. For each finding, use:

- **File:Line** — Exact location.
- **Severity** — Critical / Warning / Suggestion.
- **What's wrong** — One sentence describing the concrete problem and impact.
- **Evidence** — A short quote of the problematic code.
- **Fix** — An actionable correction.

Keep line ranges tight, avoid duplicate findings, and distinguish confirmed
problems from verification gaps. If there are no findings, say so plainly and
mention any testing or external verification that remains.

## Give a Verdict

End with exactly one standalone verdict:

- `REQUEST_CHANGES` when a confirmed critical issue or merge-blocking
  correctness or security warning exists.
- `COMMENT` when findings are non-blocking or verification is materially
  incomplete.
- `APPROVE` when there are no blocking findings and the available evidence
  supports merging.

Do not invent findings to fill the report.

## Post the Review

Post each confirmed finding as an inline review comment on the tightest relevant
changed line when the provider supports inline comments. Submit one overall
review containing the summary and verdict:

- Submit an approval for `APPROVE`.
- Request changes for `REQUEST_CHANGES`.
- Submit a non-blocking review comment for `COMMENT`.

Inspect existing review comments first and do not post duplicates. If posting is
unavailable, authentication fails, or the provider cannot attach a finding to
the relevant line, report what was not posted and why. Never claim that a review
or comment was posted unless the provider confirms it.
