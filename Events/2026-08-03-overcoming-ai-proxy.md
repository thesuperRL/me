# Overcoming the AI Proxy Problem
**Date:** 2026-08-03 (ongoing process, started ~Aug 2026)
**Context:** ScottyLabs DevOps Tech Lead + MaxMyPoint AI Engineer

---

## What Happened

Ryan recognized across two roles that he had been operating as an AI proxy rather than a developer: generating working code without fully understanding it or making the design decisions himself.

Two separate causes, two separate resolutions:

**ScottyLabs (structural cause):**
- Missing documentation on the inherited DevOps stack left a knowledge vacuum
- Vibecoding filled the gap; AI was making design decisions by default
- Got called out by the team for AI-generated comments and docs appearing in the codebase, and for making changes without full understanding of the repo

**MaxMyPoint (motivational cause):**
- Had mentally decommitted from the role; was going through the motions
- Vibecoded the LangGraph + PydanticAI chatbot stack
- Got drilled in a leadership meeting on the chatbot he built and could not answer basic questions about it
- In frustration, built a full hour-long Google Slides presentation to master the system end to end
- The presentation was not the cause of re-engagement; it was the proof of it
- Re-engagement came from recognizing the genuine value of the opportunity and not wanting to have wasted his time

---

## The Hard Moment

- Getting drilled publicly in the MMP leadership meeting and having no answers
- Being called out at ScottyLabs for AI artifacts in production code
- Recognizing the pattern himself: he was reviewing AI output, not making decisions

Feeling: frustration, then resolve. Same pattern as the deployment unblock.

---

## Actions Taken

1. **Harness rules:** Added two rules to this AI harness:
   - LLMs must explain their reasoning, not just produce output
   - No commits allowed through AI; Ryan reads every diff and writes his own commit messages

2. **ScottyLabs calls:** Started 3x/week calls with Anish (original stack author) to learn the system from the ground up and write the missing documentation by hand

3. **MMP presentation:** Rage-built a full hour-long Google Slides deck reconstructing and fully documenting the chatbot stack after the leadership meeting. Now understands the system completely.

---

## Reasoning at the Crux

- The line Ryan draws: can he understand the code himself and make the design decisions himself, without AI if necessary?
- Vibecoding is not wrong because AI is involved; it is wrong when it means Ryan does not understand what he shipped or why
- The renovate change at ScottyLabs is the clearest proof of the shift: rejected the AI suggestion to build a custom org-wide devenv scanner, reached for Renovate's built-in custom manager instead, because he understood the infrastructure and the standardization goals well enough to know the difference
- Design decisions now come from Ryan; AI helps execute them

---

## Result

- ScottyLabs infrastructure code now readable at a glance; calls with Anish still ongoing
- MMP chatbot stack fully understood; re-engaged with genuine investment
- Making design decisions himself on both stacks; AI assists implementation
- Self-assessment: "still somewhere in the middle, but a lot more closer to" being a real developer
- The trajectory matters as much as the current position

---

## Lesson Formalized

- A knowledge vacuum will get filled somehow; if you don't fill it with understanding, AI will fill it with plausible-looking code
- The fix for structural vibecoding (missing docs, unfamiliar stack) is different from the fix for motivational vibecoding (decommitment): the former needs structured learning, the latter needs a reason to care
- Public embarrassment is a forcing function, but the real shift is the internal standard: would I be able to do this without AI if I had to?

---

## Core Theme: Accountability to Craft

- Ryan's words: "a real developer, capable of using AI to assist me, rather than a proxy for an AI agent"
- The distinction is not about AI involvement; it is about who is making the decisions and whether Ryan understands what he shipped
- Frustration as fuel appears again: both the presentation and the three-times-a-week calls came out of being forced to confront a gap he did not want to have

---

## Potential Writing Angles

- The difference between using a tool and being used by it; most people can't articulate where that line is
- The presentation story is a strong scene anchor: got drilled, couldn't answer, went home and built a deck anyway
- The renovate design decision as a before/after: same task, two different approaches, the difference is knowledge
- The harness rules as a commitment device: not trusting yourself to maintain the standard, so building a system that enforces it
