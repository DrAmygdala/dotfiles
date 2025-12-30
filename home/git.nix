{
  pkgs,
  config,
  lib,
  ...
}:
{
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  programs.git = {
    # useful links:
    # - https://github.com/alexkaratarakis/gitattributes
    # - https://github.com/github/gitignore
    enable = true;
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
    settings = {
      alias = {
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
        append = "town append";
        compress = "town compress";
        contribute = "town contribute";
        diff-parent = "town diff-parent";
        hack = "town hack";
        delete = "town delete";
        observe = "town observe";
        park = "town park";
        prepend = "town prepend";
        propose = "town propose";
        rename = "town rename";
        repo = "town repo";
        set-parent = "town set-parent";
        ship = "town ship";
        sync = "town sync";
      };
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

  # GitHub CLI tool
  # https://cli.github.com/manual/
  programs.gh = {
    enable = true;
    settings = {
      aliases = {
        co = "pr checkout";
      };
      git_protocol = "ssh";
      prompt = "enabled";
      spinner = "enabled";
    };
  };
}
