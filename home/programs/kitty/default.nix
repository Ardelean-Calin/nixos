{
  config,
  pkgs,
  unstablePkgs,
  ...
}: {
  programs.kitty = {
    enable = true;
    package = unstablePkgs.kitty;
    font = {
      name = "JetBrainsMono";
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      size = 13;
    };
    settings = {
      shell = "fish";
      window_padding_width = 2;
    };
    shellIntegration.enableFishIntegration = true;
  };
}
