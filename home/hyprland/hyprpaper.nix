{ pkgs, config, ... }:

{

    home.packages = with pkgs; [ hyprpaper ];

    xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ~/.dotfiles/home/hyprland/wallpapers/1.png
    wallpaper = ,~/.dotfiles/home/hyprland/wallpapers/1.png
    splash = false
    ipc = true

    '';

}
