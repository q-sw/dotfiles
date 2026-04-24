{pkgs, ...}:
let
    t = pkgs.writeScriptBin "t"
    ''
        #!/usr/bin/env bash
        tmux_running=$(pgrep tmux)
        if [[ -z $TMUX ]] && [[ -z $tmux_running  ]]; then
          tmux start-server
        fi
        if ! tmux has-session -t=main 2> /dev/null; then
          tmux new-session -ds main -c $HOME
          tmux rename-window -t main:1 home
          tmux new-window -t main -n dotfile -c ~/dev/dotfiles/
        fi
        tmux attach -t main:1
    '';
    tcs = pkgs.writeScriptBin "tcs" ''
        #!/usr/bin/env bash

        if [[ $# -eq 1 ]]; then
            selected=$1
        else
            selected=$(find  ~/dev/ -mindepth 1 -maxdepth 1 -type d | fzf)
        fi
        if [[ -z $selected ]]; then
            exit 0
        fi
        selected_name=$(basename "$selected" | tr . _)
        tmux_running=$(pgrep tmux)
        # if $TMUX is empty and $tmux_running is empty
        if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
            tmux new-session -s ''${selected_name} -c ''${selected}
            tmux rename-window -t ''${selected_name}:1 vim -c ''${selected}
            tmux new-window -t ''${selected_name} -n git -c ''${selected}
            tmux new-window -t ''${selected_name} -n shell -c ''${selected}
            exit 0
        fi
        if ! tmux has-session -t=$\{selected_name} 2> /dev/null; then
            tmux new-session -ds ''${selected_name} -c ''${selected}
            tmux rename-window -t ''${selected_name}:1 vim
            tmux new-window -t ''${selected_name} -n git -c ''${selected}
            tmux new-window -t ''${selected_name} -n shell -c ''${selected}
        fi
        tmux switch-client -t ''${selected_name}
    '';

in
{
    home.packages = [ t tcs ];
    programs.tmux = {
        enable = true;
        baseIndex = 1;
        clock24 = true;
        mouse = true;
        prefix = "C-a";
        resizeAmount = 5;
        extraConfig = ''
            unbind %
            bind _ split-window -h
            unbind '"'
            bind - split-window -v
            set -ga terminal-overrides ",xterm-256color:Tc"
            set-option -g status-position top
            set-window-option -g mode-keys vi
            bind-key -T copy-mode-vi 'v' send -X begin-selection
            bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xcopy -in -selection clipboard'
            bind-key -T copy-mode-vi MouseDragEnd1Pane

            set -sg escape-time 10
            set -g set-clipboard on
            set -g status-bg "#adbac7"
            set -g status-right "#{pane_current_path}"
            set -g pane-border-style fg=#adbac7
            set -g pane-active-border-style fg=#539bf5
        '';
        plugins = with pkgs.tmuxPlugins; [
            vim-tmux-navigator
        ];
    };
}
