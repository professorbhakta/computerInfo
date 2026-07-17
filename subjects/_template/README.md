# Subject Template

Copy this layout when starting a new subject. Replace `<slug>` and create the first version folder.

## Layout

```
subjects/<slug>/
├── README.md                 # Subject index (audience, versions, links)
├── CURRENT                   # Text file whose contents are e.g. v1
└── v1/
    ├── manifest.json         # Status, paths, Bloom objective list
    ├── outline.md            # Curriculum Architect
    ├── notes.md              # Notes Writer
    ├── slides.json           # PPT Builder (source)
    ├── slides.pptx           # PPT Builder (generated)
    ├── qa-report.md          # QA Reviewer
    └── materials/
        ├── assignments.md
        ├── question-bank.md
        ├── labs.md
        ├── quizzes.md        # optional
        ├── glossary.md       # optional
        └── mindmap.md        # optional
```

## Quick start

1. Choose a kebab-case slug: `intro-to-statistics`.
2. Create `subjects/intro-to-statistics/` and `v1/`.
3. Ask the **Main Orchestrator** to run the full pipeline for your subject + scope.
4. Do not edit released versions in place—bump to `v2` for content changes.
5. Keep `CURRENT` pointing at the active version.

## Manifest status lifecycle

`draft` → `qa` → `released`

Only the Orchestrator (after QA pass) should set `released` and update `CURRENT`.

## Naming

| Item | Convention |
|---|---|
| Subject folder | `kebab-case` |
| Versions | `v1`, `v2`, … |
| Files | exact names above (downstream agents depend on them) |

## Notes for humans

- Source of truth for slides is `slides.json`; regenerate PPTX via `scripts/build_pptx.py`.
- Optional materials are omitted unless requested for that run.
- This template folder is documentation only—do not write a real course under `_template/`.
