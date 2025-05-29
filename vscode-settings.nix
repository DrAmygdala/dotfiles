{ pkgs }:
{
	enable = true;
	enableExtensionUpdateCheck = true;
	enableUpdateCheck = true;
	package = pkgs.vscodium;
	extensions = [
		pkgs.vscode-extensions.bbenoist.nix
	];
	mutableExtensionsDir = true;
	userSettings = {
	    "editor.renderWhitespace": "all",
	    "python.languageServer": "Pylance",
	    "files.autoSave": "afterDelay",
	    "editor.formatOnSave": true,
	    "svelte.enable-ts-plugin": true,
	    "window.zoomLevel": -1,
	    "editor.minimap.enabled": false,
	    "autoDocstring.docstringFormat": "sphinx"
	};
}
