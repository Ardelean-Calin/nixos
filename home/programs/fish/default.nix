{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      ${pkgs.starship}/bin/starship init fish | source
      ${pkgs.zoxide}/bin/zoxide init fish | source
    '';
    functions = {
      tmp = {
        description = "Create a temporary directory and navigate to it.";
        body = "cd (mktemp -d)";
      };
    };
    shellAliases = {
      man = "${pkgs.bat-extras.batman}/bin/batman";
    };
  };
}
