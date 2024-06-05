{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Ardelean Calin";
    userEmail = "9417983+Ardelean-Calin@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      rerere.enabled = true;
      diff.algorithm = "histogram";
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
