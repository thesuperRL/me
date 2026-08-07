# Google — Bluetooth R&D Intern (XDTK)

**Stack:** C#, C++, Android (Java), Unity, Bluetooth / BLE
**Period:** Jun 2024 – Sep 2024 (4 months)
**Location:** Seattle, WA
**Manager:** Mar Gonzalez-Franco, Head of Blended Intelligence Research and Devices Lab
**Repo:** https://github.com/thesuperRL/XDTK32Feet

---

## Role

Designed and implemented a Bluetooth Low Energy alternative to Google's Wi-Fi-based XDTK system, enabling Android devices to function as low-latency controllers for Unity applications under stricter bandwidth and reliability constraints, and in Wi-Fi-less environments.

---

## What Was Built

- Custom C++ DLL to add BLE support to Unity (which has no native Bluetooth support)
- Android app in Java to manage Bluetooth connections and transmit phone data (rotation, acceleration, touch)
- Resilient packet streaming and reconstruction protocol to prevent loss and corruption across varying BLE conditions
- Controlled packet splicing inspired by commercial stream handling methods to address BLE's strict packet-size limitations
- Detailed technical documentation and system diagrams covering design decisions, failure cases, and iterative refinements

---

## Key Technical Challenge

BLE imposes strict packet-size limitations that caused packet loss and data splicing. Implemented controlled packet splicing to mitigate this. Transformed a system that barely handled one phone connection into one that reliably managed two simultaneous devices.

Also identified and corrected a division error in mentors' existing code that caused laggy and inconsistent touch input handling.

---

## Results

- Received exceptional praise from mentors and lab leadership for deliverables and presentation
- Work presented to and praised by Microsoft 3D AI researchers
- Documentation and diagrams authored to support future R&D
