{ pkgs, ... }:

let
  wifi = {
    mac = "bc:d0:74:52:86:18";
    name = "wifi";
  };

in
{
  imports = [
    ../modules/hidpi.nix
    ../profiles/_common.nix
    ../profiles/audio.nix
    ../profiles/gui
    ../profiles/laptop.nix
    ../profiles/workstation.nix
  ];

  networking.hostName = "ushiro"; # Define your hostname.

  services.udev.extraRules = ''
    KERNEL=="wlan*", ATTR{address}=="${wifi.mac}", NAME = "${wifi.name}"
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
  '';

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    cryptsetup
    fuse3 # for nofail option on mergerfs (fuse defaults to fuse2)
    mergerfs
    mergerfs-tools
    nfs-utils
  ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/d7028fc7-5930-45f4-8fbd-acbecd278703";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/0FA3-0EF8";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wifi.useDHCP = lib.mkDefault true;

  services.syncthing = {
    dataDir = "/home/simonwjackson"; # Default folder for new synced folders

    folders = {
      documents.path = "/home/simonwjackson/documents";
      code.path = "/home/simonwjackson/code";
      music.path = "/run/media/simonwjackson/microsd/music";

      documents.devices = [ "kuro" "unzen" "ushiro" "raiden" ];
      music.devices = [ "unzen" "ushiro" ];
      code.devices = [ "unzen" "ushiro" "raiden" ];
    };
  };

  system.stateVersion = "23.05";
}
