# MaxMyPoint / MaxFHR — AI Engineer, Data Scientist, Full Stack Engineer

**Stack:** Python, LangGraph, PydanticAI, AWS AgentCore, PostgreSQL, MCP Servers
**Period:** Dec 2024 – Present
**Website:** https://maxmypoint.com/

---

## Roles

**AI Engineer** (Dec 2024 – Present)
Building a LangGraph + PydanticAI + AWS AgentCore chatbot to assist 56,000+ users in navigating the website and suggesting optimal travel plans.

**Data Scientist** (Dec 2025 – Jul 2026)
Processing PostgreSQL data to track hotel alert success rates by type, hotel, and time. Creating visually effective data pages and an API to analyze hotel point redemption effectiveness. Engineering automatic workflows for continued accuracy.

**Full Stack Engineer, MaxFHR** (Mar 2026 – May 2026)
Created the full stack of a map display system for hotels, designing caches to increase loading speed and optimizing frontend navigation.

---

## What Was Built

- LangGraph + PydanticAI + AWS AgentCore chatbot for 56,000+ users
- MCP server allowing the chatbot to conduct operations for users, gated by account level and question relevance
- Repeated prompt engineering and fine-tuning on DeepSeek and OpenAI models for safety, consistency, and accuracy
- AWS AgentCore Memory to track user questions, frequency, and history for improved UX
- Hotel alert success rate tracking and data display pages
- Automatic data analysis workflows
- Full-stack map display system for MaxFHR with caching layer

---

## Context

Role involves coordinating with a small team on front-end and back-end choices and communicating with leadership to establish features and next steps. First experience defining the information a chatbot knows and the actions it is permitted to take, deepening interest in AI non-deterministic behavior and output control.

---

## Experience: Unblocking the Deployment (Aug 2026)

### Scene

- AI system built and fully functional, sat undeployed for approximately 1 month
- Blocker: broken permissions chain in a 4-person team
- Person who owned permissions rarely checked the group chat
- She did not know which permissions were needed for GAE deployment
- When she did add permissions, missed a critical one: Storage Admin, so deploy still failed
- Ryan's fix turnaround: ~1 day. Their deployment turnaround: multiple days. Each cycle cost the project roughly a week
- Repeated failed cycles with Ryan pushing fixes that couldn't be confirmed or deployed on their end
- Stakes: Ryan's work was complete but unrealized; company deadlines slipping; Ryan felt underestimated in leadership meetings

### The Hard Moment

- Called a working session with 2 of the 4 team members (permissions owner was catching a flight, not present)
- Session lasted 4 hours
- Had to direct a team member's screen remotely without being able to see it himself
- Named details she could not see; walked her through specific clicks
- Lots of back-and-forth acquiring and confirming permissions mid-call
- Partway through, mission shifted: from "get this deployment working today" to "get me full observability and control on my own device so I never need this loop again"
- That shift was not planned at the start; it crystallized after repeated friction made the root problem clear
- Feeling during the hard stretch: frustrated, but held the mission

### Reasoning at the Crux

- Recognized the pattern from prior cycles: passive list-sending and waiting did not work
- Past experience: would have sent a lazy list of permissions and waited, not called anyone
- What changed: a month of finished-but-unrealized work, feeling underestimated, and resume motivation made inaction intolerable
- Explicit thinking: "I need to be able to full-stack it myself"
- Strategy shift mid-call: started by troubleshooting on her laptop, realized he needed direct control, pivoted the entire goal of the call

### Result

- AI system now deployed on the testing server
- Release coming soon
- Ryan now has full deploy access on his own device; can troubleshoot end-to-end without a middleman
- Lesson formalized for future: send full requirements list before work begins; if it stalls, set up a live hackathon to resolve it in real time and confirm live

### Core Theme: Frustration as Fuel

- When something doesn't exist or doesn't work, Ryan converts that friction into something concrete
- Same pattern appears in:
  - This deployment: frustration with blocked work led to a 4-hour takeover call
  - The chatbot deep-dive: drilled in a meeting and couldn't answer because he had vibecoded it; in frustration, built a full hour-long Google Slides presentation and now knows the system fully
  - Credit-conserver project: frustration with a missing tool led to building it himself with AI assistance
- Connected to YC Startup School 2026 talk by the Clawfather on starting OpenClaw out of a felt frustration
- Principle in Ryan's words: "turning frustration into motivation"

---

## Experience: Overcoming the AI Proxy Problem (Aug 2026)

### Scene

- Mentally decommitted from the role during a slow period; vibecoded the LangGraph + PydanticAI chatbot stack without fully understanding it
- Got drilled in a leadership meeting on the chatbot architecture and could not answer basic questions
- In frustration: built a full hour-long Google Slides presentation reconstructing and documenting the entire chatbot stack
- The presentation was not the cause of re-engagement; it was the proof of it

### Reasoning at the Crux

- The gap was motivational, not structural: Ryan had the ability to understand the system but had not invested in doing so
- Re-engagement came from recognizing the genuine value of the opportunity and not wanting his time to have been wasted
- The standard he set for himself: would I be able to explain this without AI if someone asked right now?

### Result

- Full understanding of the MMP chatbot stack
- Re-engaged with genuine investment; now making design decisions himself with AI assisting execution
- Imposed new rules on his AI harness: LLMs must explain their reasoning; he reads every diff and writes his own commit messages

### Core Theme: Accountability to Craft

- Ryan's words: "a real developer, capable of using AI to assist me, rather than a proxy for an AI agent"
- The line he draws: does he understand the code himself and make the design decisions himself, without AI if necessary?
