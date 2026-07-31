#!/bin/bash
# Deploy the Melee deck to GitHub Pages
# Usage: bash ~/melee-deck/deploy.sh [optional commit message]
set -e
export PATH="/opt/homebrew/bin:$PATH"

cd "$(dirname "$0")"

MSG="${1:-Update deck $(date +%Y-%m-%d_%H:%M)}"

# Force at least one change so git always commits (harmless HTML comment)
sed -i '' -e "s|<!-- deploy .* -->||g" index.html 2>/dev/null || true
printf '\n<!-- deploy %s -->\n' "$(date +%s)" >> index.html

git add -A
if git diff --cached --quiet; then
  echo "No changes to deploy."
  exit 0
fi

git commit -m "$MSG"
git push origin main

echo ""
echo "✅ Deployed"
echo "🔗 https://heyitsmaximilian.github.io/melee-deck/"
echo "   (may take ~30s for GitHub Pages to rebuild)"
