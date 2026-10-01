# Credits

Airy Aurora is built on other people's work. This file is the master list for the whole project: the [Hyprland rice](https://github.com/ProtonCats/airy-aurora-hyprland), the [Spotify theme](spotify/) and the personal Discord theme. For each project it gives the author, the license as GitHub reports it, and how it is used here.

If something is missing or wrong, please open an issue and it will be fixed.

**Original to Airy Aurora:** the palettes (light and dark), the wallust color schemes, the waybar, kitty, hyprlock, swaync and rofi styling, the `airy.sh` switch, the CPU / RAM pill, the playerctl and cava gradient scripts, the AiryJP and AiryBars icon fonts, the Spotify theme and the Discord theme. The CPU / RAM pill is modeled on the author's own `plasma-rice` plasmoid.

## Spotify theme

| Project | License | How it is used |
|---|---|---|
| [**Spicetify**](https://github.com/spicetify/cli) by the Spicetify project and its contributors | LGPL-2.1 | The whole theme runs on it. Spicetify patches the Spotify client's UI bundle (`xpui`) and loads a theme made of a `color.ini` and a `user.css`; Airy Aurora ships exactly those two files. Its `[scheme]` palette format, the `--spice-*` color variables (including the custom keys `grad-a`, `grad-b`, `on-grad`, `rose`, `sky` and `blush`), and its remote CSS map of Spotify's class names are what the stylesheet is written against. The unmodified release binary (v2.45.1) is installed by the user; none of Spicetify's code is copied into this repository. |
| [**Spotify**](https://www.spotify.com) | proprietary | The client being themed. This project is not affiliated with or endorsed by Spotify. Nothing of Spotify's is redistributed. |
| [**Chromium DevTools Protocol**](https://chromedevtools.github.io/devtools-protocol/) | n/a | Spotify's desktop client is built on the Chromium Embedded Framework. During development the live DOM was inspected and CSS was injected through its remote-debugging port, to find class names and check both modes. It isn't needed to use the theme. |

## Hyprland rice

### Base

| Project | License | How it is used |
|---|---|---|
| [**KooL Hyprland dots**](https://github.com/JaKooLit/Hyprland-Dots) and [**Fedora-Hyprland installer**](https://github.com/JaKooLit/Fedora-Hyprland) by JaKooLit | GPL-3.0 | The rice is a theme for these dots (v2.3.20). It ships modified copies of KooL files: the waybar `Modules`, `ModulesCustom`, `ModulesGroups` and layouts, the waybar styles, `hyprlock.conf`, the swaync and rofi styles and templates, `kitty.conf`, `UserDecorations.conf`, `WindowRules.conf`, `WallustSwww.sh`, `WallpaperEffects.sh`, `Weather.py`, `WeatherWrap.sh` and `Hyprsunset.sh`. `WaybarCava.sh` is a lifecycle-hardened variant of KooL's script, whose concept is KooL's. These derived files stay under GPL-3.0. The installer was used (patched) to set up the desktop. |
| [**Hyprland**](https://github.com/hyprwm/Hyprland) and [**hyprlock**](https://github.com/hyprwm/hyprlock) by Vaxry and the hyprwm contributors | BSD-3-Clause | The compositor and lock screen being themed (window gaps, rounding, gradient borders, blur; lock-screen layout). |

### Themed applications

| Project | License | How it is used |
|---|---|---|
| [**Waybar**](https://github.com/Alexays/Waybar) by Alexays | MIT | The bar. Airy Aurora provides its frosted-pill CSS for both modes and the custom modules. |
| [**SwayNotificationCenter**](https://github.com/ErikReider/SwayNotificationCenter) by Erik Reider | GPL-3.0 | The notification center; its stylesheet is themed. |
| [**rofi**](https://github.com/davatorium/rofi) by Dave Davenport | see project | The launcher; its colors template is themed. |
| [**kitty**](https://github.com/kovidgoyal/kitty) by Kovid Goyal | GPL-3.0 | The terminal; two kitty themes (light and dark) are provided, with a powerline tab bar and a cursor trail. |
| [**wallust**](https://github.com/explosion-mental/wallust) by explosion-mental | MIT | Generates the app color files. Airy Aurora feeds it a fixed color scheme instead of a wallpaper, so the palette stays put. |
| [**cava**](https://github.com/karlstav/cava) by Karl Stavestrand | MIT | The audio visualizer behind the waybar capsule bars. |
| [**playerctl**](https://github.com/altdesktop/playerctl) by Tony Crisci | LGPL-3.0 | Supplies the now-playing title that gets the per-character gradient. |
| [**Starship**](https://github.com/starship/starship) | ISC | Optional: the switch sets its `palette =` line to the matching Airy palette. |
| [**fastfetch**](https://github.com/fastfetch-cli/fastfetch) | MIT | Picks up the rice through the ANSI blue and magenta slots in the kitty themes. |
| [**btop**](https://github.com/aristocratos/btop) by aristocratos | see project | Opened by clicking the CPU / RAM pill. |
| [**Breeze**](https://invent.kde.org/plasma/breeze) GTK theme by the KDE community | see project | Set as the GTK theme (Breeze / Breeze-Dark) under Hyprland. |

### Icons and palette

| Project | License | How it is used |
|---|---|---|
| [**Nordzy**](https://github.com/Fausto-Korpsvart/Nordzy-icon) by Fausto Korpsvart | GPL-3.0 | Optional GTK icon theme (`Nordzy-dark` in dark mode, `Nordzy` in light), selected through gsettings. Not bundled; the user installs it. |
| [**Nord**](https://github.com/nordtheme/nord) by Arctic Ice Studio and the Nord contributors | MIT | The two Nord blues `#5E81AC` and `#81A1C1` color the kanji add-on's glyph icons and inactive workspace numbers. |

### Fonts

| Project | License | How it is used |
|---|---|---|
| [**JetBrains Mono**](https://github.com/JetBrains/JetBrainsMono), patched by [**Nerd Fonts**](https://github.com/ryanoasis/nerd-fonts) | OFL-1.1 (JetBrains Mono); see project (Nerd Fonts) | The terminal and bar font, and the source of the bar's Nerd Font glyph icons. |
| [**Victor Mono**](https://github.com/rubjo/victor-mono) by Rune Bjørnerås | OFL-1.1 | Italics in the terminal. |
| [**Noto Sans CJK JP**](https://github.com/notofonts/noto-cjk) by Google and Adobe | OFL-1.1 | Fallback for the kanji used by the optional add-on. Not bundled. |
| **AiryJP** and **AiryBars** | original | Icon fonts drawn for this project (kanji-style icons, and the 16-level capsule bars). They are built with Inkscape, fontTools, cairosvg and Pillow; the sources are in the Hyprland repo. |

### Data and images

| Source | How it is used |
|---|---|
| [**Open-Meteo**](https://open-meteo.com) (data licensed CC BY 4.0) | KooL's `Weather.py` fetches the forecast shown in the waybar weather module. Weather data by Open-Meteo.com. |
| **Wallpaper** | The screenshots use a photograph whose original source hasn't been identified. It is not included in any repository. If it's your work, please open an issue so it can be credited. |

## Discord theme

| Project | License | How it is used |
|---|---|---|
| [**Vencord**](https://github.com/Vendicated/Vencord) by Vendicated and contributors | GPL-3.0 | Loads the theme and hot-reloads it on save. The theme is a single CSS file written for its theme loader. It is standalone and imports no other theme. |
| **Discord** | proprietary | The client being themed; no affiliation. |
| **Background image** | not recorded | The personal theme uses a picture supplied by its user whose artist wasn't recorded. For that reason the theme file is not published. |

## Development

Written with [Claude Code](https://claude.com/claude-code) by Anthropic, which also appears as co-author on commits.
