xrdb -merge .Xresources
setxkbmap -option "ctrl:nocaps"
xcape -e "Control_L=Escape"
exec dbus-launch i3
