{
  config,
  pkgs,
  unstablePkgs,
  ...
}: {
  imports = [
    ./programs
  ];

  home.username = "calin";
  home.homeDirectory = "/home/calin";

  fonts.fontconfig.enable = true;

  gtk.enable = true;

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 32;
    gtk.enable = true;
  };

  home.packages = [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    # XCURSOR_SIZE = "32";
  };

  programs = {
    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
    };

    zellij = {
      enable = true;
      settings = {
        default_shell = "fish";
      };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  dconf = {
    settings = {
      "org/gnome/mutter" = {
        experimental-features = ["variable-refresh-rate"];
      };
    };
  };

  programs.home-manager.enable = true;

  home.stateVersion = "23.11"; # Please read the comment before changing.
}
