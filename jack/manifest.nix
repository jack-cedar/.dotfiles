{pkgs, inputs, ...}:
with pkgs;
let
  osu-lazer-b = pkgs.osu-lazer-bin.override { version = "2024.521.2"; };
 
  
in 
[
  openmw
  odin ols
  thunderbird
  vlc

  mullvad-vpn
  

  easyeffects
  pkgs.dconf
  qbittorrent

  alsa-utils

 
  gcc
 
  pavucontrol
  cider
  sqlite
  flameshot
  portmod
  
  
  
  ripgrep
  stack
  ghc
  nixd
  
  
  texlive.combined.scheme-full
  pandoc

  arandr
  acpi
  go
  gopls

  
  pkg-config
  glfw
  firefox
  
    microsoft-edge
  dunst
  udiskie
  
  

 inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
 # inputs.nix-gaming.packages.${pkgs.system}.osu-stable
  
  gimp
  unrar
  direnv
  nix-direnv
  xclip
  xdotool
  xorg.xprop
  xorg.xwininfo
  protonup-ng

 
  alacritty
  btop

  bat

  networkmanagerapplet

 
  
  
  opentabletdriver
  discord
  unzip
  steam-run
  pciutils
  libtool
  prismlauncher
  lemonbar-xft

]
