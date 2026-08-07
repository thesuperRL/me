# SpaceX - Summer 2027 Software Engineering Internship

## Prompt
Please provide a summary highlighting your top two exceptional academic and/or professional accomplishments. Ideally, the examples you share will be a reflection of your most highly technical accomplishments and demonstrate why you are a top candidate for SpaceX.

## Response

**My two most technically significant accomplishments:**

**1. Designing a Bluetooth Low Energy Control System at Google**

During my internship on Google's Bluetooth R&D team, I was tasked with building a wireless alternative to XDTK, an internal system that used Wi-Fi to allow Android devices to act as real-time controllers for Unity applications. The constraint was non-trivial: Bluetooth Low Energy operates under far tighter bandwidth limits than Wi-Fi, has higher latency variance, and lacks the reliability guarantees that Wi-Fi provides in a controlled lab environment. My job was to make it work anyway.

I designed and implemented the full BLE communication stack from scratch in C# and C++, bridging the Android client and the Unity application host. The core technical challenge was packet integrity: BLE drops packets under interference, fragmentation is common, and out-of-order delivery can corrupt state. I engineered a custom streaming and reconstruction protocol that handled fragmentation, detected loss, and reconstructed the original payload without requiring retransmission in the common case, keeping latency low enough for real-time control use. The system had to remain functional in environments with no Wi-Fi at all, which removed the fallback entirely and made correctness non-negotiable.

I also authored the full technical documentation for the system: architecture diagrams, failure mode analysis, design decision logs, and a handoff guide for future engineers. This was not boilerplate. It was written knowing that the next person to touch this system would need to reason about BLE timing constraints and Android threading models without my context.

The result was a working alternative to the Wi-Fi system that operated successfully under the bandwidth and reliability constraints of BLE, validated across multiple Android devices and varying interference conditions. It expanded the usable environments for XDTK from Wi-Fi-only to anywhere a Bluetooth signal could reach.

This project mattered to me because it required me to think like a systems engineer: reason carefully about failure modes, design for constraints rather than around them, and leave the work in a state that others could trust and build on. That instinct is exactly what I want to bring to SpaceX.

---

**2. Building a Secure, Encrypted Data Pipeline for a Large-Scale Research Study at CMU's CyLab**

As a research assistant under Dr. Lorrie Cranor at CMU's CyLab security research lab, I led all technical development for an Android platform supporting a large-scale study on AI-powered scam detection. The project had two distinct technical challenges that I solved end to end.

The first was integrating a security module into an existing open-source SMS application. This was not a greenfield build. It meant reading, understanding, and modifying production-quality code I did not write, in a codebase designed for a different purpose, without breaking existing functionality. I implemented a real-time scam detection layer that intercepted incoming messages, ran them through an LLM-powered classification backend, and surfaced warnings to the user within the normal SMS flow. The integration had to be seamless - the study depended on participants using it as their actual SMS application, so any instability or intrusion into the UX would invalidate the data.

The second challenge was data integrity. The study required transmitting sensitive user interaction data from participants' devices to a research backend, and that data had to be protected end to end. I designed and implemented an encrypted transmission system that secured data in transit, with authentication and integrity guarantees appropriate for a study that would go before an IRB. The system had to be robust enough to handle intermittent connectivity on Android devices in the field, since participants were not in a lab.

What made this technically demanding was the combination of requirements: real-time performance on-device, correctness of the encryption and transmission layer, and non-disruption of an existing open-source codebase. I had to hold all three constraints simultaneously and make architectural decisions that satisfied all of them. The platform went into deployment for the study and is actively generating data toward a paper on which I expect secondary authorship.

This accomplishment reflects a different dimension of technical depth than the Google project: not protocol design under hardware limits, but security engineering under research constraints, with real consequences for both data integrity and participant experience.

---

Together, these two projects show what I think SpaceX is looking for: the ability to design systems under hard constraints, build for reliability rather than just correctness, work with existing codebases and infrastructure rather than only greenfield problems, and document work in a way that outlasts my own involvement. I am the kind of engineer who wants to understand why a system works, not just that it does.
