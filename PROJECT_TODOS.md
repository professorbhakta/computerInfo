# Project Todos — Academic Content Factory

Checklist for every subject run. Mark items as you go.

## A. Intake

- [ ] Capture subject name, level, audience
- [ ] Capture scope (chapter / unit / semester)
- [ ] Capture exam / success goal (board, university, general)
- [ ] Confirm version intent: `v1.0` / minor `v1.x` / major `v2.0`
- [ ] Confirm Git branch (`content/<slug>` or policy default)

## B. Orchestration

- [ ] Academic Content Factory Orchestrator creates/updates `subjects/<slug>/`
- [ ] Seed version folder `vX.Y/` + `manifest.json` (`draft`)
- [ ] Prepare `changelog.md` and plan `version_history.md` update
- [ ] Log retries for failed steps

## C. Curriculum

- [ ] Curriculum Architect → `outline.md`
- [ ] Bloom tags on every objective (Remember → Create)
- [ ] Prerequisites, timeline, assessment hooks, exam tips/pitfalls
- [ ] Outline accepted before notes

## D. Notes

- [ ] Notes Writer → `notes.md`
- [ ] Modular sections with examples, key takeaways
- [ ] Mermaid/tables where clarifying
- [ ] Exam tips + common pitfalls
- [ ] Self-checks map to Bloom objectives

## E. Slides

- [ ] PPT Builder → valid `slides.json` (version in meta)
- [ ] Theme selected (default `academic-light`)
- [ ] `python scripts/build_pptx.py … --recover` → `slides.pptx`
- [ ] On failure: schema fix → theme fallback → minimal deck

## F. Materials (all required unless user opts out)

- [ ] `question-bank.md` — Easy / Medium / Hard + Bloom tags
- [ ] `assignments.md` — rubrics / projects
- [ ] `labs.md` — labs or practice workshops
- [ ] `glossary.md`
- [ ] `mindmap.md`
- [ ] `revision-sheet.md`
- [ ] Optional: `quizzes.md` if requested

## G. QA

- [ ] QA Reviewer full consistency suite
- [ ] Critical/Major issues fixed via owning agent
- [ ] `qa-report.md` written
- [ ] Status → `qa` → `released` on pass
- [ ] Update `CURRENT`, subject `README.md`, `version_history.md`

## H. Git

- [ ] No secrets / junk staged
- [ ] Commit: `content(<slug>): release vX.Y — <scope>`
- [ ] Push; confirm GitHub URL
- [ ] Subject fork branch documented if used

## I. Factory Maintenance

- [ ] Improve agent prompts from recurring QA findings
- [ ] Extend PPT themes when needed
- [ ] Keep `_template` aligned with contracts
- [ ] Keep `.gitignore` current
