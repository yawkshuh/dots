# Update statusbar
while true; do
	xsetroot -name "$(date +"%R %a %d %b")"
	sleep 1m
done &

# Since DWM does't support XDG autostart, we start things on our own
picom -CG --no-fading-openclose &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
start-pulseaudio-x11 &

pasystray &
nitrogen --restore &
copyq &
solaar --window=hide &
dunst &

exec dwm
