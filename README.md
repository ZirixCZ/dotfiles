# Hello :wave:
### Welcome to the .files - the folder-y place where everything is perfectly configured to file your needs.
Feel free to take what you need, and if you have any questions, don't be shy to open an issue or drop me an email.

# Overview
The [/rices](https://github.com/ZirixCZ/dotfiles/tree/main/rices) directory includes my past rices that I no longer use. [/config](https://github.com/ZirixCZ/dotfiles/tree/main/config) contains the current `~/.config` directory on my machine.

# Getting started
So you've decided to give it a shot, heh? Let's do it then! I'll do a little rundown of the things that I use ^^ Oh and by the way, do not erase any configs from your machine! The easiest thing you can do is `mv` instead of `rm` to test things out!

##### Terminal emulator
I just like Alacritty. Install it for your machine and copy the [alacritty.toml](https://github.com/ZirixCZ/dotfiles/blob/main/config/alacritty/alacritty.toml) from my config. You'll want to tweak the settings a bit to match your likings. [Mainly the decorations](https://alacritty.org/config-alacritty.html).

##### Text editor 
By the way, I use Neovim. Oh and I also use this: [LazyVim](https://www.lazyvim.org/) since it suits my laziness perfectly,....... 🐈.. If you meet the requirements [mentioned here](https://www.lazyvim.org/#%EF%B8%8F-requirements) it should work as a piece of cake. I'm using a Github copilot plugin that you can setup with `:Copilot setup`. You can also use a different color scheme by doing 

```lua
{
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },

{
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox", // example
    },
  },
```

##### Window Manager
This is the thing that makes your computer actually usable (especially when on a mac). Really, how else would you ever manage windows? My WM of choice is `yabai`. It is not like there is no other choice on MacOS. Anyways, if you're on MacOS you'll need to [install yabai](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)) and also [install skhd](https://github.com/koekeishiya/skhd). Just go ahead and read their installation instructions, install everything needed, disable SIP and come back for the configs!
If you're on Linux, there's a few WM's that behave similarly. I like to use [i3](https://i3wm.org/docs/), but there's an alternative for Wayland called [sway](https://swaywm.org/).

##### Background image 
You can find background images inside of [/config](https://github.com/ZirixCZ/dotfiles/tree/main/config).

# Rices that I've done in the past

## TokyoNight
![tokyonightscreenshot1](https://user-images.githubusercontent.com/49836430/226100248-3870901e-1172-459f-a6dc-d02800d616f4.png)

## GlossyNeon
![unixpornscreenshot1](https://user-images.githubusercontent.com/49836430/226100223-93c731f7-4431-4ea7-ab75-95c5453c1609.png)

## RosePine
![rofi](https://user-images.githubusercontent.com/49836430/226100276-822f3179-dadf-436d-8ad7-57ddc6dfcdc7.png)
![tux](https://user-images.githubusercontent.com/49836430/226100278-6c976451-cf7c-41fe-8917-cf9cfa9eb36d.png)
![vscode](https://user-images.githubusercontent.com/49836430/226100279-d09922e1-30eb-44ee-8df4-19b587e6086e.png)

## DarkSouthPark
<img src="https://user-images.githubusercontent.com/49836430/151813053-c85e0a12-911e-4e47-a508-0f425f0f3dc7.png">
