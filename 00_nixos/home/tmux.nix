{config, pkgs, ...}:
{
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
