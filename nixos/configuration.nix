{ config, pkgs, ... }:

{

  imports = [ ./additional-configuration.nix ./hardware-configuration.nix ./greetd.nix ];

  # Enable latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking.
  networking.hostName = "hryu";
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "Europe/Moscow";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # User account.
  users.users.hryu = {
    isNormalUser = true;
    description = "hryu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nix = {
  settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system.stateVersion = "23.11"; 

}
