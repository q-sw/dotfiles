# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/dev/github/public/go-qsw-cli/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "go-cli"
run_cmd vim

# Split window into panes.
split_h 50
split_v 50

# Set active pane.
select_pane 0
