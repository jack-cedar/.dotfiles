{pkgs, lib, config, ...}:
rec {
  base = import ./base-system.nix { inherit config, pkgs }
  laptop = import ./laptop.nix { inherit config, lib, pkgs }
}
