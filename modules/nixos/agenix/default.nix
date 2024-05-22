{
  config,
  lib,
  options,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption;
  # inherit (inputs) ragenix;
  inherit (builtins) filter pathExists;
  inherit (lib.attrsets) mapAttrs' nameValuePair;
  inherit (lib.modules) mkDefault;
  inherit (lib.strings) removeSuffix;

  # secretsDir = "${config.snowflake.hostDir}/secrets";
  secretsDir = ../../../secrets;
  secretsFile = "${secretsDir}/secrets.nix";

  cfg = config.mountainous.agenix;
in {
  # imports = [ragenix.nixosModules.default];

  options.mountainous.agenix = {
    enable = mkEnableOption "Whether to enable agenix";
  };

  config = lib.mkIf cfg.enable {
    # environment.systemPackages = [ragenix.packages.x86_64-linux.default];
    age = {
      identityPaths =
        options.age.identityPaths.default
        ++ [
          # TODO: Pull this value from somewhere else in the config
          "/home/simonwjackson/.ssh/agenix"
        ];

      secrets =
        if pathExists secretsFile
        then
          mapAttrs' (n: _:
            nameValuePair (removeSuffix ".age" n) {
              file = "${secretsDir}/${n}";
              group = "users";
              owner = mkDefault config.mountainous.user.name;
            }) (import secretsFile)
        else {};
    };

    # age.identityPaths = options.age.identityPaths.default ++ (filter pathExists [
    #   "${config.user.home}/.ssh/id_ed25519"
    #   "${config.user.home}/.ssh/id_rsa"
    # ]);
  };
}