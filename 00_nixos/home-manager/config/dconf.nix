{ pkgs, ... }:
{
  dconf = {
    settings = {
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 4;
      };

      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
        switch-to-application-9 = [ ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        switch-to-workspace-left = [ "<Super>h" ];
        switch-to-workspace-right = [ "<Super>l" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        move-window-to-workspace-1 = [ "<Ctrl><Alt>1" ];
        move-window-to-workspace-2 = [ "<Ctrl><Alt>2" ];
        move-window-to-workspace-3 = [ "<Ctrl><Alt>3" ];
        move-window-to-workspace-4 = [ "<Ctrl><Alt>4" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        screensaver = [ "<Super><Shift>l" ];
        home = [ "<Super>e" ];
        www = [ ];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-firefox/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-ghostty/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-code/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-toggle-theme/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-toggle-theme" =
        {
          name = "Toggle Light/Dark Mode";
          command = "sh -c \"gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark' && gsettings set org.gnome.desktop.interface color-scheme 'default' || gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'\"";
          binding = "<Super>g";
        };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-firefox" =
        {
          name = "Lancer Firefox (Nix Store)";
          command = "${pkgs.firefox}/bin/firefox";
          binding = "<Super>f";
        };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-ghostty" =
        {
          name = "Lancer Ghostty (Nix Store)";
          command = "${pkgs.ghostty}/bin/ghostty";
          binding = "<Super>t";
        };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-code" =
        {
          name = "Lancer VSCODE (Home Manager)";
          command = "${pkgs.vscode}/bin/code";
          binding = "<Super>c";
        };
    };
  };
}
