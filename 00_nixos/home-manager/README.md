# home-manager Configuration

Ce dépôt contient ma configuration [home-manager](https://github.com/nix-community/home-manager) personnelle,
gérant mes outils CLI, mon éditeur et mon environnement de développement de manière déclarative sur Nix.

## Structure du projet

```text
.
├── default.nix            # Point d'entrée principal (imports et packages globaux)
└── config/                # Modules de configuration spécifiques
    ├── bash.nix           # Alias et configuration shell
    ├── cli.nix            # CLI personnalisée q-sw
    ├── dconf.nix          # Paramètres GNOME/GSettings
    ├── firefox.nix        # Configuration Firefox (bookmarks, extensions)
    ├── gemini.nix         # Gemini CLI (build personnalisé)
    ├── ghostty.nix        # Émulateur de terminal Ghostty
    ├── git.nix            # Identité et préférences Git
    ├── neovim.nix         # Configuration Lua pour Neovim (./nvim/)
    ├── opencode.nix       # Configuration pour OpenCode / VS Code Open Source
    ├── tmux.nix           # Multiplexeur de terminaux
    └── vscode.nix         # Configuration VS Code (extensions, settings)
```

## Outils inclus

La configuration installe une suite d'outils essentiels :

- **Cloud & Infra** : Terraform, Kubernetes (kubectl, helm, kubectx), Google Cloud SDK, Ansible, Cilium,
  Google Chrome, Podman, Kind.
- **Développement** : Go, GnuMake, Nixpkgs-fmt, nixd, Python3.
- **Productivité** : Fzf, Ripgrep, Lazygit, Htop, Tree, Gh.

## Gemini CLI

Une configuration spéciale est incluse pour `gemini-cli` v0.38.1, compilant l'outil
depuis sa source GitHub avec les dépendances nécessaires (libsecret).

## Installation

Pour appliquer cette configuration :

```bash
home-manager switch --flake .
```
