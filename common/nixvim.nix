{
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    keymaps = let
        default_opts = {
            silent = true;
            noremap = true;
        };
    in
        [
            # NeoTree
            {
                action = "<cmd>Neotree toggle<CR>";
                key = "<C-b>";
                mode = "n";
                options = {
                    desc = "Toggle Tree view";
                } // default_opts;
            }

            # Resize
            # From the persepctive of the top left corner
            {
                action = "<cmd>vertical resize -2<CR>";
                key = "<C-Left>";
                mode = "n";
                options = default_opts;
            }
            {
                action = "<cmd>vertical resize +2<CR>";
                key = "<C-Right>";
                mode = "n";
                options = default_opts;
            }
            {
                action = "<cmd>resize +2<CR>";
                key = "<C-Down>";
                mode = "n";
                options = default_opts;
            }
            {
                action = "<cmd>resize -2<CR>";
                key = "<C-Up>";
                mode = "n";
                options = default_opts;
            }

            # Movement
            {
                action = "<C-w>h";
                key = "<A-h>";
                mode = "n";
                options = {
                    desc = "Move left";
                } // default_opts;
            }
            {
                action = "<C-w>j";
                key = "<A-j>";
                mode = "n";
                options = {
                    desc = "Move down";
                } // default_opts;
            }
            {
                action = "<C-w>k";
                key = "<A-k>";
                mode = "n";
                options = {
                    desc = "Move up";
                } // default_opts;
            }
            {
                action = "<C-w>l";
                key = "<A-l>";
                mode = "n";
                options = {
                    desc = "Move right";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>l";
                key = "<A-l>";
                mode = "i";
                options = {
                    desc = "Move right in insert mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>k";
                key = "<A-k>";
                mode = "i";
                options = {
                    desc = "Move up in insert mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>j";
                key = "<A-j>";
                mode = "i";
                options = {
                    desc = "Move down in insert mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>h";
                key = "<A-h>";
                mode = "i";
                options = {
                    desc = "Move left in insert mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>l";
                key = "<A-l>";
                mode = "t";
                options = {
                    desc = "Move right in terminal mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>k";
                key = "<A-k>";
                mode = "t";
                options = {
                    desc = "Move up in terminal mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>j";
                key = "<A-j>";
                mode = "t";
                options = {
                    desc = "Move down in terminal mode";
                } // default_opts;
            }
            {
                action = "<C-\\><C-N><C-w>h";
                key = "<A-h>";
                mode = "t";
                options = {
                    desc = "Move left in terminal mode";
                } // default_opts;
            }
            {
                action = "<cmd>tabnext<CR>";
                key = "<leader>l";
                mode = "n";
                options = {
                    desc = "Move tab right";
                } // default_opts;
            }
            {
                action = "<cmd>tabprevious<CR>";
                key = "<leader>h";
                mode = "n";
                options = {
                    desc = "Move tab left";
                } // default_opts;
            }

            # Telescope
            {
                action = "<cmd>Telescope live_grep<CR>";
                key = "<leader>fg";
                mode = "n";
                options = {
                    desc = "Find files";
                } // default_opts;
            }
            {
                action = "<cmd>Telescope find_files<CR>";
                key = "<leader>ff";
                mode = "n";
                options = {
                    desc = "Find files";
                } // default_opts;
            }
        ];
    opts = {
        mouse = "a";
        termguicolors = true;
        clipboard = "unnamedplus";
        showmatch = true;
        hlsearch = true;
        incsearch = true;
        ignorecase = true;
        smartcase = true;
        number = true;
        relativenumber = true;
        cursorline = true;
        splitbelow = true;
        splitright = true;
    };
    plugins = {
        treesitter = {
            enable = true;
            settings = {
                highlight.enable = true;
            };
        };
        lsp = {
            enable = true;
            servers = {
                nixd = {
                    enable = true;
                };
                pyrefly.enable = true;
                bashls.enable = true;
            };
        };
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings = {
                sources = [
                    { name = "nvim_lsp"; }
                ];
                mapping = {
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
                    "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
                };
            };
        };
        bufferline.enable = true;
        web-devicons.enable = true;
        lualine.enable = true;
        telescope.enable = true;
        which-key.enable = true;
        ts-comments.enable = true;
        mini-pairs.enable = true;
        mini-ai.enable = true;
        neo-tree = {
            enable = true;
            closeIfLastWindow = true;
            filesystem.filteredItems.visible = true;
        };
    };
    colorschemes.catppuccin = {
        enable = true;
        settings = {
            background.dark = "mocha";
            transparent_background = true;
        };
    };
}
