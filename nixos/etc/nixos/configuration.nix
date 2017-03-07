{ config, pkgs, ... };

{
  #TODO change this
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];
  programs.bash.enableCompletion = true;
  system.autoUpgrade.enable = true;
  environment.systemPackages = [
    pkgs.qemu
    pkgs.virtmanager
    # libvirt-omvf
    # see https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF
  ];
  boot.kernelParameters = ["intel_iommu=on"]
  boot.initrd.kernelModules = ["vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd"]
  # TODO: check pci-IDs
  boot.extraModprobeConfig = "options vfio-pci ids=1002:aac8,1002:f88b"

}
