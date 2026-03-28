# Auto Research Template

A template for autonomous AI-driven research. An AI agent iteratively improves a codebase through structured experiments — each with a hypothesis, implementation, evaluation, and code review — running unattended overnight.

Inspired by [karpathy/autoresearch](https://github.com/karpathy/autoresearch), but generalized: instead of a single-file training loop, this template supports any codebase as a git submodule, and uses structured sub-agents to ensure code quality.

## How It Works

```
┌─────────────────────────────────────────────┐
│  Main Agent (Orchestrator)                  │
│  Reads GOAL.md → Plans → Dispatches →       │
│  Evaluates → Accepts/Discards → Loops       │
└──────────────────┬──────────────────────────┘
                   │ dispatches
                   ▼
┌─────────────────────────────────────────────┐
│  Sub-Agent (per experiment)                 │
│  1. Explore (research-explorer)             │
│  2. Architect (research-architect)          │
│  3. Implement (code on feature branch)      │
│  4. Run (execute experiment)                │
│  5. Review (research-reviewer)              │
│  6. Report back                             │
└─────────────────────────────────────────────┘
```

- **Accepted** experiments are merged into the target branch (`dev` by default).
- **Discarded** experiments are kept as branches on origin + documented in `experiments/`.
- Every experiment gets a markdown record — a complete lab notebook.

## Repository Structure

```
AutoResearchTemplate/
├── CLAUDE.md                          # Agent behavior: orchestration loop
├── CONFIG.md                          # Research config (branch naming, merge target)
├── GOAL.md                            # Research objective & success criteria
├── TOOLS.md                           # Environment: machines, keys, how to run
├── README.md                          # You are here
├── experiments/                       # Lab notebook — one markdown per experiment
│   └── TEMPLATE.md                    # Experiment record template
├── src/                               # Git submodule → your code repository
├── .claude/
│   ├── agents/
│   │   ├── research-explorer.md       # Codebase analysis agent
│   │   ├── research-architect.md      # Experiment design agent
│   │   └── research-reviewer.md       # Code + research review agent
│   └── commands/
│       └── research-experiment.md     # Per-experiment workflow command
└── .devcontainer/
    ├── devcontainer.json              # Dev container config
    └── setup.sh                       # Auto-installs Claude + plugins
```

## Quick Start

### 1. Use This Template

Click "Use this template" on GitHub, or clone and reinitialize:

```bash
git clone https://github.com/YOUR_USER/AutoResearchTemplate.git my-research
cd my-research
```

### 2. Add Your Code as a Submodule

```bash
git submodule add https://github.com/YOUR_USER/your-code-repo.git src
git commit -m "Add code submodule"
```

### 3. Configure

Edit the following files for your research project:

- **GOAL.md** — Define what you're optimizing and how to measure it.
- **TOOLS.md** — Document your compute environment, SSH access, how to run experiments.
- **CONFIG.md** — Adjust merge target (`dev` or `main`), branch naming, etc.

### 4. Run

**Option A: Dev Container (recommended)**

Open in VS Code with the Dev Containers extension, or use GitHub Codespaces. The container automatically installs Claude and plugins.

Then:

```bash
claude --dangerously-skip-permissions
```

Prompt:

```
Read CLAUDE.md and start the research loop.
```

**Option B: Local**

Make sure Claude Code is installed, then:

```bash
# Install the feature-dev plugin (for the research agents)
claude plugins install feature-dev

# Initialize submodule
git submodule update --init --recursive

# Start
claude --dangerously-skip-permissions
```

Prompt the same as above.

### 5. Walk Away

The agent will run experiments indefinitely. Come back to find:

- `experiments/` filled with detailed records of every experiment
- Accepted changes merged into your target branch in `src/`
- All experiment branches (accepted and discarded) pushed to origin

Experiment records use the `YYYYMMDD-NNN` portion as filename (e.g., `experiments/20260327-001.md`).

## Experiment Branches

Every experiment creates a branch in the `src/` submodule:

```
dev/20260327-001    # First experiment
dev/20260327-002    # Second experiment
dev/20260328-003    # Third experiment (next day, continues numbering)
```

All branches are pushed to origin regardless of accept/discard. The `experiments/` markdown records why each was accepted or discarded.

## Customization

- **Change the agent behavior**: Edit `CLAUDE.md` to adjust the orchestration loop.
- **Change the experiment workflow**: Edit `.claude/commands/research-experiment.md`.
- **Add new agent types**: Add `.md` files to `.claude/agents/`.
- **Change merge target**: Set `dev` or `main` in `CONFIG.md`.

## License

[The Unlicense](LICENSE)
