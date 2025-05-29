{ pkgs }:
{
	enable = true;
	enableExtensionUpdateCheck = true;
	enableUpdateCheck = true;
	package = pkgs.vscodium;
	extensions = [
		pkgs.vscode-extensions.bbenoist.nix
		pkgs.vscode-extensions.bungcip.better-toml
		pkgs.vscode-extensions.mikestead.dotenv
		pkgs.vscode-extensions.grapecity.gc-excelviewer
		pkgs.vscode-extensions.timonwong.shellcheck
		pkgs.vscode-extensions.redhat.vscode-yaml
		pkgs.vscode-extensions.ms-python.python
		pkgs.vscode-extensions.ms-python.debugpy
		pkgs.vscode-extensions.ms-python.vscode-pylance
		pkgs.vscode-extensions.vscodevim.vim
	];
	mutableExtensionsDir = true;
	userSettings = {
	    "editor.renderWhitespace" = "all";
	    "python.languageServer" = "Pylance";
	    "files.autoSave" = "afterDelay";
	    "editor.formatOnSave" = true;
	    "svelte.enable-ts-plugin" = true;
	    "window.zoomLevel" = -1;
	    "editor.minimap.enabled" = false;
	    "autoDocstring.docstringFormat" = "sphinx";
	};
}
