{ pkgs, ... }:

{
  home.username = "rayben";
  home.homeDirectory = "/home/rayben";

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      asvetliakov.vscode-neovim
      esbenp.prettier-vscode
    ];
    userSettings = {
      "[nix]"."editor.tabSize" = 2;
      "editor.formatOnPaste" = true;
      "security.workspace.trust.enabled" = false;
      "extensions.experimental.affinity" = {
        "asvetliakov.vscode-neovim" = 1;
      };
      "editor.fontFamily" = "'LucidaProgrammer Nerd Font', 'Droid Sans Mono', 'monospace'";
      "git.enableSmartCommit" = true;
    };
  };

  programs.git = {
    enable = true;
    userName = "Ray Bennett";
    userEmail = "raymond.bennett@gmail.com";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "ls -lh --color=auto";
      la = "ls -Alh --color=auto";
      gitgraph = "git log --graph --oneline --all";
    };
    shellInit = ''set -U fish_greeting'';
  };

  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  programs.direnv.enable = true;
}

