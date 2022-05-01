CHOSEN=$(printf "Power Off\nRestart\nLock\nLog Off\n" | rofi -dmenu -i)

case "$CHOSEN" in 
	"Power Off") poweroff;;
	"Restart") reboot;;
	"Lock") i3lock;;
	"Log off") sudo pkill -u akcube;;
	*) exit 1;;
esac