# Academic Content Factory

**Subject-agnostic multi-agent system** for world-class teaching and learning materials.

Given any academic subject + scope (board chapter, university unit, or full semester), the factory produces a complete, consistent package optimized for study, revision, and exam success.

## Mandatory Design Principles

| Principle | Requirement |
|---|---|
| **Bloom’s Taxonomy** | Every learning objective and practice item tagged Remember → Create |
| **Semantic versioning** | `v1.0` (first release), `v1.1` (minor fixes), `v2.0` (major updates) + changelogs |
| **Consistency** | Cross-reference notes ↔ slides ↔ Q&A ↔ assignments |
| **Professional quality** | Clear language, Mermaid/tables, exam tips, common pitfalls |
| **Git-first** | Meaningful commits; easy per-subject forking |
| **Error handling** | Retries, validation gates, fallback templates |

## Agent Roster

| Agent | File | Role |
|---|---|---|
| **Academic Content Factory Orchestrator** | `.cursor/agents/main-orchestrator.md` | Entry point: plan, gates, versioning, retries, Git |
| **Curriculum Architect** | `.cursor/agents/curriculum-architect.md` | Outline, timeline, prerequisites, Bloom objectives |
| **Notes Writer** | `.cursor/agents/notes-writer.md` | Modular student notes (examples, visuals, takeaways) |
| **PPT Builder** | `.cursor/agents/ppt-builder.md` | `slides.json` + real `.pptx` via `scripts/build_pptx.py` |
| **Material Generator** | `.cursor/agents/material-generator.md` | Q&A bank, assignments, glossary, mind maps, revision sheets |
| **QA Reviewer** | `.cursor/agents/qa-reviewer.md` | Cross-artifact consistency; blocks release on critical issues |

## Canonical Pipeline

```
User request (subject + scope + exam/revision goals)
        │
        ▼
┌──────────────────────────────────┐
│ Academic Content Factory         │
│ Orchestrator                     │  plan · version · Git · retries
└───────────────┬──────────────────┘
                ▼
┌──────────────────────────────────┐
│ Curriculum Architect             │  outline.md + Bloom objectives
└───────────────┬──────────────────┘
                ▼
┌──────────────────────────────────┐
│ Notes Writer                     │  notes.md (modular, exam-ready)
└───────────────┬──────────────────┘
         ┌──────┴──────┐
         ▼             ▼
┌──────────────┐  ┌──────────────────┐
│ PPT Builder  │  │ Material Generator│
│ JSON + PPTX  │  │ Q&A, assignments, │
│              │  │ glossary, mindmap,│
│              │  │ revision sheets   │
└──────┬───────┘  └────────┬─────────┘
       └─────────┬─────────┘
                 ▼
        ┌────────────────┐
        │  QA Reviewer   │
        └────────┬───────┘
                 ▼
   Orchestrator: changelog · CURRENT · commit · push
```

## Recommended Repository Structure (Git-Optimized)

```
.
├── AGENTS.md
├── PROJECT_TODOS.md
├── README.md
├── .gitignore
├── .cursor/
│   └── agents/
│       ├── main-orchestrator.md
│       ├── curriculum-architect.md
│       ├── notes-writer.md
│       ├── ppt-builder.md
│       ├── material-generator.md
│       └── qa-reviewer.md
├── scripts/
│   └── build_pptx.py
└── subjects/
    ├── _template/
    │   ├── README.md
    │   └── version_history.md
    └── <slug>/                          # e.g. class12-physics-electrostatics
        ├── README.md                    # subject index + how to study
        ├── CURRENT                      # active version folder name (v1.0)
        ├── version_history.md           # changelog across all versions
        └── v1.0/
            ├── manifest.json
            ├── changelog.md             # this version’s delta
            ├── outline.md
            ├── notes.md
            ├── slides.json
            ├── slides.pptx
            ├── qa-report.md
            └── materials/
                ├── question-bank.md     # Easy/Medium/Hard + Bloom tags
                ├── assignments.md
                ├── labs.md
                ├── glossary.md
                ├── mindmap.md
                ├── revision-sheet.md
                └── quizzes.md           # optional
```

**Git forking tips**

- Factory scaffolding stays on `main`.
- Per-subject work: `content/<slug>` or `content/<slug>-v1.1`.
- Never rewrite released version folders; bump the semantic version instead.

## Core Outputs (always produced)

| Output | Path | Required |
|---|---|---|
| Curriculum outline | `…/outline.md` | Yes |
| Student notes | `…/notes.md` | Yes |
| Slides (JSON) | `…/slides.json` | Yes |
| Slides (PPTX) | `…/slides.pptx` | Yes |
| Tiered Q&A bank | `…/materials/question-bank.md` | Yes |
| Assignments & projects | `…/materials/assignments.md` | Yes |
| Labs / workshops | `…/materials/labs.md` | Yes |
| Glossary | `…/materials/glossary.md` | Yes |
| Mind map | `…/materials/mindmap.md` | Yes |
| Practice / revision sheet | `…/materials/revision-sheet.md` | Yes |
| Version changelog | `…/changelog.md` | Yes |
| Subject history | `subjects/<slug>/version_history.md` | Yes |
| Subject README | `subjects/<slug>/README.md` | Yes |
| Manifest | `…/manifest.json` | Yes |
| QA report | `…/qa-report.md` | Yes |
| Quizzes | `…/materials/quizzes.md` | Optional |

## Semantic Versioning

| Version | When to use |
|---|---|
| **v1.0** | First complete release for a subject/scope |
| **v1.1 / v1.2…** | Minor fixes: typos, clarified examples, QA polish, small Q additions |
| **v2.0 / v3.0…** | Major updates: scope change, restructured outline, new units, pedagogy shift |

Rules:

- Folder name equals the version string (`v1.0`, `v1.1`, `v2.0`).
- Released folders are immutable; copy forward into the new version folder.
- Every version has `changelog.md`; the subject root keeps cumulative `version_history.md`.
- `CURRENT` points at the active folder name.
- Pre-release edits allowed only while `manifest.status` is `draft` or `qa`.

## Consistency Rules (QA-enforced)

1. Bloom objectives appear in outline, notes, and slides.
2. Topic order matches outline → notes → slides → materials.
3. Terminology consistent across notes, glossary, Q&A, and assignments.
4. Every outline topic has notes + ≥1 slide + practice coverage.
5. Question bank / assignments / revision sheet map to Bloom-tagged objectives.
6. `slides.json` validates before PPTX build; PPTX must exist.
7. Manifest paths match on-disk files; version strings agree across manifest / folder / CURRENT / history.

## Invocation

Start every job as the **Academic Content Factory Orchestrator** (`.cursor/agents/main-orchestrator.md`).

Do not skip agents or mark `released` without a QA pass unless the user explicitly requests draft-only mode.

See `PROJECT_TODOS.md` for the run checklist and `subjects/_template/` for the copyable layout.
