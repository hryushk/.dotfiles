{ config, pkgs, ... }:

{

  imports = [ ./hyprland ./kitty ./dunst ./waybar ./tofi ./firefox ./vscodium ./neovim ./ags ];  

  home.username = "hryu";
  home.homeDirectory = "/home/hryu";

  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName  = "hryushk";
    userEmail = "wcaofow@tuta.io";
  };

  home.packages = with pkgs; [
    # Default packages.
    wget
    vesktop
    telegram-desktop
    tor-browser
    steam
    libva 
    transmission-gtk
    lutris
    wineWowPackages.waylandFull
    gamemode
    mangohud
    goverlay
    pinta

    # Gnome packages.
    evince
    gnome.eog
    gnome.file-roller
    gnome.simple-scan
    gnome-text-editor
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.totem
    gnome.gnome-tweaks
    polkit_gnome
    gnome.gnome-keyring

    # Work.
    github-desktop
    libreoffice
    gimp
    python3
    logseq 

    # Utils.
    libsecret
    brightnessctl
    pavucontrol
    wireplumber
    glib
    xorg.xwininfo
    openssl
    ventoy-full

    # Fonts. 
    cascadia-code
    nerdfonts

    # OBS-Studio
    obs-studio
    obs-studio-plugins.obs-vaapi

    minecraft
  ];

  home.file = {};

  home.sessionVariables = {};

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;
    theme = {      
      name = "vimix-dark-grey";
      package = pkgs.vimix-gtk-themes.override {
        themeVariants = [ "grey" ];
        colorVariants = [ "dark" ];
        tweaks = [ "grey" ];
      };
    };

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Black-Dark";
    };

    gtk3.extraConfig = {
      gtk-decoration-layout = "appmenu:none"; 
    };

    gtk4.extraConfig = {
      gtk-decoration-layout = "appmenu:none";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS-Monterey";
    size = 24;
  };

  programs.home-manager.enable = true;

}
