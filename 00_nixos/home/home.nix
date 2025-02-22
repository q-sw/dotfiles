{ config, pkgs, ... }:

{
  imports = [
	./neovim.nix
	./alacritty.nix
	./zsh.nix
	./tmux.nix
	./git.nix
	./vscode.nix
  ];
  home.username = "quentin";
  home.homeDirectory = "/home/quentin";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bitwarden-desktop
    bluez
    blueberry
    brave
    docker
    dmenu
    fzf
    go
    google-cloud-sdk
    i3status
    kubernetes-helm
    lazygit
    packer
    pulseaudioFull
    python3Full
    ripgrep
    rofi
    tailscale
    terraform
    tree
    xclip
    wl-clipboard
    nerdfonts
    unzip
    yazi
    whatsapp-for-linux

    #LSP Server
    lua-language-server
    gopls
    dockerfile-language-server-nodejs
    cmake-language-server
    nixd
    pyright
  ];


  programs.home-manager.enable = true;
}
