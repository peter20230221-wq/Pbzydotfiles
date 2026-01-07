#!/bin/bash

# ~/.config/waybar/scripts/power-menu.sh

entries=" 关机\n 重启\n 挂起\n 休眠\n 锁屏\n 注销"

selected=$(echo -e $entries | wofi --dmenu --cache-file /dev/null --width 250 --height 320 --prompt "电源菜单" --style ~/.config/wofi/style.css | awk '{print tolower($2)}')

case $selected in
  关机)
    systemctl poweroff -i ;;
  重启)
    systemctl reboot ;;
  挂起)
    systemctl suspend ;;
  休眠)
    systemctl hibernate ;;
  锁屏)
    hyprlock ;;   # Hyprland 用 hyprlock，sway 用 swaylock，根据自己改
  注销)
    hyprctl dispatch exit ;;   # Hyprland 或 sway，根据自己改
esac
