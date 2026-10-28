#!/usr/bin/env bash
# Activates the shared git hooks in tool/hooks. Run once after cloning.
set -e
cd "$(git rev-parse --show-toplevel)"
chmod +x tool/hooks/pre-push
git config core.hooksPath tool/hooks
echo "Git hooks actief: tool/hooks (pre-push controleert de PR-beschrijving)"
