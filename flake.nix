{
  description = "Home Manager configuration of kabir";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland?submodules=1&ref=v0.51.0";
    hy3 = {
        url = "github:outfoxxed/hy3?ref=hl0.51.0";
        inputs.hyprland.follows = "hyprland";
    };

    # Misc
    isd.url = "github:isd-project/isd";

    # Nixvim
    nixvim = {
        url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.kabir-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
        ];
      };
      homeConfigurations = {
        kabir = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix nixvim.homeModules.nixvim ];

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
