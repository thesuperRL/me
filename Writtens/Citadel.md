# Citadel

## Prompt
In 150–300 words, share a story or experience that reflects who you are as a candidate.
- A challenge you've faced
- A passion of yours
- An achievement you're proud of

## Essay

Two weeks into my first college semester, I became the sole developer on a large-scale research study at Carnegie Mellon's CyLab, under Professor Lorrie Cranor. The task: build a modified SMS application that used LLMs to classify unknown-sender messages and warn users about potential scams in real time, then deploy it to real participants for a months-long study.

I designed the architecture from scratch, forking an open-source SMS app, engineering an encrypted data pipeline to an LLM backend, and making every technical decision alone with no senior developer above me.

The hardest moment came during a migration to Android SDK 34. SDK 34 handled messaging routing fundamentally differently from SDK 33, and messages were silently dropping. I couldn't reproduce it consistently. The researchers had a fixed study timeline. When I proposed tracing back to the last working upstream commit and rebuilding from there, they pushed back. It would take too long. Patch it and move on.

I disagreed. A patch would mask the problem indefinitely; the right fix was available if I was willing to look for it. I traced the exact commit where messaging last functioned, forked from that point in the upstream repository, and rebuilt my modifications on top of it. The fix held, and took less time than the researchers feared. I later identified the culprit: a quietly rolled-back upstream release with no changelog entry, the kind of thing a patch would never have caught.

That experience crystallized something I carry into every project: shortcuts compound. Following the natural workflow to the actual root is almost always faster than managing the consequences of avoiding it.

The study launched June 1. Data collection is complete. I'm a second author on the paper now being written.
