# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "system"

# Split window into panes.
split_v 50
run_cmd "htop"

# Set active pane.
select_pane 0
