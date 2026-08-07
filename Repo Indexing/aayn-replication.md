# aayn-replication

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A from-scratch PyTorch replication of the original Transformer architecture from "Attention is All You Need" (Vaswani et al., 2017), trained on English-to-German translation using the Multi30k dataset. Ryan wrote all the architectural layer code himself; data loading and training loop were AI-assisted.
**Language(s):** Python (PyTorch)
**Active period:** 2026-05-20 – 2026-05-22
**Fork of:** Original

## Design Decisions
- Organized all Transformer building blocks under a `layers/` module, each component in its own file: `scaled_dot_prod_attention.py`, `multi_head_attention.py`, `positional_encoding.py`, `feed_forward.py`, `encoder_block.py`, `decoder_block.py`, `encoder.py`, `decoder.py`, `transformer.py`
- Used **Multi30k** (~29k training pairs) as a lighter WMT substitute to allow local training
- Data tokenization and loading isolated in `processing/` (separate from the manually written layers)
- Cursor AI used only for `processing/` and `train.py`; all of `layers/` is entirely Ryan's own code

## Ryan's Contributions
**Sole developer.** All commits are Ryan's. Active period: one focused day of implementation.

- `31b0901` 2026-05-22 — `fix: layer consistency` — resolved structural mismatches across encoder/decoder blocks
- `915a0b7` 2026-05-22 — `fix: dimension inconsistencies` — corrected tensor dimension bugs in attention layers
- `591d401` 2026-05-22 — `feat: readme and train` — added training script and documentation
- `b6d0ce4` 2026-05-22 — `fix: readme formatting`

### Key source files
- `layers/multi_head_attention.py` — Multi-head attention (1708 bytes, Ryan-authored)
- `layers/scaled_dot_prod_attention.py` — Scaled dot-product attention with masking
- `layers/positional_encoding.py` — Sinusoidal positional encoding
- `layers/encoder_block.py` / `layers/decoder_block.py` — Stacked encoder/decoder sublayers
- `layers/transformer.py` — Top-level Transformer assembly
- `processing/tokenization.py` — BPE/tokenization pipeline (AI-assisted)
- `train.py` — Training loop, optimizer, LR schedule (AI-assisted)
