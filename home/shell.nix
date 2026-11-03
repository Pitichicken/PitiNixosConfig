{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";

      rebuild = "/etc/nixos/rebuild-push.sh";
      update = "sudo nix flake update --flake /etc/nixos";
      nix-clean = "sudo nix-collect-garbage -d";
    };
  };
}
