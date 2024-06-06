{
  config,
  inputs,
  lib,
  modulesPath,
  options,
  pkgs,
  ...
}: let
  inherit (lib.backpacker) enabled disabled;
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  services.joycond.enable = true;

  backpacker = {
    hardware.cpu.type = "amd";
    boot = disabled;
    # gaming = {
    #   core = {
    #     enable = true;
    #     isHost = true;
    #   };
    #   emulation = {
    #     enable = true;
    #     gen-7 = true;
    #     gen-8 = true;
    #   };
    #   steam = enabled;
    # };
    desktops = {
      plasma = {
        enable = true;
        autoLogin = true;
      };
      hyprland = enabled;
    };
    networking.core.names = [
      {
        name = "wifi";
        mac = "fc:b0:de:7e:9f:5d";
      }

      {
        name = "eth";
        mac = "10:7c:61:4d:e4:11";
      }
    ];
    # BUG: ccache broken
    performance = disabled;
    #   syncthing = {
    #     key = config.age.secrets.fiji-syncthing-key.path;
    #     cert = config.age.secrets.fiji-syncthing-cert.path;
    #   };
  };

  # mountainous = {
  #   hardware.devices.samsung-galaxy-book3-360 = enabled;
  # };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
    };
  };
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = ["network.target" "sound.target"];
    wantedBy = ["default.target"];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  };
  services.pipewire.wireplumber.extraConfig = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = ["hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag"];
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    options = ["subvol=root" "compress=zstd" "noatime"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd" "noatime"];
  };

  fileSystems."/snowscape" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    # neededForBoot = false;
    options = ["subvol=snowscape" "compress=zstd" "noatime"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd" "noatime"];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    options = ["subvol=persist" "compress=zstd" "noatime"];
    neededForBoot = true;
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/bae6059a-0fb6-4363-9ada-c3c18c0a48c7";
    fsType = "btrfs";
    options = ["subvol=log" "compress=zstd" "noatime"];
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0DB7-D50C";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/09ded7e9-8687-4e56-a71c-99d24de97ca5";
    }
  ];

  hardware = {
    enableAllFirmware = true;
    cpu = {
      amd = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
    opengl = {
      driSupport = true; # This is already enabled by default
      driSupport32Bit = true; # For 32 bit applications
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };

  boot = {
    extraModulePackages = [];
    initrd = {
      availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "uas" "sd_mod"];
      kernelModules = ["dm-snapshot" "amdgpu"];
      luks = {
        devices = {
          root = {
            device = "/dev/disk/by-uuid/8814fd7c-f350-41de-b205-83feaca5ec41";
            preLVM = true;
          };
        };
      };
    };
    kernelModules = ["kvm-amd"];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        enableCryptodisk = true;
        version = 2;
      };
    };
    supportedFilesystems = ["btrfs"];
  };

  services.xserver.videoDrivers = ["amdgpu"];

  system.stateVersion = "24.05";
}
