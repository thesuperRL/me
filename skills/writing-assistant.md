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
4. **For any project or technical role referenced in the essay, read the corresponding file in `Repo Indexing/`** — these contain commit-level specifics, accurate contribution framing, design decisions, and technical depth that must ground any claims made. Use the mapping below to find the right file.

### Repo Indexing — Filename to Project/Role Mapping

| File | Project / Resume Section |
|------|--------------------------|
| `XDTK-Google-BLE.md` | Bluetooth R&D Intern, Google (`projects.tex`) |
| `ScottyLabs-Infrastructure-NixOS.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — infrastructure, dalmatian, devops-config (`experience.tex`) |
| `ScottyLabs-Governance.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — governance, documentation, discord-verify (`experience.tex`) |
| `ScottyLabs-Apps.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — Snipe-Elo-Bots, tartan-vote, cmugpt-surface/agent, kennel, housing, bus-sign, scottylol (`experience.tex`) |
| `mautrix-bridges.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — mautrix-go/discord/slack patch maintenance (`experience.tex`) |
| `ScottyLabs-Codeberg-delta.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — org-observability, terraform-provider-matrix, devops-troubleshooting-docs (Codeberg-only) |
| `terraform-provider-synapse.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs — OpenTofu Synapse provider (Codeberg) |
| `aayn-replication.md` | ML Paper Replications — Attention is All You Need (`projects.tex`, commented) |
| `masked-autoencoders.md` | ML Paper Replications — Masked Autoencoders (`projects.tex`, commented) |
| `gaussian-splatting.md` | ML Paper Replications — 2D Gaussian Splatting (`projects.tex`, commented) |
| `nwtsuf-replication.md` | ML Paper Replications — Indirect Prompt Injection (`projects.tex`, commented) |
| `universal-llm-attacks.md` | ML Paper Replications — GCG Adversarial Suffix Attack (`projects.tex`, commented) |
| `UAV-Gesture-Recognization.md` | Winter Independent Project — hand-gesture UAV GCS (`experience-research.tex`) |
| `commit-generator.md` | git-aicommit — Rust CLI (`projects.tex`, commented) |
| `arknights-website.md` | Arknights Teambuilding Tool (`projects-personal.tex`) |
| `arknights-pfp-dataset.md` | Personal project — Arknights PFP dataset (not in resume sections) |
| `credit-conserver.md` | Personal project — credit optimization tool (not in resume sections) |
| `issues-mcp.md` | Personal project — MCP server (not in resume sections) |
| `TartanHacks-2026.md` | TartanHacks 2026 hackathon (not in resume sections) |
| `HackCMU-2025.md` | HackCMU 2025 hackathon (not in resume sections) |
| `website-personal.md` | Personal website — thesuperRL.github.io + website repo |
| `website-codeberg.md` | Personal website — TypeScript version on Codeberg |
| `Webscrape-Researcher-PF.md` | Webscrape Researcher for PF debate (HS project, not in resume sections) |
| `Reinforced-Riichi-Player.md` | Reinforced Riichi mahjong player (personal project, not in resume sections) |
| `academic-misc.md` | 05-180 Bakeoff, Datasci Final, GFG-Unity, BWSI2, Time-converter, USA-Map, quik-task |
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
