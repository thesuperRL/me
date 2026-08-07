# HackCMU-2025 (LanternFly Quest)

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A hackathon project built at HackCMU 2025 (CMU, September 2025): a web app that gamifies the removal of the invasive spotted lanternfly. Users photograph their catches, upload proof, earn points, and compete on a leaderboard. Includes a learn section, Google sign-in, an achievements system, and a catch tracking map.
**Language(s):** HTML, CSS, JavaScript (frontend); Python/Flask (backend)
**Active period:** 2025-09-12 - 2025-09-13
**Fork of:** Original

## Design Decisions

- Flask backend (`app.py`) with PostgreSQL via SQLAlchemy; Supabase used as the hosted Postgres provider during the event.
- Image validation: uploaded catch photos are processed with a TensorFlow/Keras model, YOLO (Ultralytics), OpenCV, and PIL to verify the lanternfly is actually present. This is notable AI integration for a 24-hour hackathon.
- Google Identity Services for sign-in; user records stored in a `user` table with `google_name`, `google_email`, `google_uid`, and a `location_tally_json` column.
- A `maps` table tracks geographic catch data for a map visualization page (`/map` route).
- Routes: `/`, `/info`, `/leaderboard`, `/learn`, `/map`, `/report`, `/profile`, `/achievements`.
- Achievements system built late in the event: `achievements.html` with backend routes and a `route achievements from backend` commit shows it was wired up during the hackathon crunch.
- Auto map tracking was added during the event (`4fe3715 - auto map tracking`).
- Demo reset button for clearing data during presentations.
- Frontend is vanilla HTML/CSS/JS with Bootstrap Icons and custom gradient card styling.

## Ryan's Contributions

Built as a team project. Ryan's commits are across both frontend and backend over the single hackathon day (2025-09-13):

- `de19f36` - "I DID IT": likely the moment the core upload-and-validate flow first worked end to end.
- `654f9da`, `8fe83f8` - Achievements feature.
- `4e13715` - Auto map tracking.
- `828fd20`, `af8cd1c` - Backend `app.py` updates.
- `031c21a`, `86e2792`, `b9632eb` - Achievements page HTML iterations.
- `fd0a5d8` - Route achievements from backend.
- `2dce2bc` - Renaming to "extinguish" (appears to be an alternate project name considered mid-event).
- `aa57471` - Extinguish change (reverted/renamed back).
- `e351e53`, `5da1fdc` - Merge coordination with teammates.
- `abf6389` - Final `app.py` update post-submission.
