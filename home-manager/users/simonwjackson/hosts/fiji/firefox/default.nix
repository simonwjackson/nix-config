{ pkgs, ... }:

{
  home.file."./.config/tridactyl/tridactylrc" = {
    source = ./tridactylrc;
  };

  home.packages = with pkgs; [
    tridactyl-native
  ];

  programs.firefox = {
    enable = true;

    package = pkgs.firefox-esr.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      cfg = {
        # Tridactyl native connector
        enableTridactylNative = true;
      };
    };

    profiles.simonwjackson = {
      isDefault = true;
      settings = {
        "signon.rememberSignons" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.closeWindowWithLastTab" = true;
        "layout.css.prefers-color-scheme.content-override" = 2;
        "xpinstall.signatures.required" = false;
        "extensions.langpacks.signatures.required" = false;
      };

      userChrome = ''
        /* Here all specific rules for user interface, extensions UI… */
        @-moz-document url(chrome://browser/content/browser.xul),
          url(chrome://browser/content/browser.xhtml),
          url(chrome://browser/content/places/bookmarksSidebar.xhtml),
          url(chrome://browser/content/webext-panels.xhtml),
          url(chrome://browser/content/places/places.xhtml) {
          :root[titlepreface*="᠎"] #TabsToolbar > .toolbar-items {
            opacity: 0;
            pointer-events: none;
          }
          
          :root[titlepreface*="᠎"] #TabsToolbar {
            visibility: collapse !important;
          }
          
          :root[titlepreface*="᠎"] #TabsToolbar .titlebar-spacer {
            border-inline-end: none;
          }

          :root[titlepreface*="᠎"] #nav-bar {
            visibility: inherit !important;
            visibility: collapse !important;
          }

          #home-button {
            display: none !important;
          }
        }
      '';

      userContent = ''
        /* Hide scrollbar in FF Quantum */
        * { scrollbar-width: none !important }
      '';
    };
  };
}
