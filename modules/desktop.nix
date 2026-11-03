{ config, pkgs, ... }:

let
  xsessionWrapper = pkgs.writeShellScriptBin "xsession-wrapper" ''
    exec ${pkgs.xinit}/bin/startx "$@" -- -config /etc/X11/xorg.conf
  '';
in
{

  services.xserver = {
    enable = true;

    windowManager.i3.enable = true;

    xkb = {
      layout = "fr";
      variant = "";
    };
  };
  services.xserver.exportConfiguration = true;
  services.libinput.enable = true;


  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };


  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };



  services.displayManager.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --time \
            --remember \
            --remember-session \
            --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
            --xsessions ${config.services.displayManager.sessionData.desktops}/share/xsessions \
            --xsession-wrapper "${xsessionWrapper}/bin/xsession-wrapper"
        '';
        user = "greeter";
      };
    };
  };


  environment.systemPackages = with pkgs; [
    xinit
    xf86inputlibinput
    xev
    dmenu
  ];


  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
