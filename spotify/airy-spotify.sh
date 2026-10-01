#!/usr/bin/env bash
# Airy Aurora for Spotify (Flatpak) via Spicetify.
#   ./airy-spotify.sh install [light|dark]   one-time setup + apply (default: dark)
#   ./airy-spotify.sh light|dark             switch palette and re-apply
# Spotify reads the patched files at launch, so restart it to see a change.
set -euo pipefail

APP=com.spotify.Client
HERE=$(cd "$(dirname "$0")" && pwd)
THEME_DIR=$HOME/.config/spicetify/Themes/AiryAurora

command -v spicetify >/dev/null || { echo "spicetify not found: https://spicetify.app/docs/getting-started" >&2; exit 1; }
LOC=$(flatpak info --show-location "$APP" 2>/dev/null) || { echo "Flatpak $APP is not installed" >&2; exit 1; }
SPOTIFY_DIR=$(dirname "$LOC")/active/files/extra/share/spotify
PREFS=$HOME/.var/app/$APP/config/spotify/prefs

install_theme() {
  mkdir -p "$THEME_DIR"
  cp "$HERE/color.ini" "$HERE/user.css" "$THEME_DIR/"
}

# The Flatpak copy of Spotify is root-owned; Spicetify has to write into it.
ensure_writable() {
  [ -w "$SPOTIFY_DIR/Apps" ] && return
  echo "Making $SPOTIFY_DIR writable (sudo)"
  sudo chmod a+wr "$SPOTIFY_DIR"
  sudo chmod a+wr -R "$SPOTIFY_DIR/Apps"
}

case "${1:-}" in
  install)
    scheme=${2:-dark}
    ensure_writable
    spicetify config spotify_path "$SPOTIFY_DIR" prefs_path "$PREFS"
    install_theme
    spicetify config current_theme AiryAurora color_scheme "$scheme"
    spicetify apply || spicetify backup apply
    ;;
  light|dark)
    ensure_writable
    install_theme
    spicetify config color_scheme "$1"
    spicetify apply
    ;;
  *)
    echo "usage: $0 install [light|dark] | light | dark" >&2
    exit 2
    ;;
esac
