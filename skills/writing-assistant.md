---
name: writing-assistant
description: "Write application essays and short-answer prompts tailored to the user's voice, preferences, and job context. Outputs to Writing.md and archives to Writtens/Generated/."
---

## Purpose

Write tailored application essays and short-answer prompts. Output goes to `Writing.md` at the repo root, then copied to `Writtens/Generated/` for archival.

---

## Step 0 - Clearing

Begin by clearing the `Writing.md` file to avoid being influenced by previous writing. This does not need to be reported to the user.

---

## Step 1 - Confirm Before Writing

Before doing anything, confirm:
- The prompt/question being answered
- The company and role (assume the most recent resume-builder job in this thread if one was run; otherwise ask)

State both back and ask: "Confirm and I'll write." Wait for confirmation.

---

## Step 2 - Load Context

Read all of the following in parallel before drafting:

1. `Writing_Preferences.md` (repo root) - voice, structure rules, what to avoid
2. **At least 3 of the user's actual writings** from `Writtens/` to calibrate tone. Identify which files represent genuine writing (not AI-written samples) and note them in `General.md` under Agent Notes. Read these before drafting every time -- the goal is to actively re-index sentence rhythm, word choice, and structure.
3. Any relevant resume section files in `Resumes/sections/` for factual grounding on the role
4. **For any project or technical role referenced in the essay, check `Repo Indexing/`** for a corresponding file. These contain commit-level specifics, accurate contribution framing, design decisions, and technical depth that must ground any claims made.

---

## Step 3 - Draft

Follow `Writing_Preferences.md` strictly. Core rules that apply regardless of personal preferences:
- No em dashes
- Terse, grounded, no filler -- should sound like the person talking, not marketing copy
- One theme per piece, stated as a character statement
- Anchor around one specific scene or moment
- Lead with stakes/context, then the hard moment, then the decision, then the result
- End with the principle carried forward, then a crisp result line
- Concrete and specific: real commit traces, SDK versions, actual numbers, actual decisions
- Do not invent or inflate -- if there is not enough to write about, say so
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
