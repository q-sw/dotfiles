{ pkgs, ... }: {

  home.packages = [ pkgs.opencode pkgs.nix-ld ];

  xdg.configFile."opencode/opencode.json".text = ''
    {
      "$schema": "https://opencode.ai/config.json",
      "autoupdate": false,
      "theme": "system"
    }
  '';
}
