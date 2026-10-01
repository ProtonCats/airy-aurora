# Airy Aurora

A frosted pastel look in ice blue and blush, kept consistent across the desktop and the apps on it. Every part comes in a light and a dark mode, and all of them share one palette.

This repository is the home of the project: it holds the **Spotify theme** and the **master credits**, and it points to the other parts.

| Part | What it is | Where it lives |
|---|---|---|
| **Hyprland rice** | The full desktop theme for [KooL Hyprland](https://github.com/JaKooLit/Hyprland-Dots): waybar, kitty, hyprlock, swaync, rofi, GTK and icons, with a one-key light/dark switch | [ProtonCats/airy-aurora-hyprland](https://github.com/ProtonCats/airy-aurora-hyprland) |
| **Spotify theme** | A [Spicetify](https://github.com/spicetify/cli) theme for the Spotify desktop client | [`spotify/`](spotify/) in this repository |
| **Discord theme** | A personal [Vencord](https://github.com/Vendicated/Vencord) theme with the same palette | Not published. Its background image has no recorded source, so it isn't mine to redistribute |

Credit for everything this stands on is in **[CREDITS.md](CREDITS.md)**.

## What is in this repository

```
airy-aurora/
├── README.md               this file
├── CREDITS.md              master credits for the whole project
└── spotify/
    ├── README.md           full guide to the Spotify theme
    ├── airy-spotify.sh     installer and light/dark switch (bash)
    ├── color.ini           the palette, as Spicetify color schemes [dark] and [light]
    └── user.css            the styling that uses the palette
```

| File | Purpose |
|---|---|
| `CREDITS.md` | Every upstream project used across the Hyprland rice, the Spotify theme and the Discord theme: author, license and exactly how it is used. |
| `spotify/color.ini` | The two color schemes in Spicetify's format. Besides Spicetify's standard keys it defines six custom ones (`grad-a`, `grad-b`, `on-grad`, `rose`, `sky`, `blush`) that `user.css` reads. |
| `spotify/user.css` | About 100 lines of CSS: aurora glow on the panels, gradient accents, rounded rows, scrollbars. It contains no colors of its own; everything comes from `color.ini`, so one stylesheet serves both modes. |
| `spotify/airy-spotify.sh` | Installs the theme into Spicetify and the Flatpak Spotify, and switches between light and dark. |
| `spotify/README.md` | Requirements, install steps, exactly what the script changes, the palette tables, troubleshooting and how to undo everything. |

There are no screenshots, binaries, fonts, images or third-party code in this repository, only the four files in `spotify/` and two Markdown files.

## Requirements

This is what the Spotify theme needs; the Hyprland rice lists its own in its repository.

| Requirement | Details |
|---|---|
| **OS** | Linux. Developed and tested on Nobara Linux 44 (Fedora 44 base, kernel 7.2) with Hyprland. Nothing in the theme depends on the compositor or the desktop environment. |
| **Spotify** | The **Flatpak** build, `com.spotify.Client` from Flathub. Tested with 1.2.95.453. The script is written for Flatpak only; for another install, point Spicetify at it by hand ([spotify/README.md](spotify/README.md#other-install-types)). |
| **Spicetify CLI** | Installed and on your `PATH`. Tested with v2.45.1. See [Spicetify's install guide](https://spicetify.app/docs/getting-started). |
| **Shell tools** | `bash`, `flatpak`, and `sudo` (only needed once, to make the system-wide Flatpak folder writable). |
| **Account** | A normal Spotify login. Nothing is sent anywhere by the theme. |

## Quick start

```bash
git clone https://github.com/ProtonCats/airy-aurora.git
cd airy-aurora/spotify
./airy-spotify.sh install dark     # or: install light
```

Then restart Spotify. To change mode later: `./airy-spotify.sh light` or `./airy-spotify.sh dark`, then restart Spotify.

## How the system fits together

```
 color.ini  ──┐                           ┌── colors.css  (--spice-* variables)
              ├─►  Spicetify  ──patches──►│
 user.css   ──┘    (apply)                └── user.css    (the styling)
                                          inside Spotify's UI bundle (xpui)
```

1. **Spotify** is a Chromium-based app whose interface is a web bundle (`xpui`) inside its install folder.
2. **Spicetify** unpacks that bundle once (keeping a backup), then on every `apply` generates `colors.css` from the chosen scheme in `color.ini`, appends `user.css`, and writes both back. Spotify reads them at launch.
3. **`color.ini`** holds the palette. Each key becomes a CSS variable, `--spice-<key>`, plus an RGB-triplet twin, `--spice-rgb-<key>`, for use with `rgba()`.
4. **`user.css`** only refers to those variables, so switching scheme recolors everything without touching the CSS.
5. **`airy-spotify.sh`** automates the one awkward part: the Flatpak copy of Spotify is root-owned, so the script fixes its permissions, tells Spicetify where it is, copies the theme into `~/.config/spicetify/Themes/AiryAurora`, picks the scheme and applies.

Because Spotify only reads the files at launch, a light/dark switch takes effect on the next start. It follows the rice only when you run the script; it is not wired into the Hyprland repo's `airy.sh`.

## The palette

One palette across the whole project. The core roles:

| Role | Light | Dark |
|---|---|---|
| Background | `#EEF2F6` | `#1B1E26` |
| Panel | `#DDE6EE` | `#262B35` |
| Text | `#30343D` | `#E3E9EF` |
| Accent, start of the gradient | `#4F7C8B` | `#8CC0D6` |
| Accent, end of the gradient | `#926675` (rose) | `#D69CAC` (rose) |
| Ice / blush (shared) | `#AACCDD` / `#CCB2B9` | `#AACCDD` / `#CCB2B9` |
| Muted details | `#6E6BA6` (periwinkle) | `#A7A4D9` (periwinkle) |

The full per-key tables are in [spotify/README.md](spotify/README.md#palette).

## Notes and limits

- Spicetify modifies the Spotify client, which goes against Spotify's terms of service. It is widely used and I know of no ban reports, but the risk isn't zero.
- The theme is written against Spotify's own class names, which change between versions. After a Spotify update, re-run the script; if something looks off, that is the first thing to check.
- The theme loads no extensions or custom apps, so it adds no third-party JavaScript to Spotify.
- This project is not affiliated with or endorsed by Spotify, Discord or any project it builds on.

## Issues and credit

If you made something this uses and it isn't credited, or credited wrongly, please [open an issue](https://github.com/ProtonCats/airy-aurora/issues) and it will be fixed.
