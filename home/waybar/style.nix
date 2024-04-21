{ ... }:

{

    programs.waybar.style = ''
    * {
        all: unset;
        font-family: "Cascadia Code Mono";
        font-size: 16px;
    }

    window#waybar {
        background-color: #232323;
    }

    #workspaces {
        margin: 0px 10px 0px 10px;
    }

    #workspaces button {
        padding: 0px 13px 0px 13px;
        margin: 2px 1px 2px 1px;
        border-radius: 8px;
    }

    #workspaces button.active {
        background: rgba(256, 256, 256, 0.04);
    }

    #workspaces button:hover {
        background: rgba(256, 256, 256, 0.06);
    }

    #cpu {
        min-width: 60px;
    }

    #temperature {
        margin: 0px 4px 0px 4px;
    }

    #memory {
        min-width: 60px;
    }

    #language {
        margin: 0px 10px 0px 16px;
    }

    #network {
        min-width: 20px;
        margin: 0px 7px 0px 0px;
    }

    #battery {
        margin: 0px 10px 0px 6px;
    }

    '';

}