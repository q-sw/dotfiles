require("neo-tree").setup({
    default_component_configs = {
        git_status = {
            symbols = {
                -- Change type
                added     = "✚",
                deleted   = "✖",
                modified  = "",
                renamed   = "󰁕",
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "&",
                staged    = "$",
                conflict  = "",
            },
        }
    },
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
                ".DS_Store",
                "thumbs.db",
                --"node_modules",
            },
        },
    },
    event_handlers = {

        {
            event = "file_opened",
            handler = function(file_path)
                -- auto close
                -- vimc.cmd("Neotree close")
                -- OR
                require("neo-tree.command").execute({ action = "close" })
            end
        },

    }
})
