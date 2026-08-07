# Academic and Miscellaneous GitHub Repos

A collection of smaller academic, class, and experimental repos by thesuperRL.

---

## 05-180-Bakeoff-1

**Language:** Processing (Java)
**Active period:** 2026-03-16 to 2026-03-29
**Nature:** CMU course 05-180 (Interaction Design) pointing bake-off assignment. Implements a targeting task UI where the user clicks on a sequence of targets. Ryan iterated on the interaction design: adding keyboard shortcuts, hover indicators, snapping mouse behavior, and a red line visual guide to the next target. Data collection was the deliverable (performance metrics for the bake-off).
**Fork of:** Original

### Design Decisions
- Built in Processing (`.pde` file) as required by the course
- Keyboard can jump between buttons, removed mouse press fallback to isolate click as input
- Snapping mouse and hover effects added to improve pointing speed
- Red line drawn from cursor to next target as a visual guide
- 16 commits documenting iterative tuning: stroke removal, window size changes, data collection triggers

### Ryan's Contributions
Sole developer. All 16 commits are Ryan's.
- `24c5bce` initial
- `b69ccd9` feat: red line to target
- `4336328` Keyboard allows for jumping between buttons now
- `419074a` feat: snapping mouse
- `41040dc` feat: final data collection
- `ed71b49` fix: pasttime

---

## Datasci-Final

**Language:** Python
**Active period:** 2023-10-30 to 2023-11-15
**Nature:** Final project for a data science course. Predicts US state-level crime rates from socioeconomic indicators (poverty, unemployment, education, area) using a Keras/TensorFlow neural network. Includes full data cleaning pipeline and model evaluation with ELI5 feature attribution.
**Fork of:** Original

### Design Decisions
- `datacleaning.py` joins 4 CSVs (FBI Crimes, Census Poverty, Unemployment, Area) into a single cleaned dataset; derives `crime_rate` as crimes per 100,000 population
- `main.py` loads the cleaned data, splits train/test 80/20, builds a Keras Sequential model: Dense(4, relu) -> Dense(8, relu) -> Dropout(0.125) -> Dense(1, relu)
- Loss: BinaryCrossentropy from logits (acknowledged as suboptimal for regression; MSLE was considered)
- ELI5 used for post-hoc feature importance on the trained model
- `result.html` is the rendered output artifact
- 23 commits with incremental data ingestion, model tuning, and cleaning

### Ryan's Contributions
Sole developer. Data sourced from FBI UCR and Census Bureau; merged and cleaned independently.

---

## GFG-Unity

**Language:** C#
**Active period:** 2024-07-19 to 2024-07-19
**Nature:** Unity project likely for Games for Good (GFG), a CMU initiative applying game design to social impact contexts. Uploaded as a snapshot; 2 commits total.
**Fork of:** Original

### Ryan's Contributions
Sole developer. Single-session commit of the Unity project (July 2024).

---

## BWSI2

**Language:** None (config/docs only)
**Active period:** 2024-03-23 to 2024-03-23
**Nature:** MIT Beaver Works Summer Institute (BWSI) Git-It exercise repository. Trivial repo created as part of a BWSI Git training exercise.
**Fork of:** Original

### Ryan's Contributions
1 commit. Created as a tutorial/exercise artifact.

---

## Time-converter

**Language:** HTML
**Active period:** 2021-08-30 to 2021-08-30
**Nature:** Ryan's first HTML project ("random first project lel"). A simple time conversion tool built as a personal learning exercise in late August 2021.
**Fork of:** Original

### Ryan's Contributions
Sole developer. 2 commits. Earliest public project in the GitHub history.

---

## USA-Map

**Language:** HTML
**Active period:** 2023-09-03 to 2023-09-06
**Nature:** US History class assignment. An interactive choropleth map of personal income per capita by US state using Q1 2023 BEA data and 2022 Census population estimates. Users can hover over states for exact values and zoom in/out. Rendered as `PIbS.html` opened in a browser.
**Fork of:** Original

### Design Decisions
- Pure HTML/JavaScript; no framework
- Data sourced from Bureau of Economic Analysis and US Census Bureau
- Income per capita computed as total state personal income divided by state population estimate
- 6 commits covering initial build and data/legend refinements

### Ryan's Contributions
Sole developer.

---

## hello-world

**Language:** None
**Active period:** 2023-03-14 to 2023-03-14
**Nature:** Trivial hello-world repo ("i am very sane right now, why do you ask?"). README says "yo yes hello me is me very funny". Created March 2023 as a joke/test repository.
**Fork of:** Original

### Ryan's Contributions
2 commits. Not a real project.

---

## arknights-randomizer

**Language:** JavaScript
**Active period:** 2026-06-20 to 2026-06-20
**Nature:** Fork of KiCCl/fz. English translation and reskin of a Chinese Arknights "PRTS Random Challenge Terminal" tool for generating random Arknights challenge runs. Deployed to GitHub Pages at thesuperrl.github.io/arknights-randomizer/ and styled to match the main arknights-website tier list site.
**Fork of:** KiCCl/fz

### Design Decisions
- Localized interface from Chinese to English
- UI redesigned to match the visual theme of Ryan's existing arknights-website
- Added GitHub Pages deployment workflow (Forgejo Actions -> GitHub Actions)
- Modularized JavaScript and CSS as a refactor step before styling
- Custom subdomain support documented (CNAME approach)

### Ryan's Contributions
All 11 commits are Ryan's (forked and modified in one day, June 20 2026).
- `f6cc1a9` refactor: modularize javascript and css
- `81f32a8` feat: localize interface to English and add GitHub Pages deployment
- `98bb133` style: redesign UI to match main website theme and update deployment workflow
- `118e337` feat: improve constraint formatting and add original author credits

---

## Congress-Debate-App

**Language:** None
**Active period:** 2024-10-07 to 2024-10-07
**Nature:** A simple Congressional debate recency tracker. Tracks which bills/items have been debated recently to help competitors avoid speaking on exhausted topics. Created in a single session (Oct 2024); 1 commit.
**Fork of:** Original

### Ryan's Contributions
Sole developer. 1 commit. Minimal tool for debate practice logistics.

---

## quik-task

**Language:** Kotlin
**Active period:** 2025-11-02 to 2025-11-11
**Nature:** Fork of quik-sms/quik (the QKSMS-derived open-source Android SMS app). Ryan added a "duplicate conversation" feature, copying all messages from one conversation thread to another with live sync, and added visual indicators for duplicated conversations.
**Fork of:** quik-sms/quik

### Design Decisions
- Feature branch workflow: each change proposed as a pull request into the fork's main branch
- Duplicate conversation implemented by copying messages and enabling a live-update listener so incoming messages to the source are also appended to the duplicate
- Duplication indicators added visually to distinguish copied conversations
- Dependency troubleshooting branch handled Gradle/build issues when setting up the Android project

### Ryan's Contributions
All meaningful commits are Ryan's (18 commits across feature branches + merges, Nov 2-11 2025).
- `9dffdff` feat: duplicates a conversation
- `f2be5fc` feat: complete message copy by making live update
- `720ebc5` fix: sync incoming messages too
- `53a4bde` feat: append duplication indicators
- `19d97f9` fix: remove doubled message copying
- `6b54818` finishing touches
