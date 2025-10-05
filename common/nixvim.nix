{
    enable = true;
    viAlias = true;
    vimAlias = true;
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
                pyright.enable = true;
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
    };
}
