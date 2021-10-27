-- http://projects.haskell.org/xmobar/
-- I use Font Awesome 5 fonts in this config for unicode "icons".  On Arch Linux,
-- install this package from the AUR to get these fonts: otf-font-awesome-5-free
import Xmobar

myFontSize = 20

config :: Config
config = defaultConfig { 
  font    = "xft:Ubuntu:weight=bold:pixelsize=" ++ (show myFontSize) ++ ":antialias=true:hinting=true"
  , additionalFonts = [ "xft:Mononoki Nerd Font:pixelsize=" ++ (show myFontSize) ++ ":antialias=true:hinting=true"
                      , "xft:Font Awesome 5 Free Solid:pixelsize=" ++ (show myFontSize)
                      , "xft:Font Awesome 5 Brands:pixelsize=" ++ (show myFontSize)
                      ]
  , bgColor = "#282c34"
  , fgColor = "#ff6c6b"
  , position = Static { xpos = 0 , ypos = 0, width = 3840, height = 22 }
  , lowerOnStart = False
  , hideOnStart = False
  , allDesktops = True
  , persistent = True
  , iconRoot = "~/.xmonad/xpm/"  -- default: "."
  , commands = [
               -- Time and date
                 Run $ Date "<fn=2>\xf017</fn>  %b %d %Y - (%H:%M) " "date" 50
                 -- Network up and down
               , Run $ Network "enp6s0" ["-t", "<fn=2>\xf0ab</fn>  <rx>kb  <fn=2>\xf0aa</fn>  <tx>kb"] 20
                 -- Cpu usage in percent
               , Run $ Cpu ["-t", "<fn=2>\xf108</fn>  cpu: (<total>%)","-H","50","--high","red"] 20
                 -- Ram used number and percent
               , Run $ Memory ["-t", "<fn=2>\xf233</fn>  mem: <used>M (<usedratio>%)"] 20
                 -- Disk space free
               , Run $ DiskU [
               -- ("/", "<fn=2>\xf0c7</fn>  root: <free> free"), 
                 ("/home", "<fn=2>\xf0c7</fn>  home: <free> free")] [] 60
                 -- Runs a standard shell command 'uname -r' to get kernel version
               , Run $ Com "uname" ["-r"] "" 3600
               , Run $ Com "~/.xmonad/trayer-padding-icon.sh" [] "trayerpad" 10
               , Run $ UnsafeStdinReader
               ]
  , sepChar = "%"
  , alignSep = "}{"
  , template = " <icon=haskell_20.xpm/>   <fc=#666666>|</fc> %UnsafeStdinReader% }{  <fc=#666666>|</fc>  <fc=#b3afc2><fn=3></fn>  <action=`alacritty -e btm`>%uname%</action> </fc> <fc=#666666>|</fc>  <fc=#ecbe7b> <action=`alacritty -e btm`>%cpu%</action> </fc> <fc=#666666>|</fc>  <fc=#ff6c6b> <action=`alacritty -e btm`>%memory%</action> </fc> <fc=#666666>|</fc>  <fc=#51afef> <action=`alacritty -e btm`>%disku%</action> </fc> <fc=#666666>|</fc>  <fc=#98be65> <action=`alacritty -e sudo bandwhich`>%enp6s0%</action> </fc> <fc=#666666>|</fc>    <fc=#666666>|</fc>  <fc=#46d9ff> %date% </fc>"
}

main :: IO ()
main = xmobar config

