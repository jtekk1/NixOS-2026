{ config, lib, pkgs, ... }:

{
  # Enable hardware support for ZSA keyboards
  hardware.keyboard.zsa.enable = true;

  # Additional udev rules for ZSA keyboards (if the hardware module doesn't cover everything)
  services.udev.extraRules = ''
    # Rules for Oryx web flashing and live training
    KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", TAG+="uaccess"

    # Live training rules for the Voyager (udev)
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1977", TAG+="uaccess"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1976", TAG+="uaccess"

    # Live training rules for the Voyager (hidraw)
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1977", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1976", TAG+="uaccess"

    # Rules for all ZSA keyboards (Moonlander, Ergodox EZ, Planck EZ)
    # Moonlander
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1969", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="3297", ATTRS{idProduct}=="1969", TAG+="uaccess"

    # Ergodox EZ
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="feed", ATTRS{idProduct}=="1307", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="feed", ATTRS{idProduct}=="1307", TAG+="uaccess"

    # Planck EZ
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="feed", ATTRS{idProduct}=="6060", TAG+="uaccess"
    KERNEL=="hidraw*", ATTRS{idVendor}=="feed", ATTRS{idProduct}=="6060", TAG+="uaccess"

    # STM32 bootloader for flashing
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", TAG+="uaccess"
  '';

  # Create plugdev group and add your user to it
  users.groups.plugdev = {}; 
  users.users.jtekk = { extraGroups = [ "plugdev" ]; };
}
