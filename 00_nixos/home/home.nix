{pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./i3.nix
    ./neovim.nix
    ./rclone.nix
    ./tmux.nix
    ./tools.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.username = "quentin";
  home.homeDirectory = "/home/quentin";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;[
    alacritty-theme
    bitwarden-desktop
    brightnessctl
    discord
    feh
    fzf
    go
    google-cloud-sdk
    gnumake
    htop
    kubernetes-helm
    kubectl
    kubectx
    lazygit
    packer
    python3Full
    obsidian
    rclone
    rclone-browser
    ripgrep
    rofi
    tailscale
    terraform
    tree
    xclip
    wl-clipboard
    nerdfonts
    unzip

    # I3
    dmenu
    i3lock
    xautolock

    #LSP Server
    lua-language-server
    gopls
    dockerfile-language-server-nodejs
    cmake-language-server
    nixd
    pyright
  ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
