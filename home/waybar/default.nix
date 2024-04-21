{ ... }:

{

    imports = [ ./style.nix ];

    programs.waybar = {
        enable = true;

        settings.topBar = {
            position = "top";
            layer = "top";
            height = 30;
            spacing = 0;

            modules-left = [ "hyprland/workspaces" "tray" ];
            modules-center = [ "clock" ];
            modules-right = [ "cpu" "temperature" "memory" "hyprland/language" "network" "battery" ];

            "hyprland/workspaces" = {
                active-only = false;
            };

            tray = {
                icon-size = 21;
                spacing = 10;
            };

            clock = {
                format = "{:%H:%M}"; # add month (lit) and day (num)
            };

            cpu = {
                interval = 2;
                format = "{usage}% ";
                max-length = 25;
            };

            temperature = {
                interval = 2;
                format = "{temperatureC}°C ";
            };

            memory = {
                interval = 2;
                format = "{}% ";
            };

            "hyprland/language" = {
                format = "{}";
                format-en = "en";
                format-ru = "ru";
                format-sl = "sl";
            };

            network = {
                format = "{ifname}";
                format-wifi = "{icon}";
                format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
                tooltip = false;
            };

            battery = {
                bat = "BAT0";
                interval = 2;
                format = "{icon} {capacity}%";
                format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
                format-charging = "󰂄 {capacity}%";
            };
        };
    };

}