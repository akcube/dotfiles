CHOSEN=$(printf "Calculator\nPower Options" | rofi -dmenu -show -i)

case "$CHOSEN" in 
	"Calculator") rofi -show calc -modi calc -no-show-match -no-sort ;;
	"Power Options") ~/.config/rofi/poweroptions.sh ;;
	*) exit 1;;
esac
