
{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/desktop.nix
    ./modules/nvidia.nix
    ./modules/virtualization.nix
    ./modules/hardware.nix
  ];

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 2;
  };

  environment.systemPackages = [
    pkgs.sbctl
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Bangkok";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  console.keyMap = "fr";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  users.users.pitichicken = {
    isNormalUser = true;
    description = "Paul Ravoux";

    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "libvirtd"
      "kvm"
    ];
  };

  programs.nix-ld.enable = true;

  boot.kernel.sysctl."kernel.yama.ptrace_scope" = 0;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.pitichicken = import ./home/home.nix;

  system.stateVersion = "26.05";
}

