{ pkgs, lib, config, inputs, ... }: 

let
  username = builtins.getEnv "USER";
  homeDir = builtins.getEnv "HOME";

  isNvidia = builtins.pathExists ./use-nvidia;
in {
  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [

  ];


  xdg.configFile."niri/config.kdl".source = ./dotfiles/niri.kdl;
  xdg.configFile."alacritty/alacritty.toml".source = ./dotfiles/alacritty.toml;
  xdg.configFile."fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel.ini;
  xdg.configFile."starship.toml".source = ./dotfiles/starship.toml;
  xdg.configFile."wallpaper/wallpaper.png".source = ./dotfiles/wallpaper.png;
  xdg.configFile."vesktop/settings/quickCss.css".source = ./dotfiles/quickCss.css;
  xdg.configFile."spicetify/Themes/Spoty/color.ini".source = ./dotfiles/Spoty/color.ini;
  xdg.configFile."spicetify/Themes/Spoty/user.css".source = ./dotfiles/Spoty/user.css;
  xdg.configFile."fastfetch/config.jsonc".source = ./dotfiles/fastfetch/config.jsonc;
  xdg.configFile."fastfetch/fastfetch.png".source = ./dotfiles/fastfetch/fastfetch.png;
  xdg.configFile."kitty/kitty.conf".source = ./dotfiles/kitty.conf;
  xdg.configFile."thdance/dancers/dancer-1.gif".source = ./dotfiles/dancers/dancer-1.gif;
  xdg.configFile."cava/config".source = ./dotfiles/config;
  xdg.configFile."waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./dotfiles/waybar/style.css;
  xdg.configFile."wlogout/style.css".source = ./dotfiles/wlogout/style.css;
  home.file.".zshrc".source = ./dotfiles/zshrc;
    

  home.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    NIXOS_OZONE_WL = "1";
  } // (if isNvidia then {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  } else {}); 
}
