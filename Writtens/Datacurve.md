# Datacurve

## List the top most impressive things you've built / done

- Interned at Google, building XDTK, a bluetooth system to connect android phones to Unity 3D applications, allowing it to transmit data such as phone rotation, acceleration, and touchscreen tap information to be used as a controller.

- Captained a world-record setting team that reached global top 3% in FTC robotics 2024-25 season, making a school record in competition level (making it to state for the first time in school history).

- Won Microsoft game development competitions (first place 2022, third place 2024) and connected (and later conferenced with) presenting researchers about a research paper I wrote regarding generative AI for 3D models and CAD designs.

- Reached national-level in Public Forum debate, representing my district at the 2024 national tournament and making it to top 160 teams in the nation.

- Created the Hack Club chapter at my school, aiming the club to develop and maintain the schedule displaying website used by almost all the students and faculty. Organized and held the school's first ever hackathon.

- Created a personal project that used HTML, CSS, Javascript, and a Python backend to let players of Project Sekai guess songs from the game from snippets of it.

## Tell us about 1 project you've done and the technical complexities

During my Google internship, I worked on building XDTK, where one of the major challenges was integrating Bluetooth with Unity, which wasn't natively designed for this type of connectivity.

To address this, I explored both Bluetooth and Bluetooth Low Energy (BLE), ultimately developing a custom C++ Dll to enable BLE communication within Unity. This solution initially introduced new problems with packet loss and data splicing, which I mitigated by implementing controlled packet splicing inspired by commercial packet and stream handling methods. As a result, I transformed an application that could barely handle continuous communication with a single phone into one capable of reliably managing a simultaneous connection with two devices.

During this process, I also identified and corrected a flaw in my mentors' existing code that caused laggy and inconsistent touch input handling because of a division error.

The final system required coordinated development across both ends: Unity as the receiver, using the custom C++ DLL, and an Android phone app written in Java to manage Bluetooth connections and transmit data about the phone.

## What makes an opportunity compelling to you / what do you look for?

I'm looking for an opportunity that allows me to both grow personally and contribute meaningfully to the company.

As an intern, I know that I am first and foremost here to learn. I hope to learn from my colleagues and mentors, not only developing technical skills necessary for my work, but also professional skills that are valuable in any workplace. During my time at Google, I gained technical knowledge about app development and packet communication through my mentors and by independently studying their code. I also learned professional skills by creating and presenting visuals about my progress. At Datacurve, I hope to gain hands-on experience in machine learning and data science, which are areas I plan to pursue as a central focus of my major when I declare it in April.

However, equally important to me is leaving behind something meaningful, no matter how brief my time at Datacurve may be. In high school, I founded Hack@EPS to foster technical knowledge, built systems to improve safety in our makerspace, and left behind resources I wrote to teach CAD and basic Python in a school where such classes didn't exist. At Datacurve, I hope to bring the same spirit. I look forward to building tool as a software engineer and leaving a lasting impact here through my work.

I've always admired Datacurve's founder, my childhood friend Serena Ge, for embodying this philosophy. Her passion in creating her climbing application deeply inspired me, especially the way she saw it not just as a product, but also a way to share her passion and knowledge with her community. Her success inspired my goal to leave something behind in whatever I do.
