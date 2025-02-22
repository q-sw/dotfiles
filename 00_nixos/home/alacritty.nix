{config, pkgs,...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "~/.config/alacritty/colorscheme.toml"
      ];
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = 10.0;
        bold = {
          family = "MesloLGS Nerd Font Mono";
          style = "Bold";
        };
        bold_italic= {
          family = "MesloLGS Nerd Font Mono";
          style = "Bold Italic";
        };
        italic = {
          family = "MesloLGS Nerd Font Mono";
          style = "Italic";
        };
        normal = {
          family = "MesloLGS Nerd Font Mono";
          style = "Regular";
        };
      };
      terminal = {
        shell = "zsh";
      };
    };
  };
}
