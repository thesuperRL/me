---
name: resume-builder
description: Interview Ryan about a job application and assemble a tailored 1-page LaTeX resume from his section library in Resumes/sections/
---

## Purpose

Take a job description, check Ryan's eligibility, then assemble a tailored 1-page LaTeX resume from `Resumes/sections/`. Output a new `.tex` to `Resumes/Generated/`.

---

## Step 1 - Intake

Ask Ryan two things in one message:

1. **Company and role** - company name and exact job title.
2. **Job description** - paste it in full. You'll extract everything you need from it.

Do not ask for anything else. Do not proceed until you have both.

---

## Step 2 - Eligibility Check

Read `Resumes/Profile.md`. Cross-reference it against the JD requirements. Before doing anything else, surface a brief flag list:

- **Requirements Ryan does NOT meet** - hard requirements (degree level, years of experience, specific tools, citizenship) he's missing. Call these out directly.
- **Soft gaps** - preferred qualifications he's light on.
- **Strong matches** - 2-3 things that directly align.

Format it as a short block, then ask: *"Want to proceed with the resume anyway?"* Wait for confirmation before continuing.

---

## Step 3 - Read Section Library

Read all files in `Resumes/sections/`:
- `preamble.tex`, `commands.tex`, `heading.tex` - always included, never modified
- `education.tex`, `skills.tex`, `experience.tex`, `projects.tex`, `honors.tex` - tailored per role

**Also read the relevant `Repo Indexing/` files** for any project or role that appears in the sections being tailored. These contain commit-level specifics, accurate contribution framing, and technical depth needed to write or evaluate bullets accurately. Use the mapping below.

### Repo Indexing - Filename to Project/Role Mapping

