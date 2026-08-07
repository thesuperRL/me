# UAV-Gesture-Recognization

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** Ground Control Station (GCS) software for a Winter Independent Project: a system that translates hand gestures captured by a webcam into UAV flight commands. Uses MediaPipe gesture recognition and a custom-trained Keras CNN, integrated with PX4 autopilot via MAVLink.
**Language(s):** Python, Jupyter Notebook
**Active period:** 2024-12-28 – 2025-03-04
**Fork of:** Original

## Design Decisions
- **Two-stage recognition pipeline**: (1) MediaPipe's pretrained `gesture_recognizer.task` extracts hand landmarks, (2) a custom Keras CNN (`GoogleCVTrained.keras`, ~1.5 MB) classifies the gesture from landmark data
- Explored two CNN architectures: standard kernel (`GoogleCVTrained.keras`) and larger-kernel variant (`GoogleCVTrained_LargerKernel.keras`, ~1.2 MB)
- PX4 autopilot pulled in as a git submodule for simulation support; MAVLink protocol used to send flight commands from the GCS
- Model trained interactively in Google Colab (`diy_train_cv.ipynb`, 5.4 MB notebook with training outputs), then frozen and deployed locally
- `gesture_recognition_test.py` for live webcam testing; `manual_control.py` for fallback keyboard UAV control
- Camera enumeration utility (`list-available-cameras.py`) and OpenCV window test (`testing_opencv_window.py`) included for hardware debugging
- Commit messages show active debugging cadence: "why does this always break", "at least this works", "WOOOO CONNECTED"

## Ryan's Contributions
**Sole developer.** All commits are Ryan's. Active development in February–March 2025.

- `77282d7` 2025-02-12 — "Created using Colab" — initial model training notebook
- `34e4026` 2025-02-13 — "WOOOO CONNECTED" — first successful MAVLink drone connection
- `edea5d1` 2025-02-13 — "Gesture Remapping" — mapped recognized gesture classes to UAV commands
- `17bc8ae` 2025-02-13 — "px4 updates" — PX4 integration updates
- `7928b27` 2025-02-13 — "pass landmarks to recognizer" — plumbed MediaPipe landmarks into the custom classifier
- `c7baf2e` 2025-02-21 — "WOOO AI IS WORKING" — gesture-to-command pipeline first end-to-end functional
- `24f3187` 2025-03-04 — "final commit" — project submitted/completed

### Key source files
- `Google-Gesture-Recognition/GoogleCVTrained.keras` — trained gesture classifier (1.5 MB)
- `Google-Gesture-Recognition/gesture_recognizer.task` — MediaPipe pretrained hand landmark model (8.4 MB)
- `gesture_recognition_test.py` — live recognition test script (3539 bytes)
- `manual_control.py` — keyboard-based UAV manual control fallback (8506 bytes)
- `diy_train_cv.ipynb` — full Colab training notebook (5.4 MB)
- `full_setup_cv.ipynb` — integrated GCS setup notebook (482 KB)
- `test.py` — integration/smoke test
