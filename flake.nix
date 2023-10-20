{
  description = "My NixOS configuration";

  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # Nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    hardware.url = "github:nixos/nixos-hardware";
    nix-colors.url = "github:misterio77/nix-colors";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { agenix, self, nixpkgs, home-manager, hardware, nix-darwin, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
      rootPath = ./.;
    in
    {
      inherit lib;

      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./nixos/modules;

      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./home-manager/modules;

      # Your custom packages and modifications, exported as overlays
      overlays = import ./nix/overlays { inherit inputs outputs; };

      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forEachSystem (pkgs: import ./nix/pkgs { inherit pkgs; });

      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });

      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild <action> --flake .#your-hostname'
      nixosConfigurations = {
        # Main desktop
        fiji = lib.nixosSystem {
          modules = [
            ./nixos/hosts/fiji
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.simonwjackson = import ./home-manager/users/simonwjackson/hosts/fiji;
              home-manager.extraSpecialArgs = { inherit inputs outputs rootPath; };
            }
          ];
          specialArgs = { inherit inputs outputs rootPath; };
        };

        # Remote Server
        yabashi = lib.nixosSystem {
          modules = [
            ./nixos/hosts/yabashi
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.simonwjackson = import ./home-manager/users/simonwjackson/hosts/yabashi;
              home-manager.extraSpecialArgs = { inherit inputs outputs rootPath; };
            }
          ];
          specialArgs = { inherit inputs outputs rootPath; };
        };

        # Home Server
        unzen = lib.nixosSystem {
          modules = [
            ./nixos/hosts/unzen
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.simonwjackson = import ./home-manager/users/simonwjackson/hosts/unzen;
              home-manager.extraSpecialArgs = { inherit inputs outputs rootPath; };
            }
          ];
          specialArgs = { inherit inputs outputs rootPath; };
        };

        # router
        rakku = lib.nixosSystem {
          modules = [
            ./nixos/hosts/rakku
            agenix.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.users.simonwjackson = import ./home-manager/users/simonwjackson/hosts/rakku;
              home-manager.extraSpecialArgs = { inherit inputs outputs rootPath; };
            }
          ];
          specialArgs = { inherit inputs outputs rootPath; };
        };

        # portable gaming rig
        zao = lib.nixosSystem {
          modules = [
            ./nixos/hosts/zao
            agenix.nixosModules.default
            hardware.nixosModules.dell-xps-17-9700-nvidia
            home-manager.nixosModules.home-manager
            {
              home-manager.users.simonwjackson = import ./home-manager/users/simonwjackson/hosts/zao;
              home-manager.extraSpecialArgs = { inherit inputs outputs rootPath; };
            }
          ];
          specialArgs = { inherit inputs outputs rootPath; };
        };
      };

      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#WASHQY21TFPM6GQ
      darwinConfigurations."WASHQY21TFPM6GQ" = nix-darwin.lib.darwinSystem {
        modules = [
          ./nix-darwin/hosts/WASHQY21TFPM6GQ
          home-manager.darwinModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            # home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs outputs rootPath self; };

            home-manager.users.sjackson217 = import ./home-manager/users/simonwjackson/hosts/WASHQY21TFPM6GQ;
          }
        ];
      };
      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations."WASHQY21TFPM6GQ".pkgs;


      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager <action> --flake .#simonwjackson'
      # homeConfigurations = {
      #   # Desktops
      #   "simonwjackson@fiji" = lib.homeManagerConfiguration {
      #     modules = [
      #       ./home-manager/users/simonwjackson/hosts/fiji
      #       agenix.homeManagerModules.age
      #     ];
      #     pkgs = pkgsFor.x86_64-linux // outputs.packages;
      #     extraSpecialArgs = { inherit inputs outputs; };
      #   };
      # };
    };
}
