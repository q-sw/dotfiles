# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/dotfiles/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "dotfiles"
run_cmd vim
# Split window into panes.
split_h 50

# Set active pane.
select_pane 0
