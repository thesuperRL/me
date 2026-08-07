# masked-autoencoders

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A from-scratch replication of the Masked Autoencoder (MAE) self-supervised vision model from "Masked Autoencoders Are Scalable Vision Learners" (He et al., 2021). Trained on an Arknights character icon dataset as a custom image corpus.
**Language(s):** Python (PyTorch)
**Active period:** 2026-06-28 – 2026-07-10
**Fork of:** Original

## Design Decisions
- Flat file structure: each major component in its own top-level module (`patchify.py`, `mask.py`, `patch_embeddings.py`, `encoder.py`, `decoder.py`, `mae.py`, `loss.py`, `dataset.py`, `checkpoint.py`, `main.py`)
- Custom dataset: `arknights-pfp-dataset` (Arknights character icons) pulled in as a git submodule — a personal dataset choice rather than ImageNet
- Patch masking implemented from scratch in `mask.py` with a visualization function to verify correctness of the random mask before full training
- Encoder is a ViT-style transformer over unmasked patches; decoder reconstructs all patches (masked + unmasked)
- Checkpoint saved as `checkpoints/mae.pt` (18 MB) — training was run to completion
- Rule file committed alongside the code enforcing a "no code" (hints-only) AI policy during development

## Ryan's Contributions
**Sole developer.** All commits are Ryan's. Built incrementally over two weeks.

- `bf6ec70` 2026-06-29 — "add learning exercise: patchify, process_image, and hints-only rule files" — initial structure: image patching utilities, pixel-to-tensor conversion, no-AI-code policy
- `4d946e1` 2026-06-29 — "feat: add image masking and visualization utilities" — `mask.py` with random patch masking and masked-image reconstruction for visual inspection
- `dafc0d1` 2026-07-07 — "feat: embeddings" — patch embedding layer (`patch_embeddings.py`)
- `c312447` 2026-07-10 — "feat: rest of ml tools" — completed encoder, decoder, MAE wrapper, and loss
- `4933d80` 2026-07-10 — "feat: beginning training" — training kick-off (checkpoint committed alongside)

### Key source files
- `patchify.py` — splits image into 16×16 patches
- `mask.py` — random patch masking with visualization helper
- `patch_embeddings.py` — linear patch embedding
- `encoder.py` — ViT encoder over visible patches
- `decoder.py` — MAE decoder reconstructing full patch grid
- `mae.py` — end-to-end MAE wrapper
- `loss.py` — MSE reconstruction loss on masked patches only
- `main.py` — training loop (6398 bytes)
- `checkpoints/mae.pt` — trained weights (18 MB)
