{ config, pkgs, ... }:

{

  imports = [ ./hyprland ./kitty ./dunst ];  

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
    wineWowPackages.waylandFull
    gamemode
    mangohud
    goverlay
    pinta

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
    networkmanagerapplet
    jq
    socat
    gojq
    acpi
    xorg.xwininfo
    openssl

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
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS-Monterey";
    size = 24;
  };

  programs.home-manager.enable = true;

}
