{ lib, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix> ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  # 導入時の必要性が未確認のため維持。変更前に GRUB の配置を確認する。
  boot.loader.grub.forceInstall = true;

  hardware.cpu.intel.updateMicrocode = true;

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sr_mod"
    "rtsx_pci_sdmmc"
  ];
  boot.kernelParams = [
    "usbcore.autosuspend=-1"
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e2fadb96-4a7e-4d0c-910d-398a1f08d28e";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1d3bb1fd-0995-48ce-a99f-1bf771e30827";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/a44b9c72-b7a3-4205-8137-0fccc26fcaf8"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware.bluetooth.enable = true;

}
