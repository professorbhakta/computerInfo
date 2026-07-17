# Slides

PowerPoint decks for **Computer Information**.

## Files

| Path | Description |
|---|---|
| [`course/computer-info-full-course.pptx`](./course/computer-info-full-course.pptx) | Full-course deck (57 slides) |
| [`course/computer-info-full-course.json`](./course/computer-info-full-course.json) | Editable slide source JSON |
| [`unit-01/`](./unit-01/) | Unit 1 dedicated PPTX |

Rebuild PPTX from JSON (from repo root on this branch):

```bash
python scripts/build_pptx.py \
  --input slides/course/computer-info-full-course.json \
  --output slides/course/computer-info-full-course.pptx \
  --theme campus-blue \
  --recover
```
