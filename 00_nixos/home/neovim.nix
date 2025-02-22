{config, pkgs, ...}:

{
  programs.neovim = 
  let
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      tokyonight-nvim
      {
	plugin = lsp-zero-nvim;
	config = toLuaFile ./nvim/lsp-zero.lua;
      }
      {
        plugin = indent-blankline-nvim;
	config = toLuaFile ./nvim/indent.lua;
      }
      {
        plugin = gitsigns-nvim;
	config = toLuaFile ./nvim/gitsign.lua;
      }
      luasnip
      {
        plugin = lualine-nvim;
	config = toLuaFile ./nvim/lualine.lua;
      }
      {
        plugin = neo-tree-nvim;
        config = toLuaFile ./nvim/neo-tree.lua;
      }
      nui-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/telescope.lua;
      }
      {
        plugin = todo-comments-nvim;
        config = toLuaFile ./nvim/todo-comments.lua;
      }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-bash
          p.tree-sitter-cmake
          p.tree-sitter-dockerfile
          p.tree-sitter-gitignore
          p.tree-sitter-go
          p.tree-sitter-gotmpl
          p.tree-sitter-hcl
          p.tree-sitter-helm
          p.tree-sitter-jq
          p.tree-sitter-json
          p.tree-sitter-lua
          p.tree-sitter-markdown
          p.tree-sitter-nix
          p.tree-sitter-python
          p.tree-sitter-sql
          p.tree-sitter-terraform
          p.tree-sitter-tmux
          p.tree-sitter-vim
          p.tree-sitter-vimdoc
          p.tree-sitter-yaml
        ]));
        config = toLuaFile ./nvim/treesitter.lua;
      }
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
    '';
  };
}
