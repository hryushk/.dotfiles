{ self, pkgs, config, ... }:

{

    home.packages = with pkgs; [ libnotify ];

    services.dunst = {
        enable = true;
        iconTheme = {
            package = pkgs.flat-remix-icon-theme;
            name = "Flat-Remix-Black-Dark";
        };

        settings = {
            global = {
                timeout = 10;
                width = 600;
                height = 130;
                font = "Cascadia Code Mono";
                origin = "top-center";
                background = "#222222";
                notification_limit = 3;
                frame_width = 0;
                corner_radius = 0;
                gap_size = 8;
                offset = "0x8";
                stack_duplicates = false;
                vertical_alignment = "center";
                alignment = "center";
                separator_color = "none";
                padding = 30;
                horizontal_padding = 30;
            };
        };
    };

}
