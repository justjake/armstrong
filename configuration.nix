{ config, pkgs, ... }:

{
/* this was the only thing here when we started: I suspect this loads the
 * defaults for the Virtualbox system */
  imports = [ <nixpkgs/nixos/modules/virtualisation/virtualbox-image.nix> ];

  /* enable ZSH as the default shell for all users, and use it for myself (jitl) */
  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  /* user: jitl */
  users.mutableUsers = true;
  users.extraUsers.jitl = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/zsh";
    home = "/home/jitl";
    description = "Jake Teton-Landis";
    extraGroups = [ "wheel" "networkmanager" ];
    /* TODO: generate with `mkpasswd -m sha-512` */
    initialPassword = "demo2";
  };

  /* install some packages that I want to use */
  environment.systemPackages = [
    pkgs.vim
    pkgs.tmux
    pkgs.git
  ];

  /* enable gui */
  services.xserver.enable = true;
  /* disabled due to derp -- start with the EASY one... services.xserver.windowManager.i3.enable = true; */
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.desktopManager.kde5.enable = false;
  services.xserver.windowManager.openbox.enable = true;
}
