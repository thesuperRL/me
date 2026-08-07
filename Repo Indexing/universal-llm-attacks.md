# universal-llm-attacks

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A replication of the GCG (Greedy Coordinate Gradient) adversarial suffix attack from "Universal and Transferable Adversarial Attacks on Aligned Language Models" (Zou et al., 2023, arXiv:2307.15043). Runs the white-box token-level optimization against Vicuna-7B to find a universal jailbreak suffix.
**Language(s):** Python (PyTorch/Transformers)
**Active period:** 2026-06-06 – 2026-06-08
**Fork of:** Original

## Design Decisions
- Target model: **Vicuna-7B v1.5** — model config and tokenizer committed; weights gitignored (too large)
- **FastChat** included as a git submodule — used for Vicuna's conversation template formatting
- Core attack logic in `llm-attack-replication/maximize_prompt.py` (10773 bytes): implements GCG algorithm — token substitution search, gradient-guided candidate selection, and loss-based ranking over multiple queries
- `prompt_build_tools.py` (3401 bytes): builds the attack prompt with the adversarial suffix inserted, handles Vicuna's chat format
- Checkpointing built in — adversarial suffix saved after each optimization step to `checkpoints/step_XXXX.txt`; `store.txt` saves current best suffix for manual inspection
- Query set expanded mid-project to improve universality ("add checkpointing and expand query set")
- `compute_loss_avg` used to track mean loss across queries rather than single-query loss

## Ryan's Contributions
**Sole developer.** All commits are Ryan's. Built and iterated in a rapid 2-day sprint.

- `9d31d5b` 2026-06-06 — `Initial commit`
- `818ef24` 2026-06-06 — "feat: copy over existing repos, add initial confirmation" — ported earlier work, added attack confirmation step
- `490647427` 2026-06-06 — "feat: add FastChat submodule, model config, and gitignore weights" — model scaffolding
- `b60431e` 2026-06-06 — "feat: forward pass tools and validation" — forward pass with loss computation
- `d7637da` 2026-06-06 — "fix: improvement on avg loss by not resetting" — loss tracking fix (running average instead of reset per step)
- `12d8c98` 2026-06-06 — "feat: allow for more complete query"
- `daaa104` 2026-06-06 — "fix: return compute_loss_avg"
- `2a8b8b6` 2026-06-07 — "feat: actual training" — first real optimization run
- `1a5b375` 2026-06-08 — "feat(maximize_prompt): add checkpointing and expand query set" — persistence and broader attack coverage
- `c6a14b9` 2026-06-08 — "feat: add store.txt" — manual artifact for inspecting current best suffix

### Key source files
- `llm-attack-replication/maximize_prompt.py` — GCG attack loop (10773 bytes)
- `llm-attack-replication/prompt_build_tools.py` — Vicuna prompt formatting, suffix insertion
- `llm-attack-replication/checkpoints/` — step-by-step saved adversarial suffixes
- `store.txt` — current best adversarial suffix snapshot
- `models/vicuna-7b-v1.5/` — model config, tokenizer (weights excluded)
