# AGENTS.md

Guidance for AI coding agents working in this repository.

## Project

**computerInfo** — Computer Information materials for BA-LLB coursework.

The repository is intentionally lightweight. Prefer simple, well-documented files over heavy frameworks unless a task explicitly requires them.

## Cursor Cloud specific instructions

- Cloud agents use `.cursor/environment.json`. The boot `install` command is `bash .cursor/install.sh`.
- Base runtimes available on the VM: **Node.js 22**, **npm**, **Python 3.12**, **pip**, **git**, and standard build tools (`make`, `gcc`, `g++`).
- Dependency installs are conditional: Node deps install only when `package.json` / lockfiles exist; Python deps install only when `requirements.txt` or `pyproject.toml` exists.
- Do not commit secrets. Use the Cursor Cloud Agents **Secrets** tab for API keys and credentials.
- After meaningful environment changes (new system packages, tooling), ask the user to save an updated VM **snapshot** from the Cloud Agents dashboard so future agents start faster.
- Keep `.cursor/install.sh` idempotent — it may run more than once on partially cached state.
