# ScottyLabs — DevOps and Internal Tooling Tech Lead

**Stack:** Nix Language, Rust, TypeScript
**Period:** Sep 2025 – Present (DevOps Member Sep–Nov 2025; Tech Lead Nov 2025–Apr 2026; DevOps and Internal Tooling Tech Lead Apr 2026–Present)

---

## Role

Tech lead for DevOps and internal tooling across ScottyLabs, a student org at CMU. Responsible for infrastructure that serves 3,000+ users and supports nearly every project within ScottyLabs.

---

## What the Role Covers

- Hosting and managing a NixOS VM that provides data modules and services to diverse ScottyLabs projects
- Maintaining websites and services for 3,000+ users
- Acted immediately to fix VM crashes that caused outages for 3,000+ users
- Conducted a large-scale migration of the majority of past systems to more secure and optimized alternatives
- Used Rust and declarative programming to develop applications that manage and standardize the backend of new projects
- Building internal applications to improve communication and organizational observability, including AI-based monitors
- Leading a small team: distributing tasks by skill fit, interacting with every sector of ScottyLabs to understand their actual hosting needs

---

## Core Themes

**Humanitarian utility over technical elegance.** Decisions about what to build or fix are driven by what unblocks people and improves their workflow, not what is architecturally impressive. The question is always what the teams actually need to ship.

**Natural workflows over stopgaps.** Consistent with CyLab work: quick workarounds create compounding cost for everyone downstream. The migration of past systems and immediate VM crash response both reflect this.

---

## Context

Became DevOps Member first semester of college (Sep 2025). Promoted to Tech Lead within two months. Responsible for allocating resources and hosting to nearly every project in ScottyLabs from the start.

---

## Experience: Overcoming the AI Proxy Problem (Aug 2026)

### Scene

- Missing documentation on the inherited DevOps stack left a knowledge vacuum; vibecoding filled it
- Got called out by the team for AI-generated comments and docs appearing in the codebase, and for making changes without full understanding of the repo
- Root cause: the stack was moving faster than documentation could keep up, and Ryan was filling the gap with AI rather than understanding

### Actions

- Started 3x/week calls with Anish (original stack author) to learn the system from the ground up
- Wrote missing documentation by hand to force familiarity
- Added harness rules: LLMs must explain their reasoning; no commits through AI

### Result

- Most infrastructure code now readable at a glance
- Making design decisions himself: renovate custom manager change (Aug 2026) is the clearest example — rejected the AI suggestion to build a custom org-wide devenv scanner, reached for Renovate's built-in custom manager because he understood the system and standardization goals well enough to know the difference
- Calls with Anish still ongoing; documentation gap closing

### Core Theme: Accountability to Craft

- A knowledge vacuum will be filled somehow; if Ryan does not fill it with understanding, AI fills it with plausible-looking code
- The fix here was structural: missing docs needed structured learning, not just more effort
- Consistent with the standardization standard Ryan holds the rest of ScottyLabs to: you cannot hold others to a bar you are not meeting yourself

---

## Experience: Working Within Constraints (Jul 2026 - ongoing)

### Scene

- Director of Tech (Anish, who designed the infrastructure) kept introducing new tools and changes without coordinating with the team: secretspec broke nearly every devenv, moving devenv into kennel caused additional friction
- Ryan was the primary person absorbing and cleaning up the fallout each time
- Recognized he was enabling the pattern: by cleaning up, he removed the feedback loop that would otherwise slow Anish down
- Ran for Director of Tech, lost due to perceived lack of experience
- Did not disengage. Kept working on the problems named in his election speech from his current position.

### The Hard Moment

- At least 3 separate conversations with Anish naming the problem directly
- Ryan's exact words from the 7/13/26 log: "you cant take care of everything because if we all rely on you we all become worthless"
- Anish acknowledged the problem each time. Nothing changed.
- Ceiling is real: student org, no escalation path beyond the director. Won't overthrow his friend.

### Actions Taken Without Being Asked

- Shifted personal priority to comprehensibility over SOTA capability
- Primary developer of docs.scottylabs.org
- Organized and led a meeting with the design team on day one of the new directors
- Built a project board for devops internal issues and a ticket board for external requests by urgency

### Core Theme: Not Forgetting Why You Started

- Ryan's framing: the stack exists for the people using it, not the people building it
- Every action taken outside his formal mandate is an expression of this
- The election loss did not change the goal, only the position from which he pursues it
