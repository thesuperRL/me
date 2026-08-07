# MaxMyPoint: Deployment Unblock
**Date:** 2026-08-02
**Context:** MaxMyPoint AI Engineer internship

---

## What Happened

- AI system built and fully functional for approximately 1 month
- Undeployed the entire time due to a broken permissions chain in a 4-person team
- Permissions owner rarely checked the group chat; did not know which permissions GAE deployment required
- When she did add permissions, missed Storage Admin; deploy still failed
- Ryan's fix turnaround: ~1 day. Their deployment turnaround: multiple days. Each failed cycle cost roughly a week
- Company deadlines slipping. Ryan felt his work was complete but unrealized, and felt underestimated in leadership meetings

---

## The Hard Moment

- Called a 4-hour working session with 2 of the 4 team members (permissions owner was catching a flight)
- Had to direct a team member's screen remotely without being able to see it himself
- Naming details she could not see, walking her through specific clicks, lots of back-and-forth acquiring and confirming permissions
- Feeling: frustrated but held the call together
- Partway through, mission shifted from "get this deployment working today" to "get me full observability and control on my own device so I never need this loop again"
- That shift was not planned; it crystallized after repeated friction made the root problem clear

---

## Reasoning at the Crux

- Recognized the pattern from prior cycles: passive list-sending and waiting did not work
- A month of finished-but-unrealized work + feeling underestimated + resume motivation made inaction intolerable
- Explicit pivot mid-call: started by troubleshooting on her laptop, realized he needed direct control, changed the entire goal of the session
- Past self would have sent a lazy list of permissions and waited. Did not do that this time.

---

## Result

- AI system now deployed on the testing server, releasing soon
- Ryan has full deploy access on his own device; can troubleshoot end-to-end without a middleman

---

## Lesson Formalized

- At the start of any project: send a complete requirements list before you need things added
- If it stalls anyway: set up a live call (hackathon-style) to resolve it in real time and confirm live
- Do not wait on slow cycles when you can own the loop yourself

---

## Core Theme: Frustration as Fuel

Ryan's words: "turning frustration into motivation"

Same pattern across multiple events:
- This deployment: blocked for a month, called a 4-hour session and took control
- Chatbot deep-dive: drilled in a leadership meeting, couldn't answer because he had vibecoded it; in frustration built a full hour-long Google Slides presentation and now knows the system fully
- Credit-conserver project: frustrated that a tool didn't exist, built it himself with AI assistance
- Connected to YC Startup School 2026 talk by the Clawfather: started OpenClaw because he found a frustration and sought to resolve it

---

## Potential Writing Angles

- Frustration as a signal: when something takes this long to unblock, the root problem is usually ownership, not difficulty
- The moment the mission changed mid-call is a strong scene anchor
- The chatbot presentation story (vibecoded, then rage-studied) is a strong companion anecdote
