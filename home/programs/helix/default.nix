{
  config,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      # Go
      pkgs.gopls
      pkgs.go
      pkgs.delve
      # Rust
      pkgs.cargo
      pkgs.rustc
      pkgs.rust-analyzer
      # Bash
      pkgs.nodePackages.bash-language-server
      pkgs.shellcheck
      # Nix
      pkgs.alejandra
      pkgs.nil
      # C
      pkgs.clang
      pkgs.clang-tools
    ];
    # TODO Move inside a file and load it from disk
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        true-color = true;
        color-modes = true;
        bufferline = "always";
        cursorline = true;
        idle-timeout = 50;
        mouse = true;
        auto-format = true;
        soft-wrap = {
          enable = true;
        };
        cursor-shape = {
          insert = "block";
          normal = "block";
          select = "underline";
        };
        statusline = {
          left = ["mode" "spinner"];
          center = ["file-name"];
          right = ["diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
          separator = "│";
        };
        indent-guides = {
          render = true;
          character = "╎"; # Some characters that work well: ""▏"", ""┆"", ""┊"", ""⸽"";
          skip-levels = 1;
        };
        lsp = {
          display-inlay-hints = false;
          display-messages = true;
        };
        search.smart-case = true;
      };
      keys = {
        insert = {
          C-c = ["normal_mode" "toggle_comments" "insert_mode"];
        };
        normal = {
          "0" = "goto_line_start";
          G = "goto_line_end";
          X = "extend_line_above";
          ret = ["move_line_down" "goto_line_start"];
          # Move selections up and down
          C-j = ["ensure_selections_forward" "extend_to_line_bounds" "delete_selection" "paste_after"];
          C-k = ["ensure_selections_forward" "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        };
        select = {
          "0" = "goto_line_start";
          G = "goto_line_end";
          # Move selections up and down
          C-j = ["ensure_selections_forward" "extend_to_line_bounds" "delete_selection" "paste_after"];
          C-k = ["ensure_selections_forward" "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
          v = ["expand_selection"];
          V = ["shrink_selection"];
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = ["-"];
          };
        }
      ];
    };
  };
}
