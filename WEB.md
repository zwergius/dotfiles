# Web Guidance

Use this companion file for frontend, browser, HTML, CSS, client-side JavaScript,
accessibility, forms, performance, security headers, privacy, passkeys, and
modern web platform API work.

## Modern Web Guidance

At the start of a web task, check whether the Modern Web Guidance skill is
installed:

- `$HOME/.agents/skills/modern-web-guidance/SKILL.md`

If it is not installed, install it with the Chrome team's recommended installer:

```sh
npx -y modern-web-guidance@latest install
```

After installation in the current session, read and follow the installed
`SKILL.md` directly if the skill is not automatically loaded yet. New Codex
sessions should discover it as a skill from the installed location.

Follow the skill's own instructions. In particular, search for relevant guidance
before implementing frontend code, then retrieve and apply the most relevant
guide:

```sh
npx -y modern-web-guidance@latest search "<task summary>"
npx -y modern-web-guidance@latest retrieve "<guide-id>"
```

Prefer retrieved guidance when it applies, adapting it to the project's
framework, design system, and browser support policy.
