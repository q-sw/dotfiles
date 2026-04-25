{ ... }:

{
  programs.firefox = {
    enable = true;

    # Home Manager va automatiquement créer un wrapper pour le paquet par défaut
    # avec les politiques définies ci-dessous.
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "General";
                bookmarks = [
                  {
                    name = "Gmail";
                    url = "https://mail.google.com";
                    keyword = "gmail";
                  }
                  {
                    name = "Calendar";
                    url = "https://calendar.google.com";
                    keyword = "calendar";
                  }
                  {
                    name = "Drive";
                    url = "https://drive.google.com";
                    keyword = "drive";
                  }
                ];
              }
              {
                name = "Entertainment";
                bookmarks = [
                  {
                    name = "YouTube";
                    url = "https://youtube.com";
                    keyword = "yt";
                  }
                ];
              }
              {
                name = "AI";
                bookmarks = [
                  {
                    name = "Gemini";
                    url = "https://gemini.google.com";
                    keyword = "gem";
                  }
                ];
              }
              {
                name = "Learning";
                bookmarks = [
                  {
                    name = "Nix Dev";
                    url = "https://nix.dev";
                  }
                  {
                    name = "Zero to Nix";
                    url = "https://zero-to-nix.com/";
                  }
                  {
                    name = "Anglify Notion";
                    url = "https://www.notion.so/anglify/My-Home-Studies-2fcde5e1d15781adb975fce29abafa4d";
                    keyword = "eng";
                  }
                  {
                    name = "English Parrot";
                    url = "https://parroto.app/";
                  }
                ];
              }
              {
                name = "Development";
                bookmarks = [
                  {
                    name = "GitHub";
                    url = "https://github.com/q-sw";
                    keyword = "github";
                  }
                  {
                    name = "GCP Console";
                    url = "https://console.cloud.google.com";
                    keyword = "gcp";
                  }
                  {
                    name = "NixOS Search";
                    url = "https://search.nixos.org";
                  }
                  {
                    name = "Nix Docs";
                    url = "https://nixos.org/learn.html";
                    keyword = "nix-docs";
                  }
                ];
              }
            ];
          }
        ];
      };
      settings = {
        "browser.toolbars.bookmarks.visibility" = "always";
        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;
        "browser.aboutwelcome.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "signon.rememberSignons" = false;
        "browser.translations.enable" = false;
      };
    };
  };
}
