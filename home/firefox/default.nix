# This configuration contains only default bookmarks 'cause there are still no way to set zoom level or to remove some buttons from about:config

{ ... }: 

{

    programs.firefox = {
        enable = true;
        profiles = {
            hryu = {
                # Default bookmarks
                bookmarks = [
                    {   
                        name = "My toolbar";
                        toolbar = true;
                        bookmarks = [

                            {
                                name = "YouTube";
                                url = "https://www.youtube.com/";
                            }

                            {
                                name = "Translate ";
                                url = "https://translate.yandex.com/en/";
                            }

                            {
                                name = "NixOS pkgs";
                                url = "https://search.nixos.org/packages";
                            }

                            {
                                name = "Home-manager manual";
                                url = "https://nix-community.github.io/home-manager/";
                            }

                        ];
                    }
                ];
            };
        };
    };

}