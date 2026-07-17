# Project Todos — Content Factory Operations

Use this checklist for every subject run. Mark items as you go.

## A. Intake

- [ ] Capture subject name, level (intro / intermediate / advanced), and audience
- [ ] Capture scope (units, chapters, hours, or learning outcomes)
- [ ] Confirm required outputs vs optional (quizzes, glossary, mind map)
- [ ] Confirm version: new subject → `v1`; revision → next `vN`
- [ ] Confirm Git branch strategy (`main` for factory; subject work on feature branch if policy requires)

## B. Orchestration

- [ ] Main Orchestrator creates/updates `subjects/<slug>/` and version folder
- [ ] Write/update `manifest.json` with status `draft`
- [ ] Update `CURRENT` pointer when version is ready to activate
- [ ] Log retry attempts for any failed agent step

## C. Curriculum

- [ ] Curriculum Architect produces `outline.md`
- [ ] Every learning objective tagged with Bloom level (Remember → Create)
- [ ] Outline includes prerequisites, sequence, time estimates, assessment hooks
- [ ] Orchestrator accepts outline before notes begin

## D. Notes

- [ ] Notes Writer produces `notes.md` aligned to outline
- [ ] Definitions, examples, and common misconceptions included
- [ ] Self-check prompts map to Bloom objectives
- [ ] Reading level matches audience

## E. Slides

- [ ] PPT Builder writes valid `slides.json`
- [ ] Theme selected (or default academic theme)
- [ ] `python scripts/build_pptx.py …` succeeds → `slides.pptx`
- [ ] On failure: apply error-recovery steps (schema fix → theme fallback → rebuild)

## F. Materials

- [ ] Assignments (`assignments.md`) with clear rubrics
- [ ] Tiered question bank (`question-bank.md`: Easy / Medium / Hard)
- [ ] Lab exercises (`labs.md`) with setup, steps, expected outcomes
- [ ] Optional: quizzes, glossary, mind map as requested

## G. QA

- [ ] QA Reviewer runs full consistency suite
- [ ] Critical issues fixed (re-run responsible agent)
- [ ] `qa-report.md` written; status → `qa` then `released` when clear
- [ ] Manifest updated with final paths and status

## H. Git

- [ ] `git status` clean of secrets / junk
- [ ] Stage subject version files + any factory updates
- [ ] Commit with conventional message (see Main Orchestrator)
- [ ] Push to remote; confirm GitHub URL / branch

## I. Factory Maintenance (as needed)

- [ ] Improve agent prompts from recurring QA findings
- [ ] Extend PPT themes in `build_pptx.py`
- [ ] Refresh `subjects/_template` when layout evolves
- [ ] Keep `.gitignore` aligned with generated artifacts
