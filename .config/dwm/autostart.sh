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
numlockx &
redshift -l 43.46:11.88 -t 6500:2600 -b 1.0:0.8 &

# Disable things like turning off the monitor
xset s off -dpms

setxkbmap -layout us
xsetroot -cursor_name left_ptr
exec dwm
