---
name: writing-assistant
description: "Write application essays and short-answer prompts tailored to Ryan's voice, preferences, and job context. Outputs to Writing.md and archives to Writtens/Generated/."
---

## Purpose

Write tailored application essays and short-answer prompts for Ryan. Output goes to `Writing.md` at the repo root, then copied to `Writtens/Generated/` for archival.

---

## Step 0 - Clearing

Begin by clearing the `Writing.md` file to avoid being influenced much by previous writing. This does not need to be reported to the user.

---

## Step 1 - Confirm Before Writing

Before doing anything, confirm:
- The prompt/question being answered
- The company and role (assume the most recent resume-builder job in this thread if one was run; otherwise ask)

State both back to Ryan and ask: "Confirm and I'll write." Wait for confirmation.

---

## Step 2 - Load Context

Read all of the following in parallel before drafting:

1. `Writing_Preferences.md` (repo root) - Ryan's voice, structure rules, what to avoid
2. **At least 3 of Ryan's actual writings** from `Writtens/` to calibrate tone. His writing is in: REUSE.md, Datacurve.md, Two Sigma.md, YC Talk.md, Old College Apps (2025)/CMU_Application_2025.md. **Do NOT use `Writtens/Citadel.md` - it is not his writing.** Read these before drafting every time, even if you have seen them before in this session. The goal is to actively re-index his sentence rhythm, word choice, and structure.
3. Any relevant resume section files in `Resumes/sections/` for factual grounding on the role

---

## Step 3 - Draft

Follow `Writing_Preferences.md` strictly. Key rules:
- No em dashes
- Terse, grounded, no filler - sounds like Ryan talking, not marketing copy
- Short sentences over compound ones
- One theme per piece, stated as a character statement
- Anchor around one specific scene or moment
- Lead with stakes/context, then the hard moment, then the decision, then the result
- End with the principle carried forward, then a crisp result line
- Concrete and specific: real commit traces, SDK versions, actual numbers, actual decisions
- Do not invent or inflate - if there is not enough to write, say so
- Prefer college experiences over high school (rising sophomore as of Jul 2026)
- CyLab theme: natural workflows over stopgaps, conviction under pressure, root-cause thinking
- ScottyLabs theme: humanitarian utility to developers over technical elegance
- **Plain text only in the response body. No markdown: no bold, no headers, no bullet points, no italics, no horizontal rules. Paragraphs separated by blank lines only.**

---

## Step 4 - Output

Write the full draft to `Writing.md` at the repo root with this structure:

```
# {Company} - {Role}

## Prompt
{the question verbatim}

## Response
{plain text draft, paragraphs only}
```

The `#` and `##` lines are metadata headers for the file only. The response body itself is plain prose with no markdown.

Then copy it to `Writtens/Generated/{Company}_{Role}_{slug}.md` where `slug` is a 2-3 word kebab-case description of the prompt (e.g. `top-accomplishments`, `why-spacex`, `leadership-story`).

Create `Writtens/Generated/` if it does not exist.

---

## Step 5 - Summary

After writing, give:
- Which experiences were drawn on and why
- Any content gaps or things that could not be verified from existing files
- The archive filename

Keep it to 3-5 lines.
