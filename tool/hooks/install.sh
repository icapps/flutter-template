#!/usr/bin/env bash
# Activates the shared git hooks in tool/hooks. Run once after cloning.
set -e
cd "$(git rev-parse --show-toplevel)"
chmod +x tool/hooks/pre-push
git config core.hooksPath tool/hooks
echo "Git hooks active: tool/hooks (pre-push checks the PR description)"
