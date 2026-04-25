{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.override {
      commandLineArgs = [ "--password-store=basic" ];
    };
    profiles.default.extensions = with pkgs.vscode-extensions; [
      yzhang.markdown-all-in-one
      bierner.markdown-mermaid
      redhat.vscode-yaml
      asvetliakov.vscode-neovim
      ms-vscode.makefile-tools
      ms-vscode.cmake-tools
      mads-hartmann.bash-ide-vscode
      foxundermoon.shell-format
      #elagil.pre-commit-helper
      alefragnani.project-manager
      github.github-vscode-theme
      eamodio.gitlens
      christian-kohler.path-intellisense
      ms-kubernetes-tools.vscode-kubernetes-tools
      hashicorp.terraform
      ms-azuretools.vscode-docker
      redhat.ansible
      ms-python.python
      ms-python.vscode-pylance
      ms-python.black-formatter
      golang.go
      jnoortheen.nix-ide
      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode-remote.remote-ssh
    ];
    profiles.default.userSettings = {
      "editor.rulers" = [ 80 ];
      "editor.fontSize" = 12;
      "editor.fontFamily" =
        "'Fira Code', 'Droid Sans Mono', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
      "window.autoDetectColorScheme" = true;
      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";
      "window.dialogStyle" = "custom";
      "workbench.activityBar.location" = "default";
      "workbench.layoutControl.enabled" = false;
      "github.copilot.chat.welcomeMessage" = "never";
      "github.copilot.chat.enabled" = false;
      "github.copilot.editor.enableAutoCompletions" = true;
      "workbench.startupEditor" = "none";
      "workbench.tips.enabled" = false;
      "workbench.welcomePage.walkthroughs.openOnInstall" = false;
      "chat.editor.initialCodeAction" = "none";
      "workbench.preferredDarkColorTheme" = "GitHub Dark Dimmed";
      "workbench.preferredLightColorTheme" = "GitHub Light";
      "workbench.colorTheme" = "GitHub Dark Dimmed";
      "editor.formatOnSave" = true;
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[jsonc]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "yaml.format.enable" = true;
      "yaml.validate" = true;
      "yaml.hover" = true;
      "yaml.completion" = true;
      "yaml.schemas" = {
        "kubernetes" = "/*.yaml";
        "https://squidfunk.github.io/mkdocs-material/schema.json" =
          "mkdocs.yml";
        "https://json.schemastore.org/pre-commit-config.json" =
          ".pre-commit-config.yaml";
      };
      #"vscode-neovim.neovimExecutablePaths.linux"= "/usr/local/bin/nvim-linux-x86_64/bin/nvim";
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "vscode-neovim.editorFontFamily" = "'Fira Code', 'monospace'";
      "extensions.experimental.affineFeatures" = true;
      "projectManager.git.baseFolders" =
        [ "/home/qsw/dev" "/home/qsw/code" ];
      "projectManager.discoverProjectsInGitRepositories" = true;
      "projectManager.showProjectNameInStatusBar" = true;
      "projectManager.groupList" = true;
      "projectManager.sortList" = "Recent";
      "vim.useSystemClipboard" = true;
      "vscode-neovim.compositeKeys" = {
        "jj" = { "command" = "vscode-neovim.escape"; };
      };
      "[makefile]" = { "editor.insertSpaces" = false; };
      "[shellscript]" = {
        "editor.defaultFormatter" = "foxundermoon.shell-format";
        "editor.formatOnSave" = true;
      };
      "[cmake]" = {
        "editor.defaultFormatter" = "ms-vscode.cmake-tools";
        "editor.formatOnSave" = true;
      };
      "go.useLanguageServer" = true;
      "go.lintTool" = "golangci-lint";
      "go.formatTool" = "gofmt";
      "go.alternateTools" = { "go" = "go"; };
      "gopls" = {
        "formatting.gofumpt" = true;
        "ui.diagnostic.staticcheck" = true;
      };
      "[go]" = {
        "editor.defaultFormatter" = "golang.go";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
      };
      "python.languageServer" = "Pylance";
      "python.analysis.typeCheckingMode" = "basic";
      "python.defaultInterpreterPath" = "python3";
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
        };
      };
      "black-formatter.importStrategy" = "fromEnvironment";
      "terraform.indexing.enabled" = true;
      #"kubernetes.kubectlPath" = "/usr/local/bin/kubectl",
      #"docker.dockerPath" = "/usr/bin/docker",
      "ansible.ansible.path" = "ansible";
      "ansible.ansibleLint.enabled" = true;
      "ansible.ansibleLint.path" = "ansible-lint";
      "ansible.ansibleLint.arguments" = "--offline --nocolor";
      "ansible.validation.enabled" = true;
      "ansible.python.interpreterPath" = "/usr/bin/python3";
      "[ansible]" = {
        "editor.defaultFormatter" = "redhat.ansible";
        "editor.formatOnSave" = true;
      };
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = [ "nixpkgs-fmt" ];
          };
        };
      };
      "nix.formatterPath" = "nixpkgs-fmt";
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnSave" = true;
      };

      # Configuration Markdown pour MkDocs (Material)
      "[markdown]" = {
        "editor.tabSize" = 4;
        "editor.insertSpaces" = true;
        "editor.wordWrap" = "on";
        "editor.quickSuggestions" = {
          "comments" = "off";
          "strings" = "off";
          "other" = "off";
        };
        "editor.formatOnSave" = false; # On désactive le formatage auto pour éviter de casser les blocs MkDocs
      };
      "markdown.extension.toc.updateOnSave" = true;
      "markdown.extension.list.indentationSize" = "adaptive";

      # Réduire le nombre d'icônes dans la barre d'activité
      "gitlens.views.repositories.location" = "scm";
      "docker.showExplorer" = false;
      "vs-kubernetes" = {
        "vs-kubernetes.showExplorer" = false;
      };
      "cmake.showInActivityBar" = false;

      # Paramètres pour Remote SSH
      "remote.SSH.showLoginTerminal" = true;
      "remote.SSH.useLocalServer" = false;
      "workbench.view.remote" = true; # Tente de forcer la vue Remote
    };
    profiles.default.keybindings = [
      {
        "key" = "space f f";
        "command" = "workbench.action.quickOpen";
        "when" =
          "neovim.mode == 'normal' && !terminalFocus && (editorTextFocus || !inputFocus)";
      }
      {
        "key" = "space e";
        "command" = "workbench.action.toggleSidebarVisibility";
        "when" =
          "neovim.mode == 'normal' && !terminalFocus && (editorTextFocus || !inputFocus)";
      }
      {
        "key" = "ctrl+h";
        "command" = "workbench.action.navigateLeft";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "ctrl+j";
        "command" = "workbench.action.navigateDown";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "ctrl+k";
        "command" = "workbench.action.navigateUp";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "ctrl+l";
        "command" = "workbench.action.navigateRight";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space p";
        "command" = "projectManager.listProjects";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "alt+p";
        "command" = "projectManager.listProjects";
      }
      {
        "key" = "space f s";
        "command" = "workbench.action.toggleFullScreen";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "ctrl+shift+t";
        "command" = "workbench.action.terminal.toggleTerminal";
      }
      {
        "key" = "ctrl+shift+m";
        "command" = "workbench.action.terminal.focus";
      }
      {
        "key" = "space space";
        "command" = "workbench.action.showCommands";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space l";
        "command" = "workbench.action.nextEditor";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space h";
        "command" = "workbench.action.previousEditor";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space x";
        "command" = "workbench.action.closeActiveEditor";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space v";
        "command" = "workbench.action.splitEditor";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
      {
        "key" = "space s";
        "command" = "workbench.action.splitEditorDown";
        "when" = "neovim.mode == 'normal' && !terminalFocus";
      }
    ];
  };
}
