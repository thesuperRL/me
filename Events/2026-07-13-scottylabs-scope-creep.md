# ScottyLabs: Scope Creep and Working Within Constraints
**Date:** 2026-07-13 (ongoing; conversation logs from this date)
**Context:** ScottyLabs DevOps and Internal Tooling Tech Lead

---

## What Happened

- Anish (Director of Tech, original designer of the infrastructure) keeps introducing new tools and system changes without fully coordinating with the team or the users of the devops system
- Examples: implementing secretspec (caused almost every devenv to break), moving devenv into kennel (caused additional friction)
- Ryan is the primary person cleaning up the fallout each time
- Pattern recognized: by absorbing the cost, Ryan enables the cycle to continue. Anish never feels the full weight of the changes he makes.
- Ryan ran for Director of Tech. Was the more popular candidate until previous leadership explicitly intervened, naming lack of experience as the concern, to steer the vote toward Anish.
- Ryan accepted the reasoning as fair: he had not yet displayed much leadership or coordination evidence, and leadership had an interest in giving Anish the experience. But the margin surprised him.
- Entered the race prepared to lose and build evidence for next year. The explicit block was unexpected, not the loss itself.
- After losing, did not disengage. Shifted focus to acting on the problems he named in his speech from his current position.
- Ryan's framing on where he is now: "I'm happy. I don't care that I lost. I care that I'm in a position where I'm able to try my best to get those things I mentioned done, and vindicate myself and have something to prove my worth for the next election."

---

## The Hard Moment

- Not a single crux: a repeated one
- At least 3 separate conversations with Anish where Ryan named the problem directly
- Most documented: 7/13/26 chat log
- Ryan's exact words: "you cant take care of everything because if we all rely on you we all become worthless"
- Also: "if you keep making significant changes without having anyone catch up, people who want to learn like me keep trying to learn and wasting time on a lot of things that you deprecate"
- Anish acknowledged the problem each time, explained he couldn't find a clean spot to step back
- Nothing changed after any of the three conversations

---

## Reasoning at the Crux

- Ceiling is real: student org, no escalation path beyond the director
- Tech team largely agrees with Ryan but he will not move to overthrow his friend
- Self-aware about being an enabler: "I do see how I am kinda an enabler in that sense though"
- Hypothesis on why Anish wanted the role despite not being suited to it: "maybe for the name"
- Decision: work within the constraint. Document. Slow changes where possible. Make devops human rather than advanced.
- Not trying to win a political fight; trying to preserve what the stack was built for

---

## Actions Taken Without Being Asked

- Shifted personal priority: comprehensibility over SOTA capability
- Primary developer of docs.scottylabs.org
- Organized and led a meeting with the design team on day one of the new directors, seeking to revive the tech-design relationship (named in election speech as a priority)
- Built a project board to organize devops internal issues
- Built a ticket board to organize external requests by urgency
- Plans to speak to Anish again about delaying changes that aren't actively needed

---

## Result

- Stack still moving faster than documentation in some areas
- Ryan has accepted this as a temporary constraint, not a permanent one
- Every part of his election speech is being vindicated by events
- The loss gave him a year to build the evidence the intervention said he lacked
- Secondary observation: CMU CS students generally cannot public speak or lead organizationally; people join ScottyLabs tech to work, not to lead. Ryan's debate background made his speech the standout in the election. That gap is part of what he is trying to address structurally.

---

## Lesson Formalized

- Acknowledging a problem and fixing it are different things; three acknowledged conversations with no change is data, not a fluke
- Absorbing fallout is sometimes necessary to protect the team, but it removes the feedback loop that would create accountability
- When you can't escalate and won't overthrow, the move is to build the alternative in plain sight: documentation, structure, human-scale systems
- The friendship constraint is real and worth honoring; the question is how much you can slow things down from within

---

## Core Theme: 不忘初心 (Don't Forget Why You Started)

- Ryan's framing: the stack exists for the people using it, not for the people building it
- The director optimizes for technical advancement; Ryan optimizes for the audience
- Every action Ryan takes outside his formal mandate (docs, meetings, boards, ticket systems) is an expression of this
- The election loss did not change the goal, only the position from which he pursues it

---

## Potential Writing Angles

- Working within a constraint you can see clearly but can't remove: how you act matters more than whether you win
- The enabler insight is honest and rare: most people don't name their own role in a bad pattern
- The gap between acknowledgment and change: what to do when the person above you agrees with you but doesn't act
- 不忘初心 as a leadership principle: the best technical decisions come from knowing who the system is for
- The election loss as clarifying rather than defeating: he knew what he wanted to do and did it anyway
- The intervention by previous leadership as a gift in disguise: named the exact gap he needed to close, and gave him a year to close it publicly
- Public speaking and organizational talent as undervalued and underdeveloped in tech orgs: the person who can do both has a durable edge
