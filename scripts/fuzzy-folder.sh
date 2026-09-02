#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/skim-themes.sh"

dir="$(
    find "$HOME" -type d 2>/dev/null |
        sort |
        sk "${SKIM_THEME_PDF[@]}" \
            --layout=reverse \
            --height=14 \
            --border \
            --prompt="> " \
            --no-multi
)"

[[ -z "$dir" ]] && exit 0

kitty --directory "$dir"
