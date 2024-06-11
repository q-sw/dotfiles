# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "dev"; then

  # Load a defined window layout.
  load_window "dev_windows"
  load_window "dotfiles"
load_window "go-cli"

  # Select the default active window on session creation.
  select_window dev

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
