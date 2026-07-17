# Academic Content Factory

A **subject-agnostic**, multi-agent system for producing high-quality teaching materials from any academic subject and scope.

Give it a subject + scope → get a structured outline, student notes, a real PowerPoint deck, and supplementary materials—with consistency checks, versioning, and Git integration.

## What it produces

| Output | Description |
|---|---|
| Teaching outline | Sequenced topics + **Bloom’s Taxonomy** learning objectives |
| Student notes | Study-ready Markdown aligned to the outline |
| Slide deck | `slides.json` source + generated `.pptx` |
| Materials pack | Assignments, tiered question bank, lab/workshop exercises |
| Optional | Quizzes, glossary, mind map |
| QA report | Consistency verdict before release |

## Agents

Defined in `.cursor/agents/`:

| Agent | Responsibility |
|---|---|
| **Main Orchestrator** | Entry point: planning, gates, retries, versioning, Git |
| **Curriculum Architect** | Outline + Bloom objectives |
| **Notes Writer** | Student notes |
| **PPT Builder** | Slide JSON + PPTX build |
| **Material Generator** | Assignments, questions, labs, optionals |
| **QA Reviewer** | Cross-artifact consistency |

See [AGENTS.md](./AGENTS.md) for the pipeline and contracts.

## Repository layout

```
.
├── AGENTS.md
├── PROJECT_TODOS.md
├── README.md
├── .gitignore
├── .cursor/agents/          # Specialist agent prompts
├── scripts/build_pptx.py    # JSON → PPTX builder (themes + recovery)
└── subjects/
    └── _template/           # Copy this layout for new subjects
```

## Quick start

1. Open this repo in Cursor.
2. Invoke the **Main Orchestrator** with a request such as:

   > Subject: Intro to Microeconomics. Audience: first-year undergrad. Scope: 4-hour unit on supply & demand. Include glossary.

3. The orchestrator will create `subjects/<slug>/vN/`, run the agent pipeline, build PPTX, run QA, and commit/push per the Git workflow.

### Build a PPTX manually

```bash
pip install python-pptx
python scripts/build_pptx.py \
  --input subjects/<slug>/vN/slides.json \
  --output subjects/<slug>/vN/slides.pptx \
  --theme academic-light \
  --recover
```

Themes: `academic-light`, `academic-dark`, `minimal-mono`, `campus-blue`.

## Versioning

- Each release lives in `subjects/<slug>/vN/`.
- Content changes create `vN+1` (released versions are not overwritten).
- `subjects/<slug>/CURRENT` points at the active version.
- `manifest.json` tracks status: `draft` → `qa` → `released`.

## Operations checklist

Use [PROJECT_TODOS.md](./PROJECT_TODOS.md) for every production run.

## Design principles

- Completely **subject-agnostic** (law, STEM, humanities, business, …)
- Bloom-tagged objectives end-to-end
- Automatic consistency checking before release
- Robust PPTX generation with validation and recovery
- Full Git workflow owned by the Main Orchestrator

## License / use

Teaching materials generated into `subjects/` belong to the course authors who run the factory. The factory scaffolding in this repository is reusable across courses and institutions.
