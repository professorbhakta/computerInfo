# QA Report — computer-info v1.0

- **Verdict:** PASS WITH WARNINGS
- **Reviewed:** 2026-07-17
- **Reviewer:** qa-reviewer (Academic Content Factory)
- **Exam focus:** SEE + CIA (MCQ, assignments, presentations, practical)
- **Scope:** Full syllabus Units 1–5 from official DOCX

## Summary

The v1.0 package is complete against the factory contract and aligns to the official Computer Information syllabus (five units, practicals 1–8, course outcomes). Outline, notes, 57-slide deck (JSON + PPTX), and full materials pack (including glossary, mind map, revision sheet) are present. Terminology is consistent; Bloom tags appear across objectives and practice items. Minor polish items remain (objectives slide density; optional quizzes not requested).

## Checklist

| Suite | Result | Notes |
|---|---|---|
| Completeness | PASS | All required outputs present; PPTX built |
| Bloom integrity | PASS | Objectives tagged; materials reference Obj 1–9 |
| Structural alignment | PASS | T1–T5 order matches outline → notes → slides → materials |
| Terminology & study aids | PASS | Glossary/mindmap/revision present and aligned |
| Pedagogical / exam quality | PASS | Examples, pitfalls, exam tips, tiered bank, rubrics, labs |
| Slides technical | PASS | 57 slides; campus-blue; build succeeded |
| Versioning hygiene | PASS | v1.0, changelog, version_history, CURRENT, manifest |

## Findings

### CRITICAL
- None

### MAJOR
- None

### MINOR
1. Objectives slide (`s02`) packs all nine Bloom objectives (above the ~6-bullet heuristic)—acceptable for a single CO mirror slide; consider splitting in v1.1 if teaching pace prefers it.
2. Notes are dense survey-level for a 30-hour map; instructors may want expanded numerical Excel drills in v1.1.
3. Syllabus teaching/examination scheme marks table is documented in subject README/manifest but not duplicated as a student-facing assessment appendix (optional).

### INFO
1. Quizzes (`quizzes.md`) not generated (not requested).
2. Source syllabus stored as `subjects/computer-info/syllabus-source.docx` + extracted `syllabus.md`.
3. Suggested v1.1: add model answer pack for Hard questions; sample filled Excel templates.

## Objective coverage matrix

| Obj # | Bloom | Notes | Slides | Materials |
|---|---|---|---|---|
| 1 | Understand | Y | Y | Y |
| 2 | Understand | Y | Y | Y |
| 3 | Apply | Y | Y | Y |
| 4 | Apply | Y | Y | Y |
| 5 | Apply | Y | Y | Y |
| 6 | Create | Y | Y | Y |
| 7 | Apply | Y | Y | Y |
| 8 | Evaluate | Y | Y | Y |
| 9 | Apply | Y | Y | Y (labs 1–8) |

## Recommended fixes

| ID | Owner agent | Action |
|---|---|---|
| M1 | ppt-builder | Optional v1.1: split objectives across two slides |
| M2 | notes-writer | Optional v1.1: add one more Excel worked numerical |

## Re-run instructions

No blocking re-run required. Orchestrator may mark `released` and keep `CURRENT=v1.0`.
