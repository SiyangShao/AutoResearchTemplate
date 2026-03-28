# Tools & Environment Configuration

<!--
This file tells the agent about the execution environment: machines, credentials, tools, and any system-level configuration needed to run experiments.
-->

## Compute Environment

<!--
Describe the machine(s) available for experiments.
Example:
- **GPU**: 1x NVIDIA H100 80GB
- **CPU**: 64-core AMD EPYC
- **RAM**: 512GB
- **OS**: Ubuntu 22.04
-->
TODO: Describe your compute environment.

## SSH Access

<!--
If experiments run on remote machines, document SSH access here.
Example:
- **Host**: gpu-server-1
- **User**: researcher
- **Key**: ~/.ssh/id_research
- **Command**: `ssh researcher@gpu-server-1`
-->
TODO: Document SSH access if applicable.

## Software & Dependencies

<!--
What tools/packages are pre-installed or required?
Example:
- Python 3.10+ with uv
- PyTorch 2.x with CUDA 12
- Claude Code CLI
-->
TODO: List required software.

## API Keys & Credentials

<!--
Document what credentials are needed (NOT the actual values — those go in environment variables or .env).
Example:
- **ANTHROPIC_API_KEY**: Required for Claude sub-agents. Set in environment.
- **WANDB_API_KEY**: Optional, for experiment tracking.
-->
TODO: Document required credentials.

## Data

<!--
Where does training/evaluation data live?
Example:
- **Training data**: ~/.cache/autoresearch/train_shards/
- **Tokenizer**: ~/.cache/autoresearch/tokenizer.model
- **Preparation**: Run `uv run prepare.py` to download and prepare data.
-->
TODO: Document data location and preparation steps.

## Experiment Execution

<!--
How to run an experiment. The exact command(s) the agent should use.
Example:
- **Run**: `uv run train.py > run.log 2>&1`
- **Extract metrics**: `grep "^val_bpb:\|^peak_vram_mb:" run.log`
- **Timeout**: Kill after 10 minutes if not finished.
-->
TODO: Document how to run experiments.
