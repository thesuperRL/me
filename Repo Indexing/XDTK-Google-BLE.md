# XDTK — Google AR Internship (Bluetooth Addition)

**Owner:** thesuperRL (Ryan C. Li)
**Platform:** GitHub
**Nature:** Ryan's Google AR internship work (Summer 2024) adding Bluetooth Classic transport to [XDTK](https://github.com/google/xdtk), Google's open-source Cross-Device Toolkit for Android ↔ Unity interaction, which had already been published and open-sourced before Ryan joined. Ryan was brought on to extend it with Bluetooth support as an intern project — not original research toward a new publication. The work spans 5 repos: the Android Java sender (fork of google/xdtk, with Ryan and mentor ejgonz as the two active contributors), a Windows .NET DLL, a Unity C# transceiver, and two early test stubs.
**Mentor org:** Google AR (Eric J. Gonzalez / ejgonz, Mar Gonzalez-Franco)
**Active period:** June 28, 2024 – September 19, 2024

---

## Repos in This Group

| Repo | Role | Language | Commits |
|------|------|----------|----------|
| [thesuperRL/xdtk](https://github.com/thesuperRL/xdtk) | Fork of google/xdtk — Android Bluetooth sender | Java | 65 ahead of upstream |
| [thesuperRL/XDTK-Unity-Side](https://github.com/thesuperRL/XDTK-Unity-Side) | Unity C# Bluetooth receiver / transceiver | C# | ~28 |
| [thesuperRL/XDTK32Feet](https://github.com/thesuperRL/XDTK32Feet) | .NET DLL wrapping 32feet Bluetooth | C# | 9 |
| [thesuperRL/XDTK-Bluetooth-Test-Run](https://github.com/thesuperRL/XDTK-Bluetooth-Test-Run) | Early test stub (empty) | — | 1 |
| [thesuperRL/XDTK-Bluetooth-Unity-Test](https://github.com/thesuperRL/XDTK-Bluetooth-Unity-Test) | Early test stub (empty) | — | 0 |

---

## System Architecture

```
Android Phone (thesuperRL/xdtk fork)
  └─ BluetoothClassicHandler.java
       │  RFCOMM / Serial Port Profile (BT Classic)
       │  Custom packet protocol: messages joined by "|" separator
       │  Flow control: waits for HEARTBEAT ACK from Unity before next batch
       ▼
Windows PC running Unity
  ├─ XDTK32Feet.dll  (thesuperRL/XDTK32Feet)
  │    └─ BluetoothReceiver.cs
  │         • BluetoothDevicePicker.PickSingleDeviceAsync() → native Windows BT picker
  │         • Iterates 16 custom GUIDs (59a8bede-af7b-49de-b454-e9e469e740aX)
  │           to find the working RFCOMM channel
  │         • Returns Stream to Unity caller
  └─ Unity Project  (thesuperRL/XDTK-Unity-Side)
       └─ BluetoothTransceiver.cs  (extends XDTK Transceiver)
            • Generates 16 GUIDs on Start()
            • Space key → new BluetoothAgent → picker popup → background read thread
            • One BluetoothAgent per phone (multi-device support)
            • Half-packet reassembly: pastHalfPacket + subpackets[0] stitching
            • Routes DEVICE_INFO → device prefab registration
            • Routes sensor data → Device.ParseData() per registered device
            • MAC address used for device identity and prefab reuse on reconnect
```

---

## Repo 1: thesuperRL/xdtk (Fork of google/xdtk)

**Owner:** thesuperRL  
**Platform:** GitHub  
**Nature:** Fork of [google/xdtk](https://github.com/google/xdtk) — the Android side of XDTK. Ryan added Bluetooth Classic support to the existing WiFi-only sensor-streaming Android app, enabling it to transmit IMU, touch, and ARCore pose data over RFCOMM alongside (or instead of) the original UDP transport.  
**Language:** Java  
**Active period:** June 28, 2024 – September 19, 2024  
**Fork of:** google/xdtk (diverged 65 commits ahead, 5 behind as of last push)

### Design Decisions
- **BLE abandoned after ~5 weeks of failed attempts:** Ryan spent late June through July 31 trying BleWinrtDll, 32feet's InTheHand.Bluetooth BLE library, custom WinRT DLLs, and Microsoft's BLE sample code. The fundamental blocker was that Windows/Unity could discover BLE devices and services but could not trigger characteristic subscription notifications — BLE characteristic reads either errored out or silently returned nothing, reproducibly across multiple machines and libraries. Moved to Bluetooth Classic on August 1 when BLE proved infeasible on the Windows side.
- Used Bluetooth Classic (RFCOMM/SPP via 32feet) for the final implementation — not an architectural preference but the protocol that actually worked on Windows/Unity; Classic gives a reliable bidirectional byte stream via SerialPort Profile
- Added Bluetooth as a toggle mode alongside WiFi (user selects at runtime via button) rather than replacing WiFi — commit "allows for toggle bluetooth vs wifi"
- Implemented a HEARTBEAT flow-control protocol: Android waits for Unity's HEARTBEAT ACK before sending the next packet batch, solving packet loss discovered during testing
- Custom GUID list (16 slots: `59a8bede-af7b-49de-b454-e9e469e740a0` through `...aF`) to identify the XDTK Bluetooth service on both ends
- Packet boundary marker `|` inserted between sensor messages, matching what Unity's transceiver splits on
- Discovered synchronous limit of ~8 packets in back-to-back sends ("Synchronous limit for packet - seems to be 8") and engineered around it
- Used inheritance hierarchy to share Android transport logic across WiFi and Bluetooth paths ("Manage Inheritance + Add Comments")

### Ryan's Contributions
Primary developer of the Bluetooth additions (65 commits). Mentor ejgonz also contributed 24 commits to this fork. Key PR branches and commits (chronological):

**Branch: BluetoothConnection** (June 28, 2024)
- `1193a81` — *"Find device and setup"* — first commit: initial Android BT device discovery
- `2c14cf8` — *Merge PR #1: "Find device and setup"*

**Branch: Blessed-Test** (July 2024 — testing with [blessed](https://github.com/weliem/blessed-android) BLE library)
- `e886c66` — *"blessed full app"* — integrated blessed-android BLE library for scanning/connecting
- `c7b9314` — *"edits"*
- `3b83dc0` — *"adjust timestamp"*
- Multiple commits under PR #10 (*BTBecomeDiscoverable2*) and PR #11 (*Blessed-Test*)

**Branch: BTClassic** (August 17–18, 2024 — pivot from BLE to Bluetooth Classic)
- `8ed076e` — *"Committing BTClassic Changes"* — full BT Classic implementation
- `56e1e41` — *"deleting unused"* — cleanup after pivot
- `a1168f3` — *"This works, Caching it"* — milestone: end-to-end working connection
- `cf4b9e0` — *"allow sending data from either method"* — WiFi/BT toggle
- Multiple merges (PR #12–17)

**Branch: Packet-Limit-Testing** (August 19–20, 2024)
- `14ec82b` — *"Packet Hack Solve"* — solved packet fragmentation issue
- `9c40dd1` — *"Synchronous limit for packet — seems to be 8"* — documented BT sync constraint
- `39a5ac9` — *"Update BluetoothClassicHandler.java"* — applied limit fix
- PR #18: *"delete threads"* — removed threading approach that caused issues
- PR #19: *"Synchronous limit for packet"*
- PR #20: *"Update BluetoothClassicHandler.java"*

**Final polish** (September 2024)
- `d9d06a5` — *"Unsynchronize Unnecessary parts"*
- `92f5a3c` — *"Replace id with index to avoid crash cases"* — stability fix
- `5a30adf` — *"Manage Inheritance + Add Comments"* — architecture cleanup
- `ddee9ae` — *"edit length"*
- `2313343` — *"permissions and comments fix"*
- `2b23488` — *"rename connect"*
- `d0841da` — *"add bluetoothguid modifications"* — final GUID scheme
- `84b69e3` — *"Update README.md"* — documented fork as "Ryan (thesuperRL)'s fork for Bluetooth Implementations"

---

## Repo 2: thesuperRL/XDTK-Unity-Side

**Owner:** thesuperRL  
**Platform:** GitHub  
**Nature:** Unity project (C#) implementing the PC-side Bluetooth receiver for XDTK. Contains `BluetoothTransceiver.cs` — a drop-in replacement for XDTK's existing `UDPTransceiver` that connects to paired Android phones over Bluetooth Classic, manages multi-device sessions, and routes sensor packets to Unity Device prefabs.  
**Language:** C#  
**Active period:** August 19, 2024 – September 18, 2024  
**Fork of:** Original

### Design Decisions
- `BluetoothTransceiver` extends XDTK's existing `Transceiver` base class to reuse device registration, routing, and prefab lifecycle — no duplication of that logic
- One `BluetoothAgent` inner class per connected phone; each runs its own background `Thread` for blocking `Stream.Read()`, since BT has no async callback like UDP sockets
- MAC address as device identity key (`addressToBluetoothAgents` dictionary), with prefab reuse on reconnect — if the same MAC reconnects, maps to the existing `Device` prefab instead of spawning a duplicate
- Half-packet reassembly: `pastHalfPacket` stitched onto `subpackets[0]` of each read to handle BT's fragmentation of the `|`-separated message stream
- HEARTBEAT sent back to Android after each read to signal readiness for the next batch (flow control)
- GUID list generated programmatically (16 slots) rather than hardcoded; Android side does the same, both agree on the channel
- Requires Unity settings: Scripting Backend = Mono, API Compatibility = .NET Framework (for 32feet DLL compatibility)
- `keyToActivateBluetoothSelector` field (default: Space) triggers a native Windows Bluetooth picker — allows adding more devices at runtime
- Known limitation documented: Android must end/restart connection if it previously connected to a XDTK Unity device, even after game stop

### Key Files
- `Assets/BluetoothTransceiver.cs` (14 KB) — primary component
- `Assets/Plugins/` — contains compiled `XDTK32Feet.dll` and `InTheHand.Net.Bluetooth.dll`
- `Assets/DeviceManager.prefab` — holds `BluetoothTransceiver` component
- `Assets/DeviceVisual.prefab` — per-device 3D representation

### Ryan's Contributions
Sole developer. 28+ commits across 7 PRs. Key commits:

- `65b583b` — *"initial commit"* (Aug 19) — project scaffolding
- `560e8dd` — *"add xdtk"* — integrated XDTK Unity package
- `ecd3ab2` — *"Working Changes"* — first working BT receive loop
- `84c7da3` — *"input handling"*
- `2fc65d7` — *"prefab"* — DeviceManager/DeviceVisual prefabs
- `13556a6` — *"comments"*
- PR #1 (Fix-Broken-packets): `96aac5d` — *"Update BluetoothTransceiver.cs"* — fixed malformed packet reassembly
- PR #2 (Activate-Bluetooth-Selector): `3c7d2a8` — *"Update BluetoothTransceiver.cs"* — added Space-key trigger for device picker
- `6404a4a` — *"make BluetoothReceiver not static"* — refactored for multi-device: removed static singleton constraint so multiple `BluetoothAgent`s can each hold their own `BluetoothReceiver`
- `5116752` — *"Remove Unnecessary Functions in DLL"* — trimmed DLL API surface
- PR #3 (Multithread-Touch-Debugging): `c8ede81` — *"Comments and code fixes"*
- PR #4: `14d083f` — *"comment testing code"* — commented out debugging instrumentation
- `6fa617e` — *"Update BluetoothTransceiver.cs"* (reconnection to abandoned prefab)
- PR #5: *"Allow for reconnection to abandoned device prefab"* — MAC-address-keyed prefab reuse
- `f3830a8` — *"edit length"* (packet read buffer sizing)
- PR #6: *"edit length"*
- `de3acc3` — *"Update BluetoothTransceiver.cs — multiple devices, removed useless code"*
- `3f3dcf7` — *"Update BluetoothTransceiver.cs — multi devices, but still have localPosition -Infinity error"* (shows active debugging of Unity transform corruption on reconnect)
- `293b10e` — *"finalize multidevice"*
- `259d38f` — *"add guid changes to multi device"*
- PR #7 (Multithread-Touch-Debugging): final multi-device merge

---

## Repo 3: thesuperRL/XDTK32Feet

**Owner:** thesuperRL  
**Platform:** GitHub  
**Nature:** A standalone C# .NET class library (compiled to a DLL) that wraps [32feet.NET](https://github.com/inthehand/32feet) (`InTheHand.Net.Bluetooth`) to provide XDTK with Bluetooth device discovery and RFCOMM stream access on Windows. Unity cannot call 32feet directly without a compiled DLL targeting .NET Framework; this repo is the source for that DLL.  
**Language:** C#  
**Active period:** August 20, 2024 – September 18, 2024  
**Fork of:** Original

### Design Decisions
- Builds as a .NET Framework class library (not .NET Standard/Core) to satisfy Unity's Mono/IL2CPP Bluetooth constraints
- `BluetoothDevicePicker.PickSingleDeviceAsync()` invokes the OS-native Bluetooth device chooser — avoids building a custom UI
- GUID iteration loop: tries all 16 GUIDs silently, catches exceptions, keeps the first one that successfully `Connect()`s — tolerates varying Bluetooth stacks without manual GUID management
- Made `BluetoothReceiver` non-static (commit: "Unstatic the entire object") so `BluetoothTransceiver.cs` can instantiate one per connected device for multi-device support
- Kept `TestDetection()` helper (lists discoverable devices) for debugging

### Key Files
- `XDTK32Feet/BluetoothReceiver.cs` — single class; all Bluetooth logic
- `XDTK32Feet/XDTK32Feet.csproj` — .NET Framework project file

### Ryan's Contributions
Sole developer. 9 commits:
- `c3711b9` — *"initial"* (Aug 20)
- `4c8ff46` — *"comments and rename"*
- `e1ae5d9` — *"Update XDTK32Feet.csproj"* — project configuration
- `eae5bf3` — *"Create README.md"*
- `e949aa4` — *"Create LICENSE"*
- `d9c5d67` — *"Update README.md"*
- `accee6c` — *"Update LICENSE"*
- `e2de55d` — *"Remove unnecessary stuff"* (Sep 15)
- `11cf3ed` — *"Unstatic the entire object"* (Sep 15) — key refactor for multi-device
- `6a7a677` — *"Update BluetoothReceiver.cs"* (Sep 18) — final state

---

## Repo 4: thesuperRL/XDTK-Bluetooth-Test-Run

**Owner:** thesuperRL  
**Platform:** GitHub  
**Nature:** Empty stub repository created July 3, 2024 — appears to be an early placeholder for uploading a test build or APK of the Bluetooth-enabled XDTK Android app. Size: 0. No source code committed.  
**Language:** None  
**Active period:** July 3, 2024 only (single Initial Commit)  
**Fork of:** Original

### Ryan's Contributions
- `77ecf0f` — *"Initial commit"* (Jul 3, 2024) — repo setup only; no code

---

## Repo 5: thesuperRL/XDTK-Bluetooth-Unity-Test

**Owner:** thesuperRL  
**Platform:** GitHub  
**Nature:** Empty stub repository created July 3, 2024, likely a parallel test sandbox for Unity-side Bluetooth experiments before the main XDTK-Unity-Side repo was created. Size: 0. No commits accessible.  
**Language:** None  
**Active period:** July 3, 2024 only  
**Fork of:** Original

### Ryan's Contributions
- Repo creation only; no source code ever committed

---

## Overall Project: What Ryan Built

Ryan's internship at Google AR added a complete Bluetooth Classic transport layer to XDTK — an open-source toolkit that was already published and in use before his internship. Starting from a WiFi-only system, he:

1. **Attempted BLE for ~5 weeks** (late June – July 31): tried BleWinrtDll, 32feet's BLE library, custom WinRT DLLs, and Microsoft sample code. All failed because Windows/Unity cannot trigger BLE characteristic subscription notifications (discovered after extensive cross-machine, cross-library testing). Pivoted to Bluetooth Classic on August 1 after concluding BLE was infeasible on the target platform.
2. **Implemented the Android sender** in Java (`BluetoothClassicHandler.java`), adding BT alongside WiFi as a runtime-selectable mode with a custom packet protocol
3. **Engineered packet flow control** — discovered a synchronous send limit (~8 packets) and designed a HEARTBEAT ACK protocol to pace Android→Unity transmission
4. **Solved half-packet reassembly** — Bluetooth's RFCOMM doesn't preserve message boundaries; Ryan wrote the `pastHalfPacket + subpackets[0]` stitching logic in `BluetoothTransceiver.cs`
5. **Built the DLL bridge** (`XDTK32Feet`) wrapping 32feet.NET's `BluetoothDevicePicker` so Unity's Mono runtime can invoke the native Windows Bluetooth chooser
6. **Implemented multi-device support** — each phone gets its own `BluetoothAgent` with a background read thread, identified by MAC address, with prefab reuse on reconnect
7. **Integrated cleanly into XDTK's architecture** — `BluetoothTransceiver` extends the existing `Transceiver` base class as a drop-in for `UDPTransceiver`, requiring only a prefab swap in the Unity scene

Mentors: **Eric J. Gonzalez** and **Mar Gonzalez-Franco** (Google AR).
