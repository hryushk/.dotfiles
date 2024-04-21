{ self, pkgs, config, ... }: 

{

    imports = [ ./hyprlock.nix ./hypridle.nix ./hyprpaper.nix ];

    home.packages = with pkgs; [
        hyprshot
        hyprpicker
        xdg-desktop-portal
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk 
        wlr-randr
        wl-clipboard
        brightnessctl
        gnome.gnome-themes-extra
        wlsunset
        xwayland
        wlroots
        qt5ct
        libva
        dconf
        wayland-utils
        wayland-protocols
        meson
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        package = pkgs.hyprland;
        systemd.enable = true;


        settings = {

            monitor = [
                ",highrr,auto,1"
                ",prefered,auto,1"
            ];

            exec-once = [
                "${pkgs.hypridle}/bin/hypridle"
                "${pkgs.hyprpaper}/bin/hyprpaper"
                "${pkgs.waybar}/bin/waybar"
                "systemctl start --user polkit-gnome-authentication-agent-1"
                "gnome-keyring-daemon --start"
                "gsettings set org.gnome.desktop.wm.preferences button-layout :"
            ];

            # vars
            "$mainMod" = "SUPER";
            "$terminal" = "${pkgs.kitty}/bin/kitty";
            "$fileManager" = "${pkgs.gnome.nautilus}/bin/nautilus";
            "$menu" = "tofi-drun | xargs hyprctl dispatch exec --";
            "$brouser" = "${pkgs.firefox}/bin/firefox";
            "$code" = "codium";
            

            input = {
                kb_layout = "us, ru, si";
                kb_options = "grp:alt_shift_toggle";

                follow_mouse = 1;

                touchpad = {
                    natural_scroll = true;
                    scroll_factor = 0.4;
                };
            };

            general = {
                gaps_in = 0;
                gaps_out = 0;
                border_size = "none";
                no_border_on_floating = false; # enable border on float window
                layout = "dwindle";
                no_cursor_warps = true;
                allow_tearing = true;
            };

            env = [
                "WLR_DRM_NO_ATOMIC, 1"
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                "MOZ_ENABLE_WAYLAND,1"
                "QT_QPA_PLATFORM,wayland"
            ];

            misc = {
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                vrr = 1;
                animate_manual_resizes = true;
            };

            decoration = {
                # opacity
                active_opacity = 1.0;
                inactive_opacity = 0.9;

                # blur
                blur = {
                    enabled = true;
                    size = 5;
                    passes = 0;
                    new_optimizations = true;
                    xray = true;
                    ignore_opacity = true;
                    noise = 0;
                };

                # shadow
                drop_shadow = true;
            };

            animations = {
                enabled = true;

                bezier = [
                    "wind, 0.05, 0.9, 0.1, 1.05"
                    "winIn, 0.22, 1, 0.36, 1"
                    "winOut, 0.22, 1, 0.36, 1"
                    "liner, 1, 1, 1, 1"
                    # my own bezier
                    "workspaces, 0.22, 1, 0.36, 1"
                ];

                animation = [
                    "windows, 1, 6, wind, slide"
                    "windowsIn, 1, 6, winIn, slide"
                    "windowsOut, 1, 5, winOut, slide"
                    "windowsMove, 1, 5, wind, slide"
                    "fade, 1, 10, default"
                    "workspaces, 1, 5, workspaces, slide"
                ];
            };


            dwindle = {
                no_gaps_when_only = false;
                pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true; # you probably want this
            };

            master = {
                # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                new_is_master = true;
            };

            gestures = {
                workspace_swipe = true;
                workspace_swipe_fingers = 3;
                workspace_swipe_distance = 500;
            };

            bind = [
                "$mainMod, T, exec, $terminal"
                "$mainMod, Q, killactive,"
                "$mainMod, E, exec, $fileManager"
                "$mainMod, V, togglefloating,"
                "$mainMod, A, exec, $menu"
                "$mainMod, F, exec, $brouser"
                "$mainMod, C, exec, $code"
                "$mainMod, P, pseudo,"
                "$mainMod, J, togglesplit,"
                "$mainMod, W, fullscreen"

                # Move focus with mainMod + arrow keys
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                # Change brightness 
                ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
                ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5% "

                # Take a screenshot
                "$mainMod, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m window -o ~/Pictures/screenshots"
                ", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m output -o ~/Pictures/screenshots"
                "$mainMod SHIFT, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o ~/Pictures/screenshots"

                # Toggle microphone
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

                # Leave session, reboot or power off pc
                "$mainMod CTRL, P, exec, poweroff"
                "$mainMod CTRL, R, exec, reboot"
                "$mainMod CTRL, L, exit,"
                "$mainMod SHIFT, L, exec, hyprlock"
                
                # Toggle touchpad
                #""

                # Switch workspaces with mainMod + [0-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"

                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"

                # Example special workspace (scratchpad)
                "$mainMod, S, togglespecialworkspace, magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"

                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
            ];

            bindle = [
                # Change audio
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
            ];

            bindm = [
                # Move/resize windows with mainMod + LMB/RMB and dragging
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
                "$mainMod CTRL, mouse:272, resizewindow"
            ];

            windowrulev2 = [
                "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
                "noanim,class:^(xwaylandvideobridge)$"
                "nofocus,class:^(xwaylandvideobridge)$"
                "noinitialfocus,class:^(xwaylandvideobridge)$"
                "float,class:(system-monitor),title:(System Monitor)"
                "float,class:(org.gnome.Calendar),title:(Calendar)"
                "float,class:(org.gnome.Calculator),title:(Calculator)"
                "size 375 500,class:(org.gnome.Calculator),title:(Calculator)"
                "float,class:(pavucontrol),title:(Volume Control)"
                "float,class:(steam)"
                "float,class:(Warframe)"
            ];
        };
    };
}
