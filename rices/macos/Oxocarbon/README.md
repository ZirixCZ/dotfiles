### Oxocarbon

> MacOs rice utilizing the yabai tiling window manager, sketchybar, wezterm and various terminal utilities.

#### Setup

I haven't made any install scripts for this rice. So I'll just briefly describe what I use to make this rice happen.

You can take any of these folders and plop them into your `~/.config` directory and considering you've got the software installed, it should work without problems. If encounter any, don't be afraid to raise an issue.

For this rice I am using yabai as the window manager of choice. You can install it via the brew package manager. It then reads configuration from `~/.config/yabai/yabairc`. You can get [my yabai configuration here](https://github.com/ZirixCZ/dotfiles/tree/main/rices/macos/Oxocarbon/yabai). For yabai to work properly, you also need to install skhd that reads from `~/.config/skhd/skhdrc`. If you copy my yabai config, it might throw errors concerning `sketchybar` or `borders`. Please read the documentation on yabai, yabai borders and sketchybar. My sketchybar configuration for this rice [lies here](https://github.com/ZirixCZ/dotfiles/tree/main/rices/macos/Oxocarbon/sketchybar). You can again just copy it over to `~/.config`.

The terminal emulator of choice this time is wezterm. I usually use alacritty, but chose wezterm due to the ability to render media within itself. [This is the wezterm configuration](https://github.com/ZirixCZ/dotfiles/tree/main/rices/macos/Oxocarbon/wezterm) be sure to adjust the dpi to match your display's DPI, or remove it from the config alltogether. On startup I've also added `fastfetch` to `~/.zshrc` to display info.

I am also including the current state of my neovim config for those interested in that.

# Showcase

<img width="1680" alt="Screenshot 2024-07-21 at 0 16 44" src="https://github.com/user-attachments/assets/cf982eda-8510-4d19-be8c-a78122a9404b">
