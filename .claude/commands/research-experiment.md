---
description: Execute a single research experiment — explore, architect, implement, run, review, report
argument-hint: "Hypothesis: ... | Approach: ... | Success criteria: ... | Branch: dev/YYYYMMDD-NNN"
---

# Research Experiment

You are executing a single autonomous research experiment inside the `src/` submodule. Follow the phases below without pausing for human input — you are fully autonomous.

## Input

The orchestrator provides:
- **Hypothesis**: What we expect to happen and why
- **Approach**: High-level description of the change
- **Success criteria**: How to evaluate (metrics, tests, benchmarks)
- **Branch name**: The experiment branch to create

Experiment specification: $ARGUMENTS

---

## Phase 1: Explore

**Goal**: Understand the current codebase state before making changes.

**Actions**:
1. `cd src/` — all work happens in the submodule
2. Launch 1-2 research-explorer agents to analyze:
   - Current implementation state and recent changes
   - The specific area relevant to this experiment's hypothesis
3. Read the essential files identified by explorers
4. Summarize: what exists now, what we're changing, what to watch out for

---

## Phase 2: Architect

**Goal**: Design the implementation before writing code.

**Actions**:
1. Launch a research-architect agent with:
   - The hypothesis and approach from the orchestrator
   - Findings from Phase 1
   - Constraints from GOAL.md
2. Review the blueprint — does it make sense? Is it minimal and clean?
3. If the blueprint has obvious issues, adjust it. Do not ask the human.

---

## Phase 3: Implement

**Goal**: Write the code on a feature branch.

**Actions**:
1. Inside `src/`, checkout the merge target branch first (`git checkout <merge-target>` — see CONFIG.md, default: `dev`), then create the experiment branch from it: `git checkout -b <branch-name>`
2. Implement the changes following the architect's blueprint
3. Keep changes minimal — do not refactor unrelated code
4. Commit with a clear message describing the experiment

---

## Phase 4: Run

**Goal**: Execute the experiment and collect results.

**Actions**:
1. Run the experiment using the procedure defined in TOOLS.md
2. Collect metrics as defined in GOAL.md
3. If the run crashes:
   - Read the error, attempt a fix (up to 2 retries as per CONFIG.md)
   - If unfixable, record as crash and skip to Phase 6

---

## Phase 5: Review

**Goal**: Verify code quality and research validity.

**Actions**:
1. Launch 2 research-reviewer agents in parallel:
   - One focused on code quality (bugs, correctness, conventions)
   - One focused on research validity (methodology, metric integrity, confounds)
2. Consolidate findings
3. If critical issues found: fix them, re-commit, re-run if needed
4. If FAIL recommendation: note this in the report — the orchestrator will likely discard

---

## Phase 6: Report

**Goal**: Return structured results to the orchestrator.

**Actions**:
Return a report with exactly this structure:

```
## Experiment Report: <branch-name>

### Hypothesis
<what we tested>

### Implementation
<what was changed — files modified, key decisions>

### Results
<metrics, outputs, comparison to baseline>

### Code Review
<summary of review findings, any issues fixed>

### Research Validity
<methodology assessment>

### Recommendation
<ACCEPT / DISCARD / CRASH — with reasoning>

### Follow-up Ideas
<what to try next based on these results>
```
