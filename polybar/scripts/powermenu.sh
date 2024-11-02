#!/bin/bash
options="Shutdown\nReboot\nLock\nSuspend\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")
case $chosen in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Lock) i3lock ;;
    Suspend) systemctl suspend ;;
    Logout) i3-msg exit ;;
esac
