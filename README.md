# computerInfo

Computer Information materials for BA-LLB coursework.

## Cloud agent environment

Cursor Cloud agents are configured via [`.cursor/environment.json`](.cursor/environment.json). On each boot they run:

```bash
bash .cursor/install.sh
```

See [`AGENTS.md`](AGENTS.md) for agent-specific notes. After setup changes, save a VM snapshot from the [Cloud Agents dashboard](https://cursor.com/dashboard?tab=cloud-agents) so future agents reuse the prepared environment.
