# Multi-Agent Academic Content Factory

Subject-agnostic system for producing high-quality teaching materials from any academic subject + scope.

## Agent Roster

| Agent | File | Role |
|---|---|---|
| **Main Orchestrator** | `.cursor/agents/main-orchestrator.md` | Entry point. Plans runs, routes work, enforces Git + versioning, retries failures. |
| **Curriculum Architect** | `.cursor/agents/curriculum-architect.md` | Builds structured outlines and Bloom’s-aligned learning objectives. |
| **Notes Writer** | `.cursor/agents/notes-writer.md` | Produces student-ready notes from the approved outline. |
| **PPT Builder** | `.cursor/agents/ppt-builder.md` | Creates slide JSON and generates real `.pptx` via `scripts/build_pptx.py`. |
| **Material Generator** | `.cursor/agents/material-generator.md` | Assignments, tiered question banks, labs, optional quizzes/glossary/mind maps. |
| **QA Reviewer** | `.cursor/agents/qa-reviewer.md` | Consistency checks across all artifacts; blocks release on critical issues. |

## Canonical Pipeline

```
User request (subject + scope + options)
        │
        ▼
┌─────────────────────┐
│  Main Orchestrator  │  ← plan, version, Git workflow, retries
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│ Curriculum Architect│  → outline.md + objectives (Bloom)
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│    Notes Writer     │  → notes.md (+ optional study aids)
└─────────┬───────────┘
          │
     ┌────┴────┐
     ▼         ▼
┌─────────┐  ┌──────────────────┐
│PPT Builder│  │Material Generator│
│ slides.json│  │ assignments, Qs  │
│ + .pptx    │  │ labs, optional   │
└────┬────┘  └────────┬─────────┘
     │                │
     └───────┬────────┘
             ▼
     ┌───────────────┐
     │  QA Reviewer  │  → consistency report; pass/fail
     └───────┬───────┘
             ▼
     Orchestrator: version bump, commit, push
```

## Core Outputs (per subject / unit)

| Output | Path pattern | Required |
|---|---|---|
| Teaching outline | `subjects/<subject>/vN/outline.md` | Yes |
| Student notes | `subjects/<subject>/vN/notes.md` | Yes |
| Slide deck (JSON) | `subjects/<subject>/vN/slides.json` | Yes |
| Slide deck (PPTX) | `subjects/<subject>/vN/slides.pptx` | Yes |
| Assignments | `subjects/<subject>/vN/materials/assignments.md` | Yes |
| Question bank | `subjects/<subject>/vN/materials/question-bank.md` | Yes |
| Lab exercises | `subjects/<subject>/vN/materials/labs.md` | Yes |
| Quizzes | `subjects/<subject>/vN/materials/quizzes.md` | Optional |
| Glossary | `subjects/<subject>/vN/materials/glossary.md` | Optional |
| Mind map | `subjects/<subject>/vN/materials/mindmap.md` | Optional |
| Manifest | `subjects/<subject>/vN/manifest.json` | Yes |
| QA report | `subjects/<subject>/vN/qa-report.md` | Yes |

## Content Versioning

- Every production run writes under `subjects/<slug>/vN/` where `N` is an integer.
- `v1` = first complete release for that subject/scope.
- Revisions that change teaching content create `v2`, `v3`, … (never overwrite released versions).
- Cosmetic-only fixes may amend the current version **only before** it is marked `released` in `manifest.json`.
- `subjects/<slug>/CURRENT` (text file) points to the active version folder name (e.g. `v2`).
- Each `manifest.json` records: subject, scope, version, status (`draft` | `qa` | `released`), agents used, timestamps, checksums/paths.

## Consistency Rules (enforced by QA Reviewer)

1. Learning objectives appear in outline, notes intro, and slide learning-objectives slide.
2. Topic order matches outline → notes → slides → materials.
3. Terminology and definitions stay consistent across all artifacts.
4. Every required section in the outline has corresponding notes and at least one slide.
5. Question bank and assignments map to stated objectives (Bloom level tagged).
6. Slide JSON validates against the PPT schema before `.pptx` build.
7. Manifest paths exist and match on-disk files.

## Invocation

Start every content job with the **Main Orchestrator**. Do not skip agents or write final artifacts without a QA pass unless the user explicitly requests a draft-only run.

See `PROJECT_TODOS.md` for operational checklist and `subjects/_template/README.md` for the per-subject layout.
