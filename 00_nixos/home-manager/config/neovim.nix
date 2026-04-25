{ pkgs, ... }: {
  programs.neovim =
    let
      github-theme = pkgs.vimUtils.buildVimPlugin {
        pname = "github-theme-nvim";
        version = "2024-02-12";
        src = pkgs.fetchFromGitHub {
          owner = "projekt0n";
          repo = "github-nvim-theme";
          rev = "c106c9472154d6b2c74b74565616b877ae8ed31d";
          sha256 = "1w7lz4bgfm8hq1mir4hcr8ik585d4l4w7bjl8yl3g3zklj8223pw";
        };
      };
    in
    {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        vim-tmux-navigator
        plenary-nvim
        telescope-nvim
        nui-nvim
        nvim-web-devicons
        neo-tree-nvim
        gitsigns-nvim
        indent-blankline-nvim
        lualine-nvim
        toggleterm-nvim
        nvim-treesitter.withAllGrammars
        nvim-lspconfig
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        luasnip
        cmp_luasnip
        conform-nvim
        { plugin = github-theme; }
      ];
      extraPackages = with pkgs; [
        # LSPs
        gopls
        pyright
        nixd # nix lsp
        nodePackages.bash-language-server
        yaml-language-server
        terraform-ls
        # Formatters
        black
        nixpkgs-fmt
        shfmt
        stylua
        nodePackages.prettier
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/options.lua}
        ${builtins.readFile ./nvim/keymaps.lua}
        ${builtins.readFile ./nvim/plugins.lua}
        ${builtins.readFile ./nvim/lsp.lua}
        ${builtins.readFile ./nvim/cmp.lua}
        ${builtins.readFile ./nvim/format.lua}
      '';
    };
}
