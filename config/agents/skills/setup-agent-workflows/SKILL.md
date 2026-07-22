---
name: setup-agent-workflows
description: Set up shared project workflows in AGENTS.md.
---

# Setup Agent Workflows

Set up a portable project instruction chain without replacing hand-maintained
project guidance. Materialize the always-relevant Way of Working inline and keep
task-specific companions behind explicit read triggers.

## Workflow

1. Find the repository root and read its existing `AGENTS.md`, if present.
2. Read `~/.config/agents/AGENTS.md` and confirm that it contains exactly one
   `agent-workflows:shared` marker pair.
3. Discover available companions from `~/.config/agents/*.md`, excluding
   `AGENTS.md` and ignored `*.local.md` files.
4. If `docs/agents/issue-tracker.md` exists, read it and recommend the
   `issue-tracker` companion regardless of which provider it configures. Do not
   recommend provider-specific companions for the same responsibility.
5. Recommend other companions only when justified by the repository or the
   user's stated workflow. Do not select every companion by default.
6. Ask the user to confirm the companion selection. Keep this to one concise
   question.
7. Preview the generated diff with `scripts/configure.py`. Never skip the
   preview when the target already contains project guidance.
8. Show the proposed generated section and ask the user to review it before
   writing.
9. After confirmation, run the script with `--write`.
10. Run the same command with `--check` and inspect `git diff --check`.

Use commands in this shape:

```sh
python3 <skill-dir>/scripts/configure.py \
  --target <repo-root>/AGENTS.md \
  --companion git \
  --companion issue-tracker
```

Add `--write` only after review. Add `--check` after writing. The default shared
source is `~/.config/agents/AGENTS.md`; pass `--source` only for testing or when
the installed catalog intentionally lives elsewhere.

## Invariants

- Treat the content between `agent-workflows:generated` markers as generated.
- Preserve every byte outside the generated block except the single separating
  blank line required when inserting a new block.
- Place a new generated block before existing project guidance so the later,
  more local instructions can override shared defaults.
- Never edit or patch the generated block manually. Change the shared source,
  companion selection, or setup script and rerun the skill.
- Never add ignored local companions, secrets, credentials, or absolute
  machine-specific paths to the generated block.
- Refer to companions through stable `~/.config/agents/<NAME>.md` paths.
- Do not assume that a Markdown reference loads a companion. Each generated
  entry must explicitly tell the agent when to read it.
- Stop if marker pairs are missing, duplicated, nested, or incomplete. Do not
  guess which content is generated.

## Companion Boundaries

Keep foundational instructions that apply to nearly every task in the inline
Way of Working. Keep conditional procedures such as issue tracking, GitHub, or
frontend work in companions. If a companion repeats generic scoping, editing,
testing, or handoff rules, move those rules to the shared source instead of
generating both.

Project-specific commands, architecture, conventions, and exceptions stay
outside the generated block in the repository's `AGENTS.md`.
