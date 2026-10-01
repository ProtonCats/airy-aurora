# Airy Aurora for Spotify

A [Spicetify](https://github.com/spicetify/cli) theme that gives the Spotify desktop client the Airy Aurora look, in light and dark. The palette is the same one the [Hyprland rice](https://github.com/ProtonCats/airy-aurora-hyprland) uses.

It is only a `color.ini` and a `user.css`: no extensions, no custom apps, no third-party JavaScript.

## What it changes

- **Palette:** the rice's haze / night-ink backgrounds, ice and blush accents, and periwinkle for muted details (`color.ini`, `[dark]` and `[light]`).
- **Aurora glow:** the main view gets a soft ice and blush glow in the top corners, and the side panels a faint gradient with a thin ice edge. The per-album cover tint behind playlist and album headers is removed, so the look stays the same on every page.
- **Gradients:** the play buttons, the progress and volume bars, the selected track row and page titles use the ice → blush gradient.
- **Details:** frosted top bar, rounded track rows with an ice hover, and thin ice scrollbars.

## Install

Needs [Spicetify](https://spicetify.app/docs/getting-started) and the Flatpak build of Spotify (`com.spotify.Client`).

```bash
./airy-spotify.sh install dark    # or: install light
```

The Flatpak copy of Spotify is root-owned, so the script asks for `sudo` once to make its `Apps` folder writable, points Spicetify at it, copies the theme into `~/.config/spicetify/Themes/AiryAurora`, and applies it. Restart Spotify afterwards.

## Switch light / dark

```bash
./airy-spotify.sh light
./airy-spotify.sh dark
```

Spicetify bakes the palette in when it applies, and Spotify only reads it at launch. The switch therefore re-applies and takes effect the next time Spotify starts. It isn't hooked into the rice's `airy.sh`, so it follows the rice only when you run it.

## Notes

- **After a Spotify update**, run `./airy-spotify.sh dark` (or `light`) again; updates replace the patched files.
- **Undo:** `spicetify restore`.
- **Terms of service:** modifying the client goes against Spotify's terms. Spicetify is widely used and I know of no ban reports, but the risk isn't zero.
- Class names come from Spotify's own UI and can change between versions; if something looks off after an update, that's the first place to look. The theme matches Spotify 1.2.95.
- Credits for everything this builds on are in [../CREDITS.md](../CREDITS.md).
