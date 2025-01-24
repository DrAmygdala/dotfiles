{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kabir";
  home.homeDirectory = "/home/kabir";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = import ./config.nix;

  home.shellAliases = import ./shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = lib.mkMerge [ 
    (import ./general-packages.nix { inherit pkgs; })
    (import ./k8s-packages.nix { inherit pkgs; })
    (import ./git-packages.nix { inherit pkgs; })
    (import ./zsh-packages.nix { inherit pkgs; })
  ];

  programs.starship = import ./starship.nix;

  programs.tmux = (import ./tmux-settings.nix { inherit pkgs; });

  programs.git = {
    # useful links: 
    # - https://github.com/alexkaratarakis/gitattributes
    # - https://github.com/github/gitignore
    enable = true;
    delta = {
      enable = true;
      options = {
        decorations = {
          commit-decoration-style = "blue ol";
          commit-style = "raw";
          file-style = "bold cyan";
          file-decoration-style = "blue ol";
          hunk-header-decoration-style = "blue ul";
          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";
        };
        unobtrusive-line-numbers = {
          line-numbers = "true";
          line-numbers-minus-style = "#444444";
          line-numbers-zero-style = "#444444";
          line-numbers-plus-style = "#444444";
          line-numbers-left-format = "{nm:>4}┊";
          line-numbers-right-format = "{np:>4}│";
          line-numbers-left-style = "blue";
          line-numbers-right-style = "blue";
        };
        features = "decorations unobtrusive-line-numbers";
        whitespace-error-style = "22 reverse";
        navigate = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
    };
    attributes = [
      # Common settings that generally should always be used with your language specific settings
      # Source: https://github.com/alexkaratarakis/gitattributes
      # Auto detect text files and perform LF normalization

      "*          text=auto"

      # The above will handle all files NOT found below

      # Documents
      "*.bibtex   text diff=bibtex"
      "*.doc      diff=astextplain"
      "*.DOC      diff=astextplain"
      "*.docx     diff=astextplain"
      "*.DOCX     diff=astextplain"
      "*.dot      diff=astextplain"
      "*.DOT      diff=astextplain"
      "*.pdf      diff=astextplain"
      "*.PDF      diff=astextplain"
      "*.rtf      diff=astextplain"
      "*.RTF      diff=astextplain"
      "*.md       text diff=markdown"
      "*.mdx      text diff=markdown"
      "*.tex      text diff=tex"
      "*.adoc     text"
      "*.textile  text"
      "*.mustache text"
      "*.csv      text eol=crlf"
      "*.tab      text"
      "*.tsv      text"
      "*.txt      text"
      "*.sql      text"
      "*.epub     diff=astextplain"

      # Graphics
      "*.png      binary"
      "*.jpg      binary"
      "*.jpeg     binary"
      "*.gif      binary"
      "*.tif      binary"
      "*.tiff     binary"
      "*.ico      binary"
      # SVG treated as text by default.
      "*.svg      text"
      # If you want to treat it as binary,
      # use the following line instead.
      # *.svg    binary
      "*.eps      binary"

      # Scripts
      "*.bash     text eol=lf"
      "*.fish     text eol=lf"
      "*.sh       text eol=lf"
      "*.zsh      text eol=lf"
      # These are explicitly windows files and should use crlf
      "*.bat      text eol=crlf"
      "*.cmd      text eol=crlf"
      "*.ps1      text eol=crlf"

      # Serialisation
      "*.json     text"
      "*.toml     text"
      "*.xml      text"
      "*.yaml     text"
      "*.yml      text"

      # Archives
      "*.7z       binary"
      "*.gz       binary"
      "*.tar      binary"
      "*.tgz      binary"
      "*.zip      binary"

      # Text files where line endings should be preserved
      "*.patch    -text"

      #
      # Exclude files from exporting
      #

      ".gitattributes export-ignore"
      ".gitignore     export-ignore"
      ".gitkeep       export-ignore"
    ];
    aliases = {
      co = "checkout";
      ci = "commit";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --numstat";
      lds = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --date=short";
      ld = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --date=relative";
      lc = "log ORIG_HEAD.. --stat --no-merges";
      fl = "log -u";
      cp = "cherry-pick";
      st = "status -s";
      cl = "clone";
      br = "branch"; 
      diff = "diff --word-diff";
      dc = "diff --cached";
      lg = "log -p";
      la = "!git config -l | rg alias | cut -c 7-";
      f = "!git ls-files | xargs rg -i";
      rbm = "!git stash && git pull origin main && git rebase main && git stash pop";
      brd = "!current=\"$(git branch --show-current)\" && git checkout --quiet main && git branch --merged | grep -v \"main\" | xargs git branch -d; git checkout --quiet \"$current\"";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      merge = {
        conflictStyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;
    initExtra = ''
      export NVM_DIR="$([ -z "$HOME/.config-" ] && printf %s "$HOME/.nvm" || printf %s "$HOME/.config/nvm")" 
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
      export PATH="/home/kabir/.local/bin:$PATH"
    '';
    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "autojump"
        "sudo"
        "fd"
        "git-flow"
        "pyenv"
        "nvm"
        "yarn"
        "poetry"
      ];
    };
  };
}
