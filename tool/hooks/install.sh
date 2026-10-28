#!/usr/bin/env bash
# Activeert de gedeelde git hooks in tool/hooks. Eenmalig uitvoeren na het clonen.
set -e
cd "$(git rev-parse --show-toplevel)"
chmod +x tool/hooks/pre-push
git config core.hooksPath tool/hooks
echo "Git hooks actief: tool/hooks (pre-push controleert de PR-beschrijving)"
