# Academic Content Factory

A professional, reusable, **subject-agnostic** multi-agent system for world-class teaching and learning materials.

Give it any academic subject + scope → get a complete, consistent package for study, revision, and exam success—with Bloom’s objectives, semantic versioning, QA gates, and Git-first workflow.

## Design principles

- **Bloom’s Taxonomy** on every objective and practice item  
- **Semantic versions**: `v1.0` · `v1.1` (minor) · `v2.0` (major) + changelogs  
- **Consistency** across notes, slides, Q&A, and assignments  
- **Professional quality**: clear prose, Mermaid/tables, exam tips, pitfalls  
- **Git-first**: meaningful commits; easy per-subject forks  
- **Resilient generation**: retries, validation, fallback skeletons  

## What it produces

| Output | Description |
|---|---|
| Curriculum outline | Timeline, prerequisites, Bloom objectives |
| Student notes | Modular notes with examples, visuals, takeaways |
| Slide deck | `slides.json` + generated `.pptx` |
| Tiered Q&A bank | Easy / Medium / Hard + Bloom tags |
| Assignments & projects | Rubric-backed practice |
| Labs / workshops | Procedure-based applied practice |
| Glossary & mind map | Shared vocabulary + concept map |
| Revision sheet | Rapid exam revision + drills |
| Meta | `manifest.json`, `changelog.md`, subject README, `version_history.md`, QA report |

## Agents

| Agent | Role |
|---|---|
| **Academic Content Factory Orchestrator** | Plan, gates, versioning, retries, Git |
| **Curriculum Architect** | Outline + Bloom objectives |
| **Notes Writer** | Exam-ready student notes |
| **PPT Builder** | JSON + PPTX |
| **Material Generator** | Q&A, assignments, glossary, mind map, revision |
| **QA Reviewer** | Cross-artifact consistency |

Details: [AGENTS.md](./AGENTS.md) · Checklist: [PROJECT_TODOS.md](./PROJECT_TODOS.md)

## Repository layout

```
.
├── AGENTS.md
├── PROJECT_TODOS.md
├── README.md
├── .cursor/agents/
├── scripts/build_pptx.py
└── subjects/
    ├── _template/
    └── <slug>/
        ├── README.md
        ├── CURRENT
        ├── version_history.md
        └── v1.0/ …
```

## Quick start

1. Open this repo in Cursor.  
2. Invoke the **Academic Content Factory Orchestrator**, for example:

   > Class 12 Physics, Electrostatics chapter, CBSE board exam preparation. Produce the full package.

3. The orchestrator creates `subjects/<slug>/v1.0/`, runs the pipeline, builds PPTX, runs QA, updates version history, and commits/pushes.

### Build PPTX manually

```bash
pip install python-pptx
python scripts/build_pptx.py \
  --input subjects/<slug>/v1.0/slides.json \
  --output subjects/<slug>/v1.0/slides.pptx \
  --theme academic-light \
  --recover
```

Themes: `academic-light`, `academic-dark`, `minimal-mono`, `campus-blue`.

## Versioning

| Version | Use |
|---|---|
| `v1.0` | First release |
| `v1.1+` | Minor fixes / polish |
| `v2.0+` | Major scope or structure changes |

`CURRENT` points at the active folder. Released folders are immutable.

## Subject forking

Recommended branches: `content/<slug>` or `content/<slug>-v1.1`. Keep factory scaffolding commits separate from subject content when practical.

## License / use

Materials under `subjects/` belong to the authors who run the factory. The scaffolding is reusable across courses and institutions.
