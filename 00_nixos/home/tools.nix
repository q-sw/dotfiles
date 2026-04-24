{pkgs, ...}:
let
    clean = pkgs.writeScriptBin "clean-gen" 
    ''
      #!/usr/bin/env bash

      gen_nb_to_keep=5
      gen_list=()

      while IFS= read -r line; do
           gen_list+=( "$line" )
       done < <( home-manager generations | awk -F " " '{print $5}')

      gen_nb=$(home-manager generations | wc -l)

      for ((i = $gen_nb_to_keep ; i < $gen_nb ; i++)); do
          home-manager remove-generations ''${gen_list[$i]}
      done
    '';

    switchMode = pkgs.writeScriptBin "switch-mode"
    ''
      #!/usr/bin/env bash
      DARK="github_dark_dimmed"
      LIGHT="github_light"

      MODE=$1

      if [[ $MODE == "dark" ]]; then
          echo "DARK MODE"
          # ALACRITTY
          sed -i "s/$LIGHT/$DARK/" $HOME/.config/home-manager/alacritty.nix
          # NEOVIM
          sed -i "s/$LIGHT/$DARK/" $HOME/.config/home-manager/nvim/theme.lua
      elif [[ $MODE == "light" ]]; then
          echo "LIGHT MODE"
          # ALACRITTY
          sed -i "s/$DARK/$LIGHT/" $HOME/.config/home-manager/alacritty.nix
          # NEOVIM
          sed -i "s/$DARK/$LIGHT/" $HOME/.config/home-manager/nvim/theme.lua
      fi
      home-manager switch
'';
in
{
  home.packages = [clean switchMode];
}
