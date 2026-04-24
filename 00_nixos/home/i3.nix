{pkgs, config, lib, ...}:
let
  mod = "Mod4";
  background = "/home/quentin/Pictures/lock_screen.png";
in
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      startup = [
        {
          always = true;
          command = "feh --bg-center ${background}";
        }
        {
          always = true;
          command = "xautolock -detectsleep -time 10 -locker 'i3lock -i ${background} -c 000000'";
        }
      ];
      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl s +5%";

        # Lock screen
        "${mod}+Ctrl+l" = "exec i3lock -i ${background} -c 000000";
        # Display management (assuming you have this script)
        "${mod}+Shift+p" = "exec --no-startup-id ~/.config/i3/screen_manager.sh";
        # Start a terminal
        "${mod}+Return" = "exec alacritty";
        # Kill focused window
        "${mod}+Shift+a" = "kill";
        # Change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        # Move focused window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        # Split orientation
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";
        # Fullscreen
        "${mod}+f" = "fullscreen toggle";
        # Layout modes
        "${mod}+s" = "layout stacking";
        "${mod}+z" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        # Focus parent container
        "${mod}+q" = "focus parent";
        # Workspace switching and moving
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        # Reload and restart i3
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
      };
    colors = {
        focused = {
          background = "#539bf5";
          text = "#22272e";
          indicator = "#adbac7";
          border = "#539bf5";
          childBorder = "#539bf5";
        };
        focusedInactive = {
          background = "#adbac7";
          text = "#22272e";
          indicator = "#adbac7";
          border = "#adbac7";
          childBorder = "#539bf5";
        };
        unfocused = {
          background = "#adbac7";
          text = "#22272e";
          indicator = "#adbac7";
          border = "#adbac7";
          childBorder = "#539bf5";
        };
        background = "#22272e";
      };
    bars = [
      {
        statusCommand = "i3status";
        colors = {
          background = "#22272e";
          statusline = "#adbac7";
          focusedWorkspace = {
            background = "#539bf5";
            text = "#22272e";
            border = "#539bf5";
          };
        };
      }
    ];
  };
};
  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      colors = true;
      interval = 5;
    };
    modules = {
      "tztime local" = {
        position = 5;
        settings = {
          format = "%Y-%m-%d %H:%M:%S";
        };
      };
      "battery all" = {
        position = 4;
        settings = {
          format = "%status %percentage %remaining";
          format_down = "No battery";
          status_chr = "⚡ CHR";
          status_bat = "🔋 BAT";
          status_unk = "? UNK";
          status_full = "☻ FULL";
          path = "/sys/class/power_supply/BAT%d/uevent";
          low_threshold = 10;
        };
      };
      "load" = {
        position = 3;
        settings = {
          format = "%1min";
        };
      };
      "memory" =  {
        position = 2;
        settings = {
          format = "%used | %available";
          threshold_degraded = "1G";
          format_degraded = "MEMORY < %available";
        };
      };
      "volume master" = {
        position = 1;
        settings = {
          format = "♪ %volume";
          format_muted = "♪ muted (%volume)";
          device = "pulse:alsa_output.pci-0000_c4_00.6.HiFi__Speaker__sink";
        };
      };
    };
  };
}
