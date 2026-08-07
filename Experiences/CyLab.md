# CyLab — Research Assistant

**Lab:** Carnegie Mellon CyLab (CUPS Lab)
**PIs:** Professor Lorrie Cranor, Dr. Enze Liu
**Stack:** Kotlin, Android SDK, PostgreSQL
**Period:** Oct 2025 – Present

---

## Role

Sole developer on a large-scale study investigating how users respond to AI-generated scam warnings in SMS applications. Led all technical development; no senior developer above me. First time working collaboratively with researchers rather than just with a mentor.

---

## What Was Built

A fork of QUIK (open-source SMS app) modified to:
- Intercept messages from unknown senders
- Classify them via an LLM backend in real time
- Surface warnings to users if potentially fraudulent
- Transmit encrypted user interaction data to a backend for research collection

Repo: https://github.com/alexliu0809/cmu-android-warning-study

---

## Key Challenge: SDK 34 Migration

Android SDK 34 handled messaging routing fundamentally differently from SDK 33. Messages were silently dropping. Could not reproduce consistently. Researchers pushed for a patch and moving on due to timeline pressure.

Disagreed. Traced the exact commit where messaging last functioned in the upstream QUIK repo, forked from that point, and rebuilt all modifications on top of it. Fix held. Root cause: QUIK v4.2, a release that had been quietly rolled back with no changelog entry. A patch would have masked this indefinitely.

---

## Core Theme

Finding the right fix by going through natural workflows instead of applying stopgaps. This showed up repeatedly: during the SDK migration, and in smaller adjustments made during data collection when oversights surfaced in the live study.

---

## Results

- Study launched June 1
- Data collection complete
- Second author on paper currently being written
