CHOSEN=$(printf "Calculator\nSearch Files\nNetwork Options\nPower Options" | rofi -dmenu -show -i)

case "$CHOSEN" in 
	"Calculator") rofi -show calc -modi calc -no-show-match -no-sort ;;
	"Search Files") ~/.config/rofi/finder.sh -o xdg-open ;;
	"Network Options") ~/.config/rofi/wifimenu.sh ;;
	"Power Options") ~/.config/rofi/poweroptions.sh ;;
	*) exit 1;;
esac