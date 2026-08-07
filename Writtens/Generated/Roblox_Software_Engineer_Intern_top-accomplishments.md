# Roblox - Summer 2027 Software Engineer Intern

## Prompt
Please provide a summary highlighting your top two exceptional academic and/or professional accomplishments. Ideally, the examples you share will be a reflection of your most highly technical accomplishments and demonstrate why you are a top candidate for SpaceX.

## Response

During the summer before college, I interned on Google's Bluetooth R&D team with a task that started clearly and got complicated quickly: add Bluetooth connectivity to XDTK, an internal system that lets Android phones stream IMU, touch, and ARCore sensor data to Unity applications in real time. Bluetooth Low Energy was the obvious first choice, and I spent about a month pursuing it before hitting a wall that turned out to be architectural rather than incidental. On Windows and Unity, BLE devices could be discovered but could not trigger characteristic subscription notifications across any of the libraries I tested, including BleWinrtDll, 32feet's BLE bindings, and a custom WinRT DLL I wrote myself. The problem was not my implementation; it was the platform.

Pivoting to Bluetooth Classic (RFCOMM/SPP) resolved the notification problem but introduced new constraints I had to engineer around. Through testing, I found that RFCOMM has a hard limit of roughly eight synchronous packets before it stalls, so I designed a HEARTBEAT ACK flow-control loop to pace transmission and prevent the send queue from backing up. RFCOMM also fragments packets at buffer boundaries without signaling the receiver, so I implemented half-packet stitching on the receiving end to reconstruct split payloads correctly. To give Unity access to the native Windows Bluetooth device picker, I built XDTK32Feet, a .NET Framework DLL wrapping 32feet.NET's Bluetooth library so that Unity's Mono runtime could invoke it, and I extended the system to support multiple simultaneous devices by running one background-threaded BluetoothAgent per phone, keyed by MAC address with prefab reuse on reconnect.

What I took from that project was a specific kind of patience with constraints: the instinct to ask whether a wall is real or incidental, to characterize it precisely before working around it, and to build the solution at the right layer rather than patching symptoms.

Since December 2024, I have been lead AI developer at MaxMyPoint, a platform used by over 56,000 travelers to find and optimize hotel point redemptions, and my main project has been building an agentic chatbot using LangGraph, PydanticAI, and AWS AgentCore that helps users navigate the site and plan trips based on their account holdings and travel goals. The chatbot runs in production with live user data, which means the decisions I made about its behavior are not theoretical.

The central design challenge was not the stack itself but defining what the chatbot was permitted to know and say, because while LangGraph handles the workflow, PydanticAI enforces structured outputs, and AgentCore provides the agent infrastructure, none of that answers the question of how you constrain a non-deterministic system that tens of thousands of people are relying on for real travel and financial decisions. I made those calls, and alongside the chatbot I built a data pipeline over our PostgreSQL database that tracked hotel alert success rates broken down by type, hotel, and timeframe, feeding that signal back into the chatbot's recommendations so that its suggestions became more accurate as more data accumulated.

At that scale, the gap between code that passes tests and code that holds in production becomes concrete fast, and learning to close that gap is the skill I find most worth developing.

## Notes

Earlier drafts of this answer (SpaceX and prior Roblox versions) incorrectly described the Google project as a BLE implementation. The actual final product was Bluetooth Classic (RFCOMM/SPP). BLE was attempted for roughly a month but proved infeasible on Windows/Unity because characteristic subscription notifications could not be triggered across any tested library (BleWinrtDll, 32feet BLE, custom WinRT DLL). This draft reflects the correct story. Future writing about the Google project should use Bluetooth Classic as the delivered system, with BLE as the failed first attempt.
