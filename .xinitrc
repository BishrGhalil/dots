dwmblocks &
picom &
emacs --daemon &
sxhkd &
xwallpaper --zoom .config/wall.png &
xmodmap -e "clear Lock" -e "keycode 0x42 = Escape" &
systemctl --user import-environment DISPLAY
exec dwm || exec i3
