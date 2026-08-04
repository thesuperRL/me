---
name: general-intake
description: "Interview the user to fill in General.md with their identity, background, goals, working style, voice, and repo usage. Run once at repo setup or when General.md is blank/stale."
---

# General Intake — Fill in General.md

## Purpose

`General.md` is the agent's standing context for every session. This skill guides a short intake conversation to fill it in accurately. Run this once when a user sets up the repo, or when `General.md` still has placeholder text.

Read `General.md` first. Skip any section already filled in; only ask about what's missing or stale.

---

## Protocol

Ask conversationally — one or two questions at a time, never a form dump. The goal is accurate, specific answers, not comprehensive coverage in one shot. If an answer is vague, push for the concrete version.

### 1. Identity (quick — 2 questions max)

- What's your name, and how should I refer to you?
- What's your current role or situation — student, working, in between?

### 2. Background (1-2 questions)

- Give me the short version: where you came from, what you've spent most of your time on, what shaped you. Not a resume summary — the stuff underneath it.

If the answer is generic ("I've always been interested in tech"), name it: "That's the summary version — what specifically? What did you actually spend time on?"

### 3. Goals (1-2 questions)

- What are you trying to accomplish in the next year?
- Where do you want to end up, longer term?

Push for specificity. "Work in finance" is not a goal. "Get a quant internship at a prop shop before senior year" is.

### 4. How You Think and Work (2-3 questions)

This is the most important section for writing assistance. Go slow here.

- How do you make decisions when you don't have enough information?
- What does working under pressure look like for you — what do you do well, what breaks down?
- What's a pattern in how you operate that comes up across different things you've done?

If they give a clean answer, ask one follow-up: "Can you give me a specific example of that?" You want a real data point, not a self-assessment.

### 5. Things That Matter (1-2 questions)

- What do you keep coming back to across your projects and roles — the theme underneath the resume?
- What do you care about that doesn't show up on paper?

### 6. Voice Notes (2-3 questions)

These directly affect writing quality. Don't skip.

- Read a sentence or two of something you've written — anything. How does it sound compared to how you actually talk?
- What do you hate in writing? (e.g. corporate filler, over-hedging, bullet-point essays)
- What do you want me to call you out on when your drafts drift from your voice?

If they can't articulate it, offer a few examples and ask which land: "Do you tend toward formal or casual? Punchy or discursive? Do you lead with the point or build to it?"

### 7. Repo Usage (quick — 1-2 questions)

- What will you mostly use this repo for — job apps, personal essays, a mix?
- When you bring in a draft, how finished is it usually? Just a prompt, rough outline, partial draft?

---

## Completion Signal

You have enough to fill in `General.md` when:
- You know their name and role
- You have 3–4 sentences of real background (specific, not generic)
- You know at least one concrete near-term goal
- You have a honest read on how they work — at least one specific behavioral pattern
- You have at least two voice preferences (tone + one thing to avoid)

If any of these are missing, keep asking.

---

## Output

When the conversation is complete:

1. **Read back a summary** — one short paragraph per section — and ask if anything is off or missing.

2. **Write `General.md`** with the real answers in place of the placeholder text. Keep the section headers and structure. Write in third person for Identity/Background/Goals/Working Style (the agent reads it as reference), first person only in Voice Notes where it reads more naturally as direct instruction.

3. **Confirm** with the user that the file looks right before closing out.

---

## Tone

- Conversational, not clinical. This is a getting-to-know-you conversation, not a form.
- Push back on vagueness — not aggressively, but specifically. "Can you give me a concrete example?" is your most useful tool.
- Don't summarize mid-conversation. Just ask the next question.
- If something they say connects to something earlier, note it: "That sounds like the same pattern you described with X."
