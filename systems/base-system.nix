{config, pkgs, inputs, ...}:
{
  # Networking
  networking = {
    hostName = "jcedar";
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Locales
  i18n.defaultLocale = "en_US.UTF-8";
  
  time.timeZone = "America/Vancouver";

  # Base User
  users.users = {
    jack = {
      isNormalUser = true;
      description = "Jack Cedar";
      extraGroups = ["networkmanager" "wheel" "video" "audio"];
    };};

  # System Packages 
  environment.systemPackages  = with pkgs; [
    git
    vim
    curl
    emacs29
  ];

  # Services
 
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  
  #Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";


  # BIOS Specific Setting
  boot.loader.grub.device = "/dev/sda";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";
}


