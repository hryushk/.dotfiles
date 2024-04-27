{ pkgs, ... }:

{

    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;
        extensions = with pkgs; [
            vscode-extensions.bbenoist.nix
            vscode-extensions.ms-python.python
        ];
        userSettings = {
            "editor.mouseWheelZoom" = true;
            "editor.fontFamily" = " 'Cascadia Code Mono' ";
            "editor.fontSize" = 18;
        };
    };

}