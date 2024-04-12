{

    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, home-manager, ... }: 
    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            hryu = lib.nixosSystem {
                inherit system;
                modules = [./nixos/configuration.nix];
            };
        };
        homeConfigurations = {
            hryu = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [./home/home.nix];
            };
        };
    };
    
}