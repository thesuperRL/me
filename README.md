# me

A file-based personal assistant for job applications and writing. The agent reads a set of files about you -- who you are, how you write, what you have built -- and uses that context to write essays, build tailored resumes, and debrief experiences.

## What it does

- **Resume builder** -- takes a job description, screens your eligibility, and assembles a tailored one-page LaTeX resume from your section library.
- **Writing assistant** -- writes application essays and short-answer prompts in your voice, grounded in your actual experiences.
- **Event interview** -- debriefs significant events through Socratic questioning and builds up your experience notes over time.

## Setup

Fork this repo. Then, in an agent session pointed at the repo, run:

```
/setup
```

This walks you through filling in your personal context files (`General.md`, `Personal.md`, `Writing_Preferences.md`), setting up your resume sections, and indexing your projects. Takes about 15-20 minutes. Do it once.

## Structure

```
General.md              who you are, goals, working style (agent reads every session)
Personal.md             raw personal material, essay seeds
Writing_Preferences.md  voice and structure rules
skills/                 skill files -- setup, resume-builder, writing-assistant, event-interview
Resumes/
  sections/             LaTeX resume building blocks
  Profile.md            eligibility facts for job screening
  Generated/            tailored resumes output here
Repo Indexing/          one file per project with commit-level detail
Experiences/            role-linked notes built up over time
Events/                 raw event debrief notes
Writtens/               archive of past essays and drafts
```

## Usage

After setup, the three main skills are:

| What you want | How to invoke |
|---|---|
| Build a resume for a specific job | paste the job description and say "build me a resume" |
| Write an essay or short answer | paste the prompt and say "write this" |
| Debrief something that happened | describe the event and say "interview me about this" |

The agent reads `General.md`, `Personal.md`, and `Writing_Preferences.md` at the start of every session. Keep those files accurate.
