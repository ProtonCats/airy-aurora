# Airy Aurora for Spotify

A [Spicetify](https://github.com/spicetify/cli) theme that gives the Spotify desktop client the Airy Aurora look, in light and dark. The palette is the one the [Hyprland rice](https://github.com/ProtonCats/airy-aurora-hyprland) uses.

It is two files, `color.ini` and `user.css`, plus a script that installs them. It uses no extensions, no custom apps and no third-party JavaScript.

## What it changes

- **Palette:** the rice's haze and night-ink backgrounds, ice and blush accents, and periwinkle for muted details.
- **Aurora glow:** the main view gets a soft ice and blush glow in its top corners; the library, now-playing panel and player bar get a faint gradient and a thin ice edge.
- **No cover tint:** Spotify colors playlist and album headers from the cover art. The theme turns that off so every page keeps the same look, and recolors the header text that depended on it.
- **Gradients:** the play buttons, the progress and volume bars, the selected track row and the big page titles use the ice to blush gradient.
- **Details:** a frosted top bar, rounded track rows with an ice hover, a transparent library column and thin ice scrollbars.

Other primary buttons (for example "Listen now") keep Spotify's own styling.

## Requirements

| Requirement | Details |
|---|---|
| OS | Linux. Developed on Nobara Linux 44 (Fedora 44 base) under Hyprland; no part of the theme depends on the compositor or desktop. |
| Spotify | The Flatpak build `com.spotify.Client` from Flathub, system-wide or per-user install. Tested with **1.2.95.453** on a system-wide install; a per-user install should work (the script then needs no `sudo`) but is untested. |
| Spicetify CLI | On your `PATH`. Tested with **v2.45.1**. Install from the [Spicetify guide](https://spicetify.app/docs/getting-started), or download the release tarball, which contains the `spicetify` binary and a `jsHelper/` folder that must stay next to it (symlink the binary instead of moving it). |
| Tools | `bash`, `flatpak`, `sudo` |
| Spotify | Run once before installing, so its config folder exists and you are logged in. |

## Install

```bash
./airy-spotify.sh install dark      # or: install light
```

Restart Spotify afterwards (quit it fully, then start it again).

### What the script does, step by step

1. Checks that `spicetify` is on your `PATH` and that the Flatpak `com.spotify.Client` is installed, and finds Spotify's folder from `flatpak info`. It uses the stable `.../stable/active/...` path, not the commit-specific one, so it survives Spotify updates.
2. **Permissions:** if Spotify's `Apps` folder isn't writable, it runs `sudo chmod a+wr` on the Spotify folder and `sudo chmod a+wr -R` on `Apps`. This is the one step that needs `sudo`, and it only happens when the folder is read-only. A system-wide Flatpak install is owned by root, so Spicetify can't patch it otherwise.
3. Tells Spicetify where Spotify and its `prefs` file are (`spicetify config spotify_path` and `prefs_path`; this edits `~/.config/spicetify/config-xpui.ini`).
4. Copies `color.ini` and `user.css` into `~/.config/spicetify/Themes/AiryAurora/`.
5. Selects the theme and scheme (`current_theme`, `color_scheme`).
6. Runs `spicetify apply`; if Spicetify has never backed Spotify up, `spicetify backup apply` instead. Spicetify keeps the original files in `~/.local/state/spicetify/Backup/`.

### Everything it touches

| Where | What changes |
|---|---|
| Spotify's folder (`/var/lib/flatpak/app/com.spotify.Client/.../files/extra/share/spotify`) | Permissions loosened to world-writable (step 2); the `Apps/xpui` UI bundle is patched by Spicetify. |
| `~/.config/spicetify/config-xpui.ini` | Spicetify's settings: paths, theme and scheme. |
| `~/.config/spicetify/Themes/AiryAurora/` | A copy of the two theme files. |
| `~/.local/state/spicetify/Backup/` | Spicetify's backup of Spotify's original UI bundle. |

Nothing else on the system is modified.

## Switching light and dark

```bash
./airy-spotify.sh light
./airy-spotify.sh dark
```

This sets the scheme in Spicetify and re-applies. Spotify only reads the theme when it starts, so **restart Spotify** to see the change. The switch is manual: it does not follow the Hyprland rice automatically (Spotify has no signal from the rice to follow, so the scheme is chosen when you apply).

## Other install types

The script only handles the Flatpak. For a native or other install, do the same by hand:

```bash
mkdir -p ~/.config/spicetify/Themes/AiryAurora
cp color.ini user.css ~/.config/spicetify/Themes/AiryAurora/
spicetify config spotify_path /path/to/spotify prefs_path /path/to/prefs   # see `spicetify path`
spicetify config current_theme AiryAurora color_scheme dark                # or light
spicetify backup apply                                                     # `spicetify apply` if already backed up
```

Spicetify's [installation guide](https://spicetify.app/docs/getting-started) covers where Spotify lives on each platform and the permission step.

## Updating

- **After a Spotify update:** run `./airy-spotify.sh dark` (or `light`) again. Updates replace the patched files.
- **After pulling a new version of this theme:** run the same command; the script copies the new files in before applying.

## Undo

```bash
spicetify restore          # puts Spotify's original UI back
```

This leaves the world-writable permissions from step 2 as they were; to tighten them again, run `sudo chmod go-w` on the Spotify folder and `sudo chmod -R go-w` on its `Apps` folder, or reinstall the Flatpak (`flatpak uninstall com.spotify.Client && flatpak install flathub com.spotify.Client`).

## Palette

`color.ini` defines two Spicetify schemes, `[dark]` and `[light]`. Spicetify exposes every key as `--spice-<key>` and `--spice-rgb-<key>`. The last six keys are custom ones that Spicetify passes through and `user.css` reads.

| Key | Dark | Light | Used for |
|---|---|---|---|
| `text` | `#E3E9EF` | `#30343D` | Main text, headings |
| `subtext` | `#B4CFDD` | `#3F6572` | Secondary text: artists, descriptions, metadata |
| `main` | `#1B1E26` | `#EEF2F6` | Main view background |
| `main-elevated` | `#262B35` | `#DDE6EE` | Surfaces above the main view |
| `highlight` | `#313845` | `#D4DFE8` | Hover background |
| `highlight-elevated` | `#3A4252` | `#C8D6E0` | Hover background on elevated surfaces |
| `sidebar` | `#262B35` | `#DDE6EE` | Library / navigation panel |
| `player` | `#262B35` | `#DDE6EE` | Now-playing bar |
| `card` | `#313845` | `#C8D6E0` | Card and outline color |
| `shadow` | `#0D0F14` | `#AEBBC7` | Shadows |
| `selected-row` | `#F4F7FA` | `#1F2229` | Text of the selected or playing row |
| `button` | `#8CC0D6` | `#4F7C8B` | Primary accent: buttons, now-playing mark, like button |
| `button-active` | `#A2CDDF` | `#44707E` | Accent on hover / press |
| `button-disabled` | `#3A4252` | `#C8D6E0` | Empty part of the progress and volume bars |
| `tab-active` | `#313845` | `#C8D6E0` | Active tab / chip background |
| `notification` | `#8CC0D6` | `#4F7C8B` | Notification toast |
| `notification-error` | `#D6677C` | `#B0455C` | Error toast |
| `misc` | `#A7A4D9` | `#6E6BA6` | Miscellaneous (periwinkle muted detail) |
| `grad-a` | `#8CC0D6` | `#4F7C8B` | Gradient start (custom) |
| `grad-b` | `#D69CAC` | `#926675` | Gradient end (custom) |
| `on-grad` | `#1B1E26` | `#FFFFFF` | Text/icons drawn on the gradient (custom) |
| `rose` | `#D69CAC` | `#926675` | Rose accent (custom) |
| `sky` | `#AACCDD` | `#AACCDD` | Ice accent (custom) |
| `blush` | `#CCB2B9` | `#CCB2B9` | Blush accent (custom) |

## How `user.css` is organized

It contains no color literals; every color is a `var(--spice-...)` from the table above.

| Section | What it does |
|---|---|
| Variables | `--aa-grad` (ice to blush, horizontal), `--aa-grad-diag` (diagonal), `--aa-edge` (the thin panel border) |
| Panels | Aurora glow on `.Root__main-view`; faint gradient and edge on the nav bar, right sidebar and player bar |
| Cover tint off | Makes the header and action-bar tint layers transparent; frosted top bar |
| Gradient accents | Play buttons only (`[class*="button-primary__inner"]` inside the play-button containers); progress bar fill |
| Page titles | Gradient text on the playlist / album / artist title |
| Rows | Rounded track rows, ice hover, gradient selected row |
| Scrollbars | Thin ice thumbs |
| Header text | Recolors the "subdued" header text that was written for a cover-tinted background |
| Library column | Transparent, so the panel gradient shows through |

Spotify's class names come from Spicetify's CSS map. Where Spotify's own classes carry a build hash (such as `e-10451-`), the theme matches the stable part with `[class*="..."]`.

## Troubleshooting

- **The theme doesn't show:** quit Spotify completely (check the tray), start it again. `spicetify apply` only writes files.
- **`A backup is available ... Please restore first then backup`:** this comes from running `spicetify backup apply` on an already patched Spotify. Run `spicetify apply` instead; the script already does this.
- **`error open .../jsHelper/...: no such file`:** `spicetify` was moved away from its `jsHelper/` folder. Put it back, or run it through a symlink.
- **Permission denied while applying:** run `./airy-spotify.sh install` again so the script can fix the folder permissions.
- **Colors or layout look off after a Spotify update:** Spotify changed class names. Re-run the script first; if it persists, open an issue with your Spotify version (`flatpak info com.spotify.Client`).
- **Spotify crashed on its first launch after the first apply** (once, during development, with the remote-debugging flag on); relaunching worked and it has been stable since. If it happens repeatedly, `spicetify restore` and open an issue.

## Notes

- Spicetify modifies the Spotify client, which goes against Spotify's terms of service. It is widely used and I know of no ban reports, but the risk isn't zero.
- The theme matches Spotify 1.2.95; it has not been tested on other versions.
- Credits for everything this builds on: [../CREDITS.md](../CREDITS.md).
