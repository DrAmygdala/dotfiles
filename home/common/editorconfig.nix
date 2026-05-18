{
  enable = true;
  settings = {
    "*" = {
      charset = "utf-8";
      end_of_line = "lf";
      trim_trailing_whitespace = true;
      insert_final_newline = true;
      indent_style = "space";
      indent_size = 4;
      spelling_language = "en-CA";
    };
    "*.nix" = {
      indent_size = 2;
    };
    "*.yaml" = {
      indent_size = 2;
    };
    "*.yml" = {
      indent_size = 2;
    };
    "*.txt" = {
      max_line_length = 80;
    };
    "*.md" = {
      max_line_length = 80;
    };
  };
}
