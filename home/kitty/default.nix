{ sefl, pkgs, config, ... }:

{

    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set fish_greeting # Disable greeting
        '';
    };

    programs.kitty = {
        enable = true;

        settings = {
            confirm_os_window_close = "0";
            shell = "${pkgs.fish}/bin/fish";
            font_family = "Cascadia Code Mono";
            font_size = 12;
            background = "#202020";
        };
    };

}
