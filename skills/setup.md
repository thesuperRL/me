---
name: setup
description: "First-time setup for a new user. Orients them to the repo, then walks through filling in every config file so the other skills work correctly."
---

# Repo Setup

## Purpose

Get a new user fully configured so the other skills (resume-builder, writing-assistant, event-interview) have the context they need. By the end of this skill, all placeholder files will be filled in and the repo will be ready to use.

Do this once when the repo is first cloned. Re-run any section if things change (new role, new job cycle, voice preferences shift).

---

## Overview: What This Repo Is

Explain the structure briefly before asking anything:

> This repo is a personal writing and job-search assistant. The agent reads a set of files about you -- who you are, how you write, what you've done -- and uses that context to help write essays, build tailored resumes, and debrief events. Everything is file-based: you fill in the config files once, and the skills do the rest.
>
> Here is what each folder does:
>
> - `General.md` -- who you are, your goals, how you think. The agent reads this every session.
> - `Personal.md` -- raw personal material, not for public writing. Essay seeds.
> - `Writing_Preferences.md` -- your voice, structure rules, what to avoid.
> - `Resumes/sections/` -- LaTeX resume section files. The resume-builder assembles these into a tailored one-page resume per role.
> - `Resumes/Profile.md` -- quick-reference facts for eligibility screening.
> - `Repo Indexing/` -- one file per project or role with commit-level detail. The agent reads these to ground essays and bullets in accurate specifics.
> - `Experiences/` -- role-linked notes built up over time through the event-interview skill.
> - `Events/` -- raw notes from individual events, debriefed through the event-interview skill.
> - `Writtens/` -- archive of past essays and drafts.
> - `skills/` -- the skill files themselves. Add new ones here.

Ask if they have questions about the structure before continuing. If not, move on.

---

## Step 1 -- Fill in General.md

Run the `general-intake` skill now. It will conduct a short conversation and write `General.md` from scratch.

Tell the user:

> I'm going to ask you some questions to fill in your standing context. This takes about 5-10 minutes and you only do it once. Be specific -- vague answers make the agent less useful.

Run the full general-intake protocol. Do not skip sections. When it is done, confirm `General.md` looks right before moving on.

---

## Step 2 -- Fill in Personal.md

`Personal.md` is raw material for personal essays. It does not need to be polished. The goal is honest observations about yourself -- patterns, tensions, things that do not show up on a resume.

Ask:

> I want to add some raw personal material -- patterns in how you operate, things you carry, tensions you notice in yourself. This is not public writing; it is source material. What is something true about you that would not appear on your resume?

Follow up until you have at least two honest entries. Write them to `Personal.md` under named headers. Add a "Potential Essay Threads" section at the bottom with 2-3 seeds drawn from what they said.

---

## Step 3 -- Fill in Writing_Preferences.md

Ask three questions, one at a time:

1. "Read me a sentence or two from something you have written -- anything. How does it sound compared to how you actually talk?"
2. "What do you hate in writing? Think about things you have read that made you cringe."
3. "What do you want me to flag when your drafts drift from your voice?"

From the answers, fill in `Writing_Preferences.md` with specific rules under each section header (Voice, Structure, Content, What to Avoid, Topic Preferences). Leave Topic Preferences blank until they have written something -- you will fill that in over time.

---

## Step 4 -- Set Up the Resume

Two files need to be filled in before the resume-builder works.

### Resumes/sections/heading.tex

Ask:
- Full name (as it should appear on a resume)
- Phone number
- Email
- LinkedIn URL
- GitHub URL (and any other profile links they want)

Write those into `Resumes/sections/heading.tex`, replacing the placeholder values. Keep the LaTeX structure intact.

### Resumes/Profile.md

Ask:
- Degree, university, expected graduation, GPA
- Work authorization status
- Each role they have held (company, title, dates, tech stack) -- go through them one at a time
- Skills by category (languages, frameworks, tools)
- Honors, awards, competitions worth listing
- What they explicitly do NOT have (common JD requirements they cannot meet)

Write these into `Resumes/Profile.md`. This file is the agent's ground truth for eligibility screening; accuracy matters more than impressiveness.

### Resumes/sections/education.tex

Fill in the education section with their actual school, degree, GPA, relevant coursework, and honors. Replace all placeholder values.

---

## Step 5 -- Set Up Repo Indexing

Explain:

> The `Repo Indexing/` folder holds deep-dive notes on each of your projects and roles. The writing assistant and resume-builder read these files to ground essays and bullets in accurate specifics rather than memory. You should add one file per significant project or role.

Ask them to list their 2-3 most significant projects or roles. For each one, ask:

- What did you build or own? What was the scope?
- What was the key technical decision you made, and why?
- Is there a specific moment -- a commit, an incident, a design review -- worth referencing in writing?
- What would you NOT want to overclaim about this?

Create `Repo Indexing/<slug>.md` for each one using the format described in `Repo Indexing/README.md`.

Then update the mapping table in `skills/writing-assistant.md` and `skills/event-interview.md` to include the new files.

---

## Step 6 -- Confirm and Close

Run through a quick checklist:

- [ ] `General.md` filled in and confirmed
- [ ] `Personal.md` has at least two entries and essay threads
- [ ] `Writing_Preferences.md` has specific rules in every section
- [ ] `Resumes/sections/heading.tex` has real contact info
- [ ] `Resumes/Profile.md` has real experience, skills, and gaps
- [ ] `Resumes/sections/education.tex` has real content
- [ ] At least one file in `Repo Indexing/`

Tell the user which items are still incomplete and offer to finish them now or later.

When everything is done:

> You are set up. Here is what you can do now:
>
> - Run the `resume-builder` skill with a job description to get a tailored one-page resume.
> - Run the `writing-assistant` skill with an essay prompt to get a draft in your voice.
> - Run the `event-interview` skill after something significant happens to debrief it and build up your experience notes.
> - Run `general-intake` again any time your situation changes.
