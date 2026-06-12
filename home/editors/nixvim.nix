{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    keymaps =
      let
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
          }
          // default_opts;
        }

        # Mini files
        {
          action = "<cmd>lua MiniFiles.open()<CR>";
          key = "<C-a>";
          mode = "n";
          options = {
            desc = "Open mini-files";
          }
          // default_opts;
        }

        # Resize
        # From the perspective of the top left corner
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
          }
          // default_opts;
        }
        {
          action = "<C-w>j";
          key = "<A-j>";
          mode = "n";
          options = {
            desc = "Move down";
          }
          // default_opts;
        }
        {
          action = "<C-w>k";
          key = "<A-k>";
          mode = "n";
          options = {
            desc = "Move up";
          }
          // default_opts;
        }
        {
          action = "<C-w>l";
          key = "<A-l>";
          mode = "n";
          options = {
            desc = "Move right";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>l";
          key = "<A-l>";
          mode = "i";
          options = {
            desc = "Move right in insert mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>k";
          key = "<A-k>";
          mode = "i";
          options = {
            desc = "Move up in insert mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>j";
          key = "<A-j>";
          mode = "i";
          options = {
            desc = "Move down in insert mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>h";
          key = "<A-h>";
          mode = "i";
          options = {
            desc = "Move left in insert mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>l";
          key = "<A-l>";
          mode = "t";
          options = {
            desc = "Move right in terminal mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>k";
          key = "<A-k>";
          mode = "t";
          options = {
            desc = "Move up in terminal mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>j";
          key = "<A-j>";
          mode = "t";
          options = {
            desc = "Move down in terminal mode";
          }
          // default_opts;
        }
        {
          action = "<C-\\><C-N><C-w>h";
          key = "<A-h>";
          mode = "t";
          options = {
            desc = "Move left in terminal mode";
          }
          // default_opts;
        }
        {
          action = "<cmd>tabnext<CR>";
          key = "<leader>l";
          mode = "n";
          options = {
            desc = "Move tab right";
          }
          // default_opts;
        }
        {
          action = "<cmd>tabprevious<CR>";
          key = "<leader>h";
          mode = "n";
          options = {
            desc = "Move tab left";
          }
          // default_opts;
        }

        # Telescope
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>fg";
          mode = "n";
          options = {
            desc = "Find files";
          }
          // default_opts;
        }
        {
          action = "<cmd>Telescope find_files<CR>";
          key = "<leader>ff";
          mode = "n";
          options = {
            desc = "Find files";
          }
          // default_opts;
        }

        # Debugging
        {
          action = "<cmd>DapToggleBreakpoint<CR>";
          key = "<leader>dbb";
          mode = "n";
          options = {
            desc = "Toggle breakpoint";
          }
          // default_opts;
        }
        {
          action = "<cmd>DapContinue<CR>";
          key = "<leader>dc";
          mode = "n";
          options = {
            desc = "Debugger Continue";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('dap').run_to_cursor()<CR>";
          key = "<leader>dC";
          mode = "n";
          options = {
            desc = "Debugger continue to cursor";
          }
          // default_opts;
        }
        {
          action = "<cmd>DapRestartFrame<CR>";
          key = "<leader>dh";
          mode = "n";
          options = {
            desc = "Restart frame";
          }
          // default_opts;
        }
        {
          action = "<cmd>DapStepInto<CR>";
          key = "<leader>dj";
          mode = "n";
          options = {
            desc = "Step into";
          }
          // default_opts;
        }
        {
          action = "<cmd>DapStepOut<CR>";
          key = "<leader>dk";
          mode = "n";
          options = {
            desc = "Step out";
          }
          // default_opts;
        }
        {
          action = "<cmd>DapStepOver<CR>";
          key = "<leader>dl";
          mode = "n";
          options = {
            desc = "Step over";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('dapui').toggle()<CR>";
          key = "<leader>dd";
          mode = "n";
          options = {
            desc = "Toggle Dap UI";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
          key = "<leader>dbc";
          mode = "n";
          options = {
            desc = "Set conditional breakpoint";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message (supports variable interpolation within the message with {foo}): '))<CR>";
          key = "<leader>dbl";
          mode = "n";
          options = {
            desc = "Set log point";
          }
          // default_opts;
        }

        # Neotest
        {
          action = "<cmd>lua require('neotest').run.run()<CR>";
          key = "<leader>tr";
          mode = "n";
          options = {
            desc = "Run nearest test";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
          key = "<leader>tf";
          mode = "n";
          options = {
            desc = "Run all tests in this file";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').run.run({ suite = true })<CR>";
          key = "<leader>ta";
          mode = "n";
          options = {
            desc = "Run all tests";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>";
          key = "<leader>td";
          mode = "n";
          options = {
            desc = "Debug nearest test";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').run.stop()<CR>";
          key = "<leader>ts";
          mode = "n";
          options = {
            desc = "Stop test";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').output.open()<CR>";
          key = "<leader>to";
          mode = "n";
          options = {
            desc = "Show test output";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
          key = "<leader>tp";
          mode = "n";
          options = {
            desc = "Toggle output panel";
          }
          // default_opts;
        }
        {
          action = "<cmd>lua require('neotest').summary.toggle()<CR>";
          key = "<leader>ts";
          mode = "n";
          options = {
            desc = "Toggle summary panel";
          }
          // default_opts;
        }

        # Mermaid
        {
          action = "<cmd>lua ExportMermaidToSVG()<cr>";
          key = "<leader>me";
          mode = "n";
          options = {
            desc = "Export mermaid diagram to SVG";
          }
          // default_opts;
        }

        # D2
        {
          action = "<cmd>lua ExportD2ToSVG()<cr>";
          key = "<leader>ed";
          mode = "n";
          options = {
            desc = "Export d2 diagram to SVG";
          };
        }
        {
          action = "<cmd>lua LivePreviewD2()<cr>";
          key = "<leader>pd";
          mode = "n";
          options = {
            desc = "Export d2 diagram to SVG";
          };
        }

        # Live Preview
        {
          action = "<cmd>LivePreview start<cr>";
          key = "<leader>ps";
          mode = "n";
          options = {
            desc = "Start preview";
          }
          // default_opts;
        }
        {
          action = "<cmd>LivePreview close<cr>";
          key = "<leader>pe";
          mode = "n";
          options = {
            desc = "End preview";
          }
          // default_opts;
        }
        {
          action = "<cmd>LivePreview pick<cr>";
          key = "<leader>pp";
          mode = "n";
          options = {
            desc = "Pick file to preview";
          }
          // default_opts;
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
      spell = true;
    };
    plugins = {
      treesitter = {
        enable = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
        settings = {
          highlight.enable = true;
        };
      };
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          terraformls.enable = true;
          pyright.enable = true;
          bashls.enable = true;
          marksman.enable = true;
          yamlls = {
            enable = true;
            extraOptions = {
              settings = {
                redhat.telemetry.enabled = false;
                yaml.schemas = {
                  "https://www.schemastore.org/github-workflow.json" = ".github/workflows/*";
                  "https://www.schemastore.org/github-issue-forms.json" = ".github/ISSUE_TEMPLATE/*";
                  "https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json" =
                    "*{,docker-}compose*.{yml,yaml}";
                };
              };
            };
          };
        };
      };
      blink-cmp = {
        enable = true;
        settings = {
          signature = {
            enabled = true;
          };
          completion.list.selection = {
            preselect = false;
          };
          keymap = {
            "<C-space>" = [
              "show"
              "show_documentation"
              "hide_documentation"
            ];
            "<C-e>" = [
              "hide"
              "fallback"
            ];
            "<CR>" = [
              "accept"
              "fallback"
            ];
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
            "<Up>" = [
              "snippet_backward"
              "fallback"
            ];
            "<Down>" = [
              "snippet_forward"
              "fallback"
            ];
            "<C-p>" = [
              "select_prev"
              "fallback_to_mappings"
            ];
            "<C-n>" = [
              "select_next"
              "fallback_to_mappings"
            ];
            "<C-b>" = [
              "scroll_documentation_up"
              "fallback"
            ];
            "<C-f>" = [
              "scroll_documentation_down"
              "fallback"
            ];
            "<C-k>" = [
              "show_signature"
              "hide_signature"
              "fallback"
            ];
          };
        };
      };
      lint = {
        enable = true;
        lintersByFt = {
          python = [
            "bandit"
            "ruff"
            "mypy"
            "trivy"
          ];
          bash = [
            "shellcheck"
            "trivy"
          ];
          nix = [ "nix" ];
          json = [ "yq" ];
          toml = [ "yq" ];
          sql = [ "sqlfluff" ];
          terraform = [
            "tofu"
            "trivy"
          ];
          markdown = [ "rumdl" ];
          dockerfile = [
            "hadolint"
            "trivy"
          ];
          yaml = [
            "yq"
            "trivy"
          ];
          "*" = [ "codespell" ];
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = # Lua
            ''
              function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                  return
                end

                return { timeout_ms = 300, lsp_fallback = true }, on_format
               end
            '';
          formatters_by_ft = {
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            sh = [ "shfmt" ];
            d2 = [ "d2" ];
            json = [
              "json_repair"
              "yq"
            ];
            kdl = [ "kdlfmt" ];
            markdown = [
              "markdown-toc"
              "rumdl"
              "mdsf"
            ];
            nix = [ "nixfmt" ];
            python = [
              "pyupgrade"
              "ruff_fix"
              "ruff_format"
              "ruff_organize_imports"
            ];
            sql = [ "sqlfluff" ];
            toml = [ "yq" ];
            terraform = [ "tofu_fmt" ];
            yaml = [ "yq" ];
            "*" = [ "codespell" ];
            "_" = [ "trim_whitespace" ];
          };
        };
      };
      bufferline.enable = true;
      web-devicons.enable = true;
      lualine.enable = true;
      telescope.enable = true;
      which-key.enable = true;
      ts-comments.enable = true;
      mini-files.enable = true;
      mini-pairs.enable = true;
      mini-surround.enable = true;
      mini-ai.enable = true;
      markview.enable = true;
      neogit.enable = true;
      diffview.enable = true;
      gitsigns.enable = true;
      neo-tree = {
        enable = true;
        settings = {
          close_if_last_window = true;
          filesystem.filtered_items.visible = true;
        };
      };
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
      dap-python.enable = true;
      dap = {
        enable = true;
        signs = {
          dapBreakpoint = {
            text = "";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "";
            texthl = "DapLogPoint";
          };
        };
      };
      neotest = {
        enable = true;
        settings = {
          discovery.concurrency = 1;
        };
        adapters.python.enable = true;
      };
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        background.dark = "mocha";
        transparent_background = true;
      };
    };
    extraPackages = [
      pkgs.mermaid-cli
      pkgs.d2
      pkgs.yq
      pkgs.codespell
      pkgs.sqlfluff
      pkgs.pyupgrade
      pkgs.ruff
      pkgs.mypy
      pkgs.bandit
      pkgs.markdown-toc
      pkgs.rumdl
      pkgs.mdsf
      pkgs.kdlfmt
      pkgs.json-repair
      pkgs.shellcheck
      pkgs.shellharden
      pkgs.opentofu
      pkgs.nixfmt
      pkgs.shfmt
      pkgs.trivy
      pkgs.hadolint
    ];
    extraPlugins = with pkgs.vimPlugins; [
      live-preview-nvim
      d2-vim
    ];
    extraConfigLua = ''
      require('livepreview').setup({
        browser = "firefox",
      })
      function ExportMermaidToSVG()
        local src = vim.fn.expand("%:p")
        local out = vim.fn.expand("%:p:r") .. ".svg"
        vim.fn.jobstart(
          { "mmdc", "-i", src, "-o", out, "-b", "transparent"},
          {
            on_exit = function(_, code)
              if code == 0 then
                vim.notify("Exported: " .. out, vim.log.levels.INFO)
              else
                vim.notify("mmdc failed (exit " .. code .. ")", vim.log.levels.ERROR)
              end
            end,
          }
        )
      end
      function ExportD2ToSVG()
        local src = vim.fn.expand("%:p")
        local out = vim.fn.expand("%:p:r") .. ".svg"
        vim.fn.jobstart(
          { "d2", "--theme=0", "--dark-theme=200", src, out },
          {
            on_exit = function(_, code)
              if code == 0 then
                vim.notify("Exported: " .. out, vim.log.levels.INFO)
              else
                vim.notify("d2 failed (exit " .. code .. ")", vim.log.levels.ERROR)
              end
            end,
          }
        )
      end
      function LivePreviewD2()
        local src = vim.fn.expand("%:p")
        local out = vim.fn.expand("%:p:r") .. ".svg"
        vim.fn.jobstart(
          { "d2", "--theme=0", "--dark-theme=200", "-w", src, out },
          {
            on_exit = function(_, code)
              if code == 0 then
                vim.notify("Exported: " .. out, vim.log.levels.INFO)
              else
                vim.notify("d2 failed (exit " .. code .. ")", vim.log.levels.ERROR)
              end
            end,
          }
        )
      end
    '';
  };
}
