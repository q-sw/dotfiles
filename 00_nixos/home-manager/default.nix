{ pkgs, ... }: {
  imports = [
    ./config/tmux.nix
    ./config/ghostty.nix
    ./config/bash.nix
    ./config/neovim.nix
    ./config/opencode.nix
    ./config/vscode.nix
    ./config/dconf.nix
    ./config/git.nix
    ./config/gemini.nix
    ./config/firefox.nix
    ./config/cli.nix
  ];
  home.packages = with pkgs; [
    ansible
    cilium-cli
    fzf
    gh
    gnumake
    go
    google-cloud-sdk
    google-chrome
    kind
    htop
    kubernetes-helm
    kubectl
    kubectx
    lazygit
    nixd
    nixpkgs-fmt
    podman
    python3
    ripgrep
    terraform
    tree
    unzip
    xclip
    # LSP servers for VSCode
    gopls
    pyright
    nodePackages.bash-language-server
    yaml-language-server
    terraform-ls
    nodePackages.prettier
  ];

  home.stateVersion = "25.11";
}
