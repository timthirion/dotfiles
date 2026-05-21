#!/usr/bin/env bash
# Install the terminal toolchain.
#   macOS: `brew bundle` from ../Brewfile
#   Linux: download latest release binaries into ~/.local/bin (no sudo)
# Safe to re-run; skips tools already on PATH (use --force to reinstall on Linux).
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORCE=0; [ "${1:-}" = "--force" ] && FORCE=1

case "$(uname -s)" in
  Darwin)
    if ! command -v brew >/dev/null; then
      echo "Homebrew not found. Install it from https://brew.sh, then re-run." >&2
      exit 1
    fi
    exec brew bundle --file="$SCRIPT_DIR/../Brewfile"
    ;;
  Linux) ;;  # handled below
  *) echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac

# ---- Linux: release-binary install into ~/.local/bin ----
BIN="$HOME/.local/bin"; mkdir -p "$BIN"
case "$(uname -m)" in
  x86_64|amd64) ARCH=x86_64 ;;
  *) echo "This script only auto-installs x86_64 Linux binaries; got $(uname -m)." >&2
     echo "Install via your package manager or cargo instead." >&2; exit 1 ;;
esac

need() { [ "$FORCE" = 1 ] && return 0; ! command -v "$1" >/dev/null; }
latest_asset() { # repo  regex
  curl -fsSL --max-time 25 "https://api.github.com/repos/$1/releases/latest" \
    | grep -o '"browser_download_url": *"[^"]*"' | cut -d'"' -f4 | grep -E "$2" | head -1
}
fetch_bin() { # name  repo  regex
  local name="$1" repo="$2" re="$3" url f tmp found
  need "$name" || { echo "  • $name already installed — skipping"; return 0; }
  url="$(latest_asset "$repo" "$re")"
  [ -z "$url" ] && { echo "  ✗ $name: no matching release asset"; return 1; }
  tmp="$(mktemp -d)"; f="$tmp/$(basename "$url")"
  echo "  ↓ $name ($(basename "$url"))"
  curl -fsSL "$url" -o "$f" || { echo "  ✗ $name: download failed"; rm -rf "$tmp"; return 1; }
  case "$f" in
    *.tar.gz|*.tgz) tar xzf "$f" -C "$tmp" ;;
    *.tbz|*.tar.bz2) tar xjf "$f" -C "$tmp" ;;
    *.zip) command -v unzip >/dev/null && unzip -qo "$f" -d "$tmp" \
             || python3 -c "import zipfile,sys; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])" "$f" "$tmp" ;;
  esac
  found="$(find "$tmp" -type f -name "$name" | head -1)"
  if [ -n "$found" ]; then install -m755 "$found" "$BIN/$name"; echo "  ✓ $name"; else echo "  ✗ $name: binary not in archive"; fi
  rm -rf "$tmp"
}

echo "Installing CLI tools into $BIN ..."
fetch_bin zoxide    ajeetdsouza/zoxide       "${ARCH}-unknown-linux-musl\.tar\.gz\$"
fetch_bin fd        sharkdp/fd               "${ARCH}-unknown-linux-gnu\.tar\.gz\$"
fetch_bin lazygit   jesseduffield/lazygit    "[Ll]inux_${ARCH}\.tar\.gz\$"
fetch_bin btop      aristocratos/btop        "btop-${ARCH}-unknown-linux-musl\.tar\.gz\$"
fetch_bin atuin     atuinsh/atuin            "/atuin-${ARCH}-unknown-linux-gnu\.tar\.gz\$"
fetch_bin fastfetch fastfetch-cli/fastfetch  "linux-amd64\.tar\.gz\$"

# yazi ships two binaries (yazi + ya) in one archive
if need yazi; then
  url="$(latest_asset sxyazi/yazi "${ARCH}-unknown-linux-gnu\.zip\$")"
  if [ -n "$url" ]; then
    tmp="$(mktemp -d)"; echo "  ↓ yazi ($(basename "$url"))"
    curl -fsSL "$url" -o "$tmp/y.zip"
    command -v unzip >/dev/null && unzip -qo "$tmp/y.zip" -d "$tmp" \
      || python3 -c "import zipfile,sys; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])" "$tmp/y.zip" "$tmp"
    for b in yazi ya; do
      found="$(find "$tmp" -type f -name "$b" | head -1)"
      [ -n "$found" ] && install -m755 "$found" "$BIN/$b" && echo "  ✓ $b" || echo "  ✗ $b: not found"
    done
    rm -rf "$tmp"
  else echo "  ✗ yazi: no matching release asset"; fi
else echo "  • yazi already installed — skipping"; fi

echo "Done. Ensure ~/.local/bin is on your PATH (it already is in this repo's config.fish)."
