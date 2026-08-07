# website (Codeberg)

**Owner:** thesuperRL
**Platform:** Codeberg (thesuperRL/website)
**Nature:** Ryan's personal website, built with Next.js 15 and TypeScript. Features an interactive force-directed graph on the home page visualizing documents (projects, writing, notes) as nodes; clicking a node transitions to that document. Serves content from a local Obsidian vault via a custom vault reader, rendered as MDX with syntax highlighting.
**Language(s):** TypeScript (Next.js, React, Tailwind CSS)
**Active period:** 2026 (11 commits, initial through stable)
**Fork of:** Original

## Design Decisions

- Next.js App Router with dynamic `[category]/[slug]` routes; each document type declared in `config/documentTypes.ts`
- Force graph rendered with `react-force-graph-2d` and `d3-force` for physics; nodes can be dragged and frozen; link distances tuned over several commits to prevent collapse or over-separation
- Animated center-transition overlay (`CenterTransitionOverlay.tsx`, `graphCenterTransition.ts`) for navigating from the graph to a document: nodes animate outward as the clicked node expands to fill the viewport
- Document layout system (`config/documentTypes.ts`, `src/components/documents/layouts/`) supports multiple layout types: `DefaultLayout` and `PaperReplicationLayout` for academic paper-style presentation
- Content sourced from an Obsidian vault via `src/lib/vault.ts` (reads markdown files, extracts frontmatter with `gray-matter`)
- MDX rendering with `next-mdx-remote`, `remark-gfm`, `rehype-highlight` (via `highlight.js`) for code blocks
- Profile center node (`ProfileCenterNode.tsx`, `drawProfileCenterNode.ts`) drawn with canvas API as a styled avatar at the graph center
- Social links and categories declared in config files; vault media served from `src/app/vault-media/[...path]/route.ts`
- Styling: Tailwind CSS with `@tailwindcss/typography` for prose; `postcss` pipeline
- Animations: `animejs` for transition effects
- Codeberg-hosted; may diverge from any GitHub-hosted version

## Ryan's Contributions

Sole developer. All 11 commits are Ryan's.

- `9a15b7b` feat: initial commit
- `41bbf8c` fix: repulsion stats
- `a64973e` fix: remove rust attempt (explored Rust/WASM, reverted)
- `82f4e3e` fix: nodes do not remain fixed upon drag
- `675d9e8` fix: decrease warmup ticks
- `7200335` feat: freeze nodes before zoom
- `31f2b39` fix: remove central pull
- `4f3aa2d` feat: link length fixing
- `7eb6985` fix: link distance shortening
- `9643697` feat: roughly stable graph
- `8cd890c` feat: implement center transition and document layout system
