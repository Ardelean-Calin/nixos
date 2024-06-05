{
  description = "Home-Manager configuration using flakes";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11"; # Example for the 23.05 stable release
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs = {
    self,
    nixpkgs-stable,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    system = "x86_64-linux"; # Change this to match your system architecture
  in {
    homeConfigurations = {
      calin = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs-stable {
          system = system;
        };
        extraSpecialArgs = {
          unstablePkgs = import nixpkgs-unstable {
            inherit system;
          };
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
