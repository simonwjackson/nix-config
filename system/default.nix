{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  imports = [
    ../packages/ex
    ../packages/clockify-cli
  ];

  # Enable the X11 windowing system.
  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome.enable = true;

  networking.networkmanager.enable = true;
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault false;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = lib.mkDefault "Lat2-Terminus16";
    keyMap = "us";
  };

  security.sudo.wheelNeedsPassword = false;

  users.defaultUserShell = pkgs.zsh;
  users.users.simonwjackson = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "adbusers"
      "wheel"
    ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  #environment.variables.EDITOR = "nvim";
  #programs.neovim.enable = true;
  #programs.neovim.viAlias = true;
  environment.systemPackages = with pkgs; [
    # Other
    wget
    git
    w3m
    ripgrep
    tmux
    lf
    _1password
    # obsidian
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "no";
    extraConfig = ''
      #PubkeyAcceptedKeyTypes ssh-rsa
    '';
  };

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # programs.ssh.hostKeyAlgorithms = [ "ssh-ed25519" "ssh-rsa" ];
  # programs.ssh.pubkeyAcceptedKeyTypes = [ "ssh-rsa" ];

  system.stateVersion = "22.05";
}
