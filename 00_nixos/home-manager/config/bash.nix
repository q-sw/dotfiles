{ config, pkgs, ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_DEV_DIR = "${config.home.homeDirectory}/dev";
    };
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = ''
        $kubernetes$nix_shell$directory$git_branch$git_status
        $character
      '';
      kubernetes = {
        disabled = false;
        format = "on [󱄄 $context($namespace)]($style) ";
        style = "cyan bold";
      };

      nix_shell = {
        symbol = "❄️ ";
        format = "via [$symbol$state( \($name\))]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "purple bold";
      };

      directory = {
        style = "blue bold";
        truncate_to_repo = true; # Pratique pour les gros repo git
      };
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      dev = "cd ~/dev";
      doc = "cd ~/Documents";
      dl = "cd ~/Downloads";
      home-manager = "cd ~/dotfiles/00_nixos/home-manager/";
      c = "clear";
      e = "exit";
      v = "nvim";
      ll = "ls -lathr";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      gs = "git status";
      gc = "git commit -m";
      lg = "lazygit";
      kc = "kubectx";
      kn = "kubens";
      tfi = "terraform init";
      tfp = "terraform plan";
      tfa = "terraform apply";
      tfaa = "terraform apply --auto-approve";
      tfd = "terraform destroy";
      src-bash = "source $HOME/.bashrc";
      rebuild = "sudo nixos-rebuild switch";
    };
  };
}
