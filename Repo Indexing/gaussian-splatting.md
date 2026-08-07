# gaussian-splatting

**Owner:** thesuperRL
**Platform:** GitHub
**Nature:** A from-scratch reimplementation of 2D Gaussian Splatting in pure PyTorch, replicating the core optimization from the 3DGS paper (Kerbl et al., 2023, arXiv:2308.04079) and 2DGS paper (Huang et al., 2024, arXiv:2403.17888) as image-level 2D splatting. Applied to a dataset of Arknights game character icons with animated GIF output.
**Language(s):** Python (PyTorch)
**Active period:** 2026-06-26 – 2026-07-13
**Fork of:** Original

## Design Decisions
- **No CUDA, no C extensions** — pure PyTorch implementation; references a "100 lines of PyTorch" tutorial as a starting point
- Implemented **manually with tab autocomplete turned off**; Cursor only queried for hints
- `lib/` contains all core components: `covariance.py` (2D Gaussian covariance matrix), `parameter_init.py` (initial Gaussian parameters), `process_image.py` (image handling), `visualizer.py` (GIF generation), `optimization.py` (gradient-based splat fitting), `refine.py` (densification/pruning), `data_loader.py`, `batch_generate.py`
- `colab.ipynb` added late for GPU-backed training on Google Colab
- Dataset: `arknights-pfp-dataset` submodule with per-icon optimization — output GIFs stored in `output/gifs/` (many characters: aak, absinthe, aciddrop, adnachiel, akafuyu, akkord, …)
- Gaussian parameters optimized per-image, not a learned network — faithful to the original splatting paradigm

## Ryan's Contributions
**Sole developer.** All commits are Ryan's.

- `89102e5` 2026-06-27 — `final` — first working single-image splat result
- `044c681` 2026-06-27 — `commit gifs` — animated optimization outputs committed
- `68ca1c2` 2026-06-28 — "Add Arknights dataset submodule and random icon loader" — `lib/data_loader.py` added with reproducible random icon sampling
- `11efa2b` 2026-06-28 — "feat(batch): add batch_generate script, operator name helper, and GIF/tensor outputs" — batch processing across the full dataset with per-iteration tensor snapshots
- `b6800b1` 2026-07-13 — `feat: colab setup` — added `colab.ipynb` for GPU training
- `305c174` 2026-07-13 — `feat: updates for colab`
- `eca3860` / `ae6aaa4` 2026-07-13 — `fix missing params list` (two iterative fixes)

### Key source files
- `lib/covariance.py` — 2D Gaussian covariance construction
- `lib/parameter_init.py` — initialization of means, scales, rotations, opacities
- `lib/optimization.py` — gradient descent over splat parameters (3817 bytes)
- `lib/refine.py` — adaptive control: densification and pruning (4096 bytes)
- `lib/visualizer.py` — renders splats to image, exports GIF
- `lib/batch_generate.py` — iterates over dataset icons end-to-end
- `colab.ipynb` — GPU notebook entry point
