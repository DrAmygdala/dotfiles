{ pkgs }:

{
    enable = true;
    extraLuaConfig = ''
        -- Nvim-Tree-Lua options
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        vim.opt.termguicolors = true
        require("nvim-tree").setup()

        vim.opt.mouse = 'a'
        vim.opt.clipboard = 'unnamedplus'
        vim.opt.showmatch = true
        vim.opt.hlsearch = true
        vim.opt.incsearch = true
        vim.opt.ignorecase = true
        vim.opt.smartcase = true
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.cursorline = true
        vim.opt.splitbelow = true
        vim.opt.splitright = true

        -- Needed for coc autocomplete to work
        vim.keymap.set(
            'i',
            '<Tab>',
            'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
            { expr = true, silent = true }
        )
        vim.keymap.set(
            'i',
            '<CR>',
            'pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"',
            { expr = true }
        )

        vim.lsp.enable('pyright')
    '';
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
        nvim-navic
        coc-pyright
        nvim-lspconfig
        nvim-tree-lua
        nvim-treesitter.withAllGrammars
    ];
    coc = {
        enable = true;
        settings = {
            suggest = {
                noselect = true;
                enablePreview =true;
                enablePreselect = false;
                desiableKind = true;
            };
        };
    };
}
