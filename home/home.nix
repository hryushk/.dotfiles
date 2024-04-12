{ config, pkgs, ... }:

{

  imports = [
    ./hyprland
  ];

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
    vscodium
    kitty
    tofi
    firefox
    vesktop
    telegram-desktop
    eww # temporary
    tor-browser
    steam
    obs-studio
    obs-studio-plugins.obs-vaapi
    libva 
    transmission-gtk
    lutris
    gamemode
    mangohud
    goverlay
    pinta
    dunst

    # Gnome packages.
    gnome.nautilus
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
    gnome.seahorse

    # Work.
    github-desktop
    libreoffice
    gimp
    python3

    # Utils.
    libsecret
    brightnessctl
    pavucontrol
    wireplumber
    glib
    networkmanagerapplet
    jq
    socat
    gojq
    acpi
    xorg.xwininfo

    # Fonts. 
    cascadia-code
    nerdfonts
  ];

  home.file = {};

  home.sessionVariables = {};

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "gtk2";
  };

  gtk = {
    enable = true;
    theme = {      
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme.override {
        themeVariants = [ "default" ];
        colorVariants = [ "dark" ];
        tweaks = [ "float" ];
      };
    };

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Black-Dark";
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
