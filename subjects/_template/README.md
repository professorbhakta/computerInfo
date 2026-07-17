# Subject Template

Copy this layout when starting a new subject. Replace `<slug>` and create the first semantic version folder (`v1.0`).

## Git-optimized layout

```
subjects/<slug>/
├── README.md                 # Subject index: audience, how to study, links to CURRENT
├── CURRENT                   # Text file contents: v1.0
├── version_history.md        # Cumulative changelog across versions
└── v1.0/
    ├── manifest.json
    ├── changelog.md          # This version’s delta
    ├── outline.md
    ├── notes.md
    ├── slides.json
    ├── slides.pptx
    ├── qa-report.md
    └── materials/
        ├── question-bank.md
        ├── assignments.md
        ├── labs.md
        ├── glossary.md
        ├── mindmap.md
        ├── revision-sheet.md
        └── quizzes.md        # optional
```

## Quick start

1. Choose a kebab-case slug: `class12-physics-electrostatics`.
2. Create `subjects/<slug>/` with `README.md`, `CURRENT`, `version_history.md`, and `v1.0/`.
3. Ask the **Academic Content Factory Orchestrator** to run the pipeline for your subject + scope.
4. Never edit a released version in place — bump to `v1.1` (minor) or `v2.0` (major).
5. Keep `CURRENT` pointing at the active version folder name.

## Versioning

| Version | Meaning |
|---|---|
| `v1.0` | First complete release |
| `v1.1+` | Minor fixes / polish |
| `v2.0+` | Major pedagogical or scope changes |

Lifecycle in `manifest.json`: `draft` → `qa` → `released`.

## Subject README checklist

A real subject `README.md` should include:

- Title, audience, exam focus
- Link/pointer to `CURRENT`
- One-paragraph study path (notes → revision sheet → Q&A → assignments)
- Table of available versions

## Forking

- Recommended branch: `content/<slug>` or `content/<slug>-v1.1`
- Keep factory scaffolding changes separate from subject content commits when possible

## Notes

- Source of truth for slides is `slides.json`; rebuild PPTX with `scripts/build_pptx.py`.
- Do **not** write a real course under `_template/` — documentation only.
