{ pkgs, lib, ... }:

{
  imports = [
    ../modules/tailscale.nix
  ];

  networking.useDHCP = lib.mkDefault false;
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  security.sudo.wheelNeedsPassword = false;
  services.automatic-timezoned.enable = true;
  services.gpm.enable = true; # TTY mouse
  system.copySystemConfiguration = true;
  users.defaultUserShell = pkgs.zsh;

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = lib.mkDefault "Lat2-Terminus16";
    keyMap = "us";
  };

  environment.systemPackages = with pkgs; [
    # Other
    wget
    git
    w3m
    ripgrep
    tmux
    lf
    _1password
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

  services.flatpak.enable = true;
  services.dbus.packages = [
    (pkgs.writeTextFile {
      name = "dbus-monitor-policy";
      text = ''
        <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
          "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
        <busconfig>
          <policy user="simonwjackson">
            <allow send_destination="org.freedesktop.DBus" send_interface="org.freedesktop.DBus.Monitoring" />
            <allow send_type="method_call" send_interface="org.freedesktop.DBus.Monitoring"/>
            <allow send_type="signal" send_interface="org.freedesktop.DBus.Properties" send_member="PropertiesChanged" send_path="/org/bluez"/>
          </policy>
        </busconfig>
      '';
      destination = "/etc/dbus-1/system.d/dbus-monitor-policy.conf";
    })
  ];
}