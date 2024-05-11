picom -CG --no-fading-openclose &
#picom --config "$HOME/.config/picom/picom.conf" 

# Since DWM does't support XDG autostart, we start things on our own
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
start-pulseaudio-x11 &

pasystray &
nitrogen --restore &
copyq &
solaar --window=hide &

exec dwm
