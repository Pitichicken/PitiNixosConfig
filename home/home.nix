{ pkgs, ... }:

{
  home.username = "pitichicken";
  home.homeDirectory = "/home/pitichicken";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    wget
    tree
    man
    vim
    zip
    unzip

    firefox
    vscode
    kitty
    pavucontrol
    flameshot
    brightnessctl


    git
    nodejs_22
    dotnetCorePackages.sdk_8_0
    powershell
    libsecret
  ];

  imports = [
    ./alacritty.nix
    ./git.nix
    ./shell.nix
  ];
}
