{
  config,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "kitty";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
