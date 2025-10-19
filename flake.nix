{
  description = "Home Manager configuration of kabir";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim = {
        url = "github:nix-community/nixvim";
    };

    catppuccin = {
        url = "github:catppuccin/nix";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, catppuccin, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.kabir-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          catppuccin.nixosModules.catppuccin
        ];
      };
      homeConfigurations = {
        kabir = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix
            nixvim.homeModules.nixvim
            catppuccin.homeModules.catppuccin
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
	      extraSpecialArgs = { inherit inputs; };
        };
        work = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./work.nix ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
	      extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
