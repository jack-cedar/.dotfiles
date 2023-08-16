{pkgs, inputs, ...}:
with pkgs; [
  (opera.override { proprietaryCodecs = true; })
  (nerdfonts.override {fonts = ["Iosevka"];})  
  (python3.withPackages (p: with p; [ epc orjson six pip future ]))
  gcc
  noto-fonts
  fira-code
  noto-fonts-cjk
  ipafont
  babashka
  cider
  xboxdrv
  sqlite
  flameshot
  go
  gopls

  helix
  odin
  ols
  pkg-config
  zeromq
  libsodium
  glfw
  firefox
  
  # np2kai
  pass
  microsoft-edge
  dunst
  udiskie
  polybar
  gnumake
  sqlc

  inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin

  #inputs.nix-gaming.packages.${pkgs.system}.wine-ge
  
  gimp
  unrar
  direnv
  nix-direnv
  rust-analyzer 
  cargo 
  
  scrot

  xclip
  xdotool
  xorg.xprop
  xorg.xwininfo
  protonup-ng

  xdg-utils
  xdg-desktop-portal-gtk
  xdg-launch
  alacritty
  btop
  

  networkmanagerapplet

  haskell-language-server
  
  
  opentabletdriver
  discord
  unzip
  steam-run
  pciutils
  libtool
  prismlauncher
  lemonbar-xft

]
