#!/bin/bash
set -e

echo "=== Auto Research Environment Setup ==="

# Install Claude Code CLI
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

# Initialize git submodule
echo "Initializing submodule..."
git submodule update --init --recursive

# Install the feature-dev plugin
echo "Installing feature-dev plugin..."
claude plugins add feature-dev

echo "=== Setup complete ==="
echo ""
echo "To start autonomous research:"
echo "  1. Fill in GOAL.md, CONFIG.md, and TOOLS.md"
echo "  2. Run: claude --dangerously-skip-permissions"
echo "  3. Prompt: Read CLAUDE.md and start the research loop."
