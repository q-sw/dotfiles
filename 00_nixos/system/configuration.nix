{pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./../lenovo/hardware-configuration.nix
            ./../lenovo/pam_configuration.nix
        ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "home";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver = {
        enable = true;
        windowManager.i3.enable = true;
    };
    services.displayManager = {
        defaultSession = "none+i3";
    };

    # Enable the GNOME Desktop Environment.
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "fr";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "fr";

    # Enable CUPS to print documents.
    services.printing.enable = true;


    # Enable sound
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;
    hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
    security.rtkit.enable = true;
    security.polkit.enable = true;
    services.pipewire = {
        enable = false;
        alsa.enable = false;
        alsa.support32Bit = false;
        pulse.enable = false;
        jack.enable = false;
    };


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.quentin = {
        isNormalUser = true;
        description = "quentin";
        extraGroups = [ "networkmanager" "wheel" "docker" "plugdev" ];
        packages = with pkgs; [
        ];
        shell = pkgs.zsh;
    };


    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system

    programs.firefox.enable = true;
    programs.zsh.enable = true;
    environment.systemPackages = with pkgs;[
        vim
        wget
        home-manager
        pulseaudioFull
        google-chrome
        nautilus
        geeqie
        fwupd
        usbutils
        fprintd
    ];

    # List services that you want to enable:
    services.openssh.enable = true;
    services.gnome.gnome-keyring.enable = true;

    # Virtualization
    virtualisation.docker= {
        enable = true;
    };

    # Update management
    system.autoUpgrade.enable = true;
    system.autoUpgrade.dates = "weekly";
    nix.gc.automatic = true;
    nix.gc.dates = "daily";
    nix.gc.options = "--delete-older-than 10d";
    nix.settings.auto-optimise-store = true;

    system.stateVersion = "24.11"; # Did you read the comment?
}
