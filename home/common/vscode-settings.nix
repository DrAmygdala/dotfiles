{ pkgs }:
{
  enable = true;
  mutableExtensionsDir = true;
  profiles.default = {
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [
      tamasfe.even-better-toml
      bbenoist.nix
      mikestead.dotenv
      grapecity.gc-excelviewer
      timonwong.shellcheck
      redhat.vscode-yaml
      ms-python.python
      ms-python.debugpy
      vscodevim.vim
    ];
    userSettings = {
      "editor.renderWhitespace" = "all";
      "python.languageServer" = "Jedi";
      "files.autoSave" = "afterDelay";
      "editor.formatOnSave" = true;
      "window.zoomLevel" = -2;
      "editor.minimap.enabled" = false;
      "redhat.telemetry.enabled" = false;
      "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace, 'Hack Nerd Font'";
    };
    globalSnippets = {
      todo = {
        body = [
          "$LINE_COMMENT TODO: $0"
        ];
        description = "Insert a TODO remark";
        prefix = [
          "todo"
        ];
      };
    };
    languageSnippets = {
      python = {
        function-definition = {
          body = [
            "def \${1:function_name}(\${2:args}) -> \${3:output_type}:"
            "\t$0"
          ];
          description = "Insert a function definition";
          prefix = [
            "def"
          ];
        };
        class-definition = {
          body = [
            "class \${1:ClassName}:"
            "\tdef __init__(self, \${2:args}) -> None:"
            "\t\t$0"
          ];
          description = "Insert class definition";
          prefix = [
            "class"
          ];
        };
        if-statement = {
          body = [
            "if \${1:condition}:"
            "\t$0"
          ];
          description = "Insert if statement";
          prefix = [
            "if"
          ];
        };
        for-loop = {
          body = [
            "for \${1:item} in \${2:iterable}:"
            "\t$0"
          ];
          description = "Insert a for loop";
          prefix = [
            "for"
          ];
        };
      };
    };
  };
}