| File | Project / Resume Section |
|------|--------------------------|
| `XDTK-Google-BLE.md` | Bluetooth R&D Intern, Google (`projects.tex`) |
| `ScottyLabs-Infrastructure-NixOS.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - infrastructure, dalmatian, devops-config (`experience.tex`) |
| `ScottyLabs-Governance.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - governance, documentation, discord-verify (`experience.tex`) |
| `ScottyLabs-Apps.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - Snipe-Elo-Bots, tartan-vote, cmugpt-surface/agent, kennel, housing, bus-sign, scottylol (`experience.tex`) |
| `mautrix-bridges.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - mautrix-go/discord/slack patch maintenance (`experience.tex`) |
| `ScottyLabs-Codeberg-delta.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - org-observability, terraform-provider-matrix, devops-troubleshooting-docs (Codeberg-only) |
| `terraform-provider-synapse.md` | DevOps and Internal Tooling Tech Lead, ScottyLabs - OpenTofu Synapse provider (Codeberg) |
| `aayn-replication.md` | ML Paper Replications - Attention is All You Need (`projects.tex`, commented) |
| `masked-autoencoders.md` | ML Paper Replications - Masked Autoencoders (`projects.tex`, commented) |
| `gaussian-splatting.md` | ML Paper Replications - 2D Gaussian Splatting (`projects.tex`, commented) |
| `nwtsuf-replication.md` | ML Paper Replications - Indirect Prompt Injection (`projects.tex`, commented) |
| `universal-llm-attacks.md` | ML Paper Replications - GCG Adversarial Suffix Attack (`projects.tex`, commented) |
| `UAV-Gesture-Recognization.md` | Winter Independent Project - hand-gesture UAV GCS (`experience-research.tex`) |
| `commit-generator.md` | git-aicommit - Rust CLI (`projects.tex`, commented) |
| `arknights-website.md` | Arknights Teambuilding Tool (`projects-personal.tex`) |
| `arknights-pfp-dataset.md` | Personal project - Arknights PFP dataset (not in resume sections) |
| `credit-conserver.md` | Personal project - credit optimization tool (not in resume sections) |
| `issues-mcp.md` | Personal project - MCP server (not in resume sections) |
| `TartanHacks-2026.md` | TartanHacks 2026 hackathon (not in resume sections) |
| `HackCMU-2025.md` | HackCMU 2025 hackathon (not in resume sections) |
| `website-personal.md` | Personal website - thesuperRL.github.io + website repo |
| `website-codeberg.md` | Personal website - TypeScript version on Codeberg |
| `Webscrape-Researcher-PF.md` | Webscrape Researcher for PF debate (HS project, not in resume sections) |
| `Reinforced-Riichi-Player.md` | Reinforced Riichi mahjong player (personal project, not in resume sections) |
| `academic-misc.md` | 05-180 Bakeoff, Datasci Final, GFG-Unity, BWSI2, Time-converter, USA-Map, quik-task |

---

## Step 4 - Tailor

### Preset field rule (CRITICAL)
For any field that is already set in a section file - job title, company name, location, dates - copy it verbatim. Do NOT invent, reformat, or update it. The source files are ground truth for these values.

### Sections vs. Projects (CRITICAL)
`experience.tex` and `projects.tex` are distinct. Never move an entry between them. Whatever section a role lives in within the section files, it stays in that section in the generated resume.

### Honors (CRITICAL)
Honors and awards are a SEPARATE `\section{Honors \& Awards}` block, never inline items inside Education. Source from `honors.tex` if it exists; otherwise pull from `Profile.md`. Include: Dean's List, competition math results (AIME, USACO), debate placements, EPS award, hackathon placements.

### Bullet selection
Every bullet (active and commented) is a candidate. Activate bullets that match JD themes. Comment out bullets that are weak signal for this role.

### Page fill rule (CRITICAL)
The resume MUST fill the page to capacity: activate enough bullets, and include enough sections, that adding one more line would cause overflow. Never leave significant whitespace at the bottom. If the main sections are tight, activate commented projects. If still short, expand bullet wording. Never submit a resume with a half-empty bottom quarter.

### Skills section
Keep as-is unless the JD calls for a specific language or tool Ryan has but is not listed. Add it if so.

### Section order
Education -> Honors & Awards -> Technical Skills -> Experience -> Projects by default. Swap if the role is research-heavy (lead with Education before Honors).

---

## Step 5 - Assemble and Write

Build the full `.tex` inline (no `\input{}`). Structure:

```
[preamble.tex content]
[commands.tex content]
\begin{document}
[heading.tex content]
[tailored sections]
\end{document}
```

Filename: `Resume_{Company}_{Role}.tex` (spaces -> underscores). Write to `Resumes/Generated/`. Create the folder if it does not exist.

To compile: run `Resumes/compile.sh Resumes/Generated/Resume_{Company}_{Role}.tex` from the repo root. This script handles double-pass compilation, cleanup of auxiliary files, and opens the PDF automatically.

---

## Step 6 - Summary

After writing:
- Sections included
- Bullets activated or suppressed and why (one line each)
- Any eligibility flags that are still relevant
- Filename and compile command

Keep it tight.

---

## Notes

- `Resumes/Profile.md` = ground truth for eligibility. `General.md` has deeper context if needed.
- Never alter files in `Resumes/sections/` - always write a new standalone file.
- Never fabricate or alter contact info in `heading.tex`.
- If Ryan pastes a JD with obvious deal-breakers (e.g. PhD required, 5+ years), name them clearly before proceeding.
- The compile script lives at `Resumes/compile.sh`. If it does not exist yet, create it (see below).

## Compile Script (create once if missing)

Path: `Resumes/compile.sh`

```bash
#!/bin/bash
# Usage: ./compile.sh <path/to/file.tex>
# Compiles a LaTeX resume, removes auxiliary files, and opens the PDF.

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path/to/file.tex>"
    exit 1
fi

TEX=$(realpath "$1")
DIR=$(dirname "$TEX")
BASE=$(basename "$TEX" .tex)

cd "$DIR"

pdflatex -interaction=nonstopmode "$BASE.tex"
pdflatex -interaction=nonstopmode "$BASE.tex"

rm -f "$BASE.aux" "$BASE.log" "$BASE.out" "$BASE.fls" "$BASE.fdb_latexmk" "$BASE.synctex.gz" "$BASE.toc"

open "$BASE.pdf"
```
