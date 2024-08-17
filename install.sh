#!/bin/bash

title() {
  echo "     _       _            _     _   ___ _ _         "
  echo " ___| |_ ___|_|_____    _| |___| |_|  _|_| |___ ___ "
  echo "|_ -| '_|  _| |     |  | . | . |  _|  _| | | -_|_ -|"
  echo "|___|_,_|_| |_|_|_|_|  |___|___|_| |_| |_|_|___|___|"
  echo ""
}

i3_wm() {
  clear
  title
  echo "installing packages"
  sudo pacman -S i3 polybar rofi picom dunst alacritty fish nvim
  clear
  title
  echo "backup .config directory"
  cp -r ~/.config ~/config_backup
  echo "done"
  echo "copying configs"
  cp -r configs/i3 ~/.config/
  cp -r configs/polybar ~/.config/
  cp -r configs/rofi ~/.config/
  cp -r configs/picom ~/.config/
  cp -r configs/dunst ~/.config/
  cp -r configs/alacritty ~/.config/
  cp -r configs/fish ~/.config/
  cp -r configs/nvim ~/.config/
  cp -r configs/gtk-3.0 ~/.config/
  cp -r configs/fastfetch ~/.config/
  cp -r configs/btop ~/.config/
  echo "done"
  exit
}

hyprland_wm() {
  clear
  title
  echo "installing packages"
  sudo pacman -S hyprland waybar rofi-wayland dunst alacritty fish nvim
  clear
  title
  echo "backup .config directory"
  cp -r ~/.config ~/config_backup
  echo "done"
  echo "copying configs"
  cp -r configs/hyprland ~/.config/
  cp -r configs/waybar ~/.config/
  cp -r configs/rofi ~/.config/
  cp -r configs/dunst ~/.config/
  cp -r configs/alacritty ~/.config/
  cp -r configs/fish ~/.config/
  cp -r configs/nvim ~/.config/alacritty
  cp -r configs/gtk-3.0 ~/.config/
  cp -r configs/fastfetch ~/.config/
  cp -r configs/btop ~/.config/
  echo "done"
  exit
}

update_system() {
  clear
  title
  echo "update system? (y/n)"
  read update_input

  case "$update_input" in
  "y") sudo pacman -Syu --noconfirm ;;
  "n") wm_selection ;;
  *) echo "invalid input" ;;
  esac
}

wm_selection() {
  clear
  title
  echo "1.Hyprland or 2.i3?"
  read wm_input

  case "$wm_input" in
  1) hyprland_wm ;;
  2) i3_wm ;;
  *) echo "invalid input" ;;
  esac
}

update_system
