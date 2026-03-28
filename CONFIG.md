# Research Configuration

## Branch Naming

- **Pattern**: `dev/YYYYMMDD-NNN`
  - `YYYYMMDD`: Date the experiment was created.
  - `NNN`: Zero-padded sequential ID, incrementing linearly across all experiments (001, 002, 003, ...).
  - Example: `dev/20260327-001`, `dev/20260327-002`, `dev/20260328-003`
- To find the next ID, check the highest existing experiment branch number and increment by 1.

## Merge Target

- **Default**: `dev`
- **Options**: `dev` or `main`
- Accepted experiments are merged into this branch. Change this to `main` if you want accepted experiments to land directly on main.

## Submodule

- **Path**: `src/`
- **Description**: Git submodule pointing to the public artifact repository.
- All code modifications happen inside this submodule.
- Experiment branches are created inside the submodule.

## Experiment Execution

- **Timeout**: Configurable per-project. Define in GOAL.md or here.
- **Max retries on crash**: 2 — if an experiment crashes, the sub-agent may attempt to fix and re-run up to 2 times before marking it as a crash/discard.

## Push Policy

- All experiment branches are pushed to origin, whether accepted or discarded.
- Merge commits to the merge target branch are also pushed.
