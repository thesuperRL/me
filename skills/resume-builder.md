---
name: resume-builder
description: Interview the user about a job application and assemble a tailored 1-page LaTeX resume from their section library in Resumes/sections/
---

## Purpose

Take a job description, check eligibility, then assemble a tailored 1-page LaTeX resume from `Resumes/sections/`. Output a new `.tex` to `Resumes/Generated/`.

---

## Step 1 - Intake

Ask two things in one message:

1. **Company and role** - company name and exact job title.
2. **Job description** - paste it in full. You'll extract everything you need from it.

Do not ask for anything else. Do not proceed until you have both.

---

## Step 2 - Eligibility Check

Read `Resumes/Profile.md`. Cross-reference it against the JD requirements. Before doing anything else, surface a brief flag list:

- **Requirements NOT met** - hard requirements (degree level, years of experience, specific tools, citizenship) that are missing. Call these out directly.
- **Soft gaps** - preferred qualifications that are light.
- **Strong matches** - 2-3 things that directly align.

Format it as a short block, then ask: *"Want to proceed with the resume anyway?"* Wait for confirmation before continuing.

---

## Step 3 - Read Section Library

Read all files in `Resumes/sections/`:
- `preamble.tex`, `commands.tex`, `heading.tex` - always included, never modified
- `education.tex`, `skills.tex`, `experience.tex`, `projects.tex`, `honors.tex` - tailored per role

**Also read the relevant `Repo Indexing/` files** for any project or role that appears in the sections being tailored. These contain commit-level specifics, accurate contribution framing, and technical depth needed to write or evaluate bullets accurately.

---

## Step 4 - Tailor

### Preset field rule (CRITICAL)
For any field that is already set in a section file - job title, company name, location, dates - copy it verbatim. Do NOT invent, reformat, or update it. The source files are ground truth for these values.

### Sections vs. Projects (CRITICAL)
`experience.tex` and `projects.tex` are distinct. Never move an entry between them. Whatever section a role lives in within the section files, it stays in that section in the generated resume.

### Honors (CRITICAL)
Honors and awards are a SEPARATE `\section{Honors \& Awards}` block, never inline items inside Education. Source from `honors.tex` if it exists; otherwise pull from `Profile.md`.

### Bullet selection
Every bullet (active and commented) is a candidate. Activate bullets that match JD themes. Comment out bullets that are weak signal for this role.

### Page fill rule (CRITICAL)
The resume MUST fill the page to capacity: activate enough bullets, and include enough sections, that adding one more line would cause overflow. Never leave significant whitespace at the bottom. If the main sections are tight, activate commented projects. If still short, expand bullet wording. Never submit a resume with a half-empty bottom quarter.

### Skills section
Keep as-is unless the JD calls for a specific language or tool that is present but not listed. Add it if so.

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

Filename: `Resume_{Company}_{Role}.tex` (spaces to underscores). Write to `Resumes/Generated/`. Create the folder if it does not exist.

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
- If the JD has obvious deal-breakers (e.g. PhD required, 5+ years), name them clearly before proceeding.
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
