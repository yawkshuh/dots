picom -CG --no-fading-openclose &
#picom --config "$HOME/.config/picom/picom.conf" 

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
copyq &
pasystray &

exec dwm
