{ pkgs }:

{
    enable = true;
    extraConfig = ''
        set mouse=a
        set clipboard=unnamedplus
        set nocompatible
        set showmatch
        set hlsearch
        set incsearch
        set ignorecase
        set smartcase
        set number
        set relativenumber
        set cc=80
        syntax on
        set cursorline
        set splitbelow
        set splitright
    '';
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
        nvim-navic
    ];
}
