{config, pkgs,...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        sessionVariables = {
            VISUAL = "nvim";
            EDITOR = "nvim";
            TERM = "xterm-256color";
            BROWSER = "firefox";
        };
        localVariables = {
            PATH = "/usr/bin:$PATH";
            XDG_CONFIG_HOME = "~/.config";
        };
        shellAliases = {
            dev="cd ~/dev";
            home-lab="cd ~/dev/home-lab";
            c="clear";
            #t="tmux";
            e="exit";
            v="nvim";
            ls="ls --color=auto";
            ll="ls -lathr";
            gs="git status";
            gc="git commit -m";
            lg="lazygit";
            k="kubectl";
            kc="kubectx";
            kn="kubens";
            tfi="terraform init";
            tfp="terraform plan";
            tfa="terraform apply";
            tfaa="terraform apply --auto-approve";
            tfd="terraform destroy";
            src-zsh="source ~/.zshrc";
            update-system="sudo nixos-rebuild switch -I nixos-config=/home/quentin/dev/github/dotfiles/00_nixos/system/configuration.nix";
            update-home="home-manager switch -f ~/dev/github/dotfiles/00_nixos/home/home.nix";
        };
        oh-my-zsh = {
            enable = true;
            theme = "simple";
        };
    };
}
