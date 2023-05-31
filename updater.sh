#!/bin/bash

#clear the screen
clear

# Update package repositories
echo "Updating package repositories..."
sudo apt update

# Update flatpaks
echo "Updating flatpaks..."
flatpak update -y

# Upgrade packages
echo "Upgrading packages..."
sudo apt upgrade -y

# Autoremove unused packages
echo "Removing unused packages..."
sudo apt autoremove -y

# Autoclean package cache
echo "Cleaning package cache..."
sudo apt autoclean -y

# Runs Neofetch
neofetch

# Ask user if they want to reboot, shutdown, logout, or continue
while true; do
    read -p "Do you want to reboot, shutdown, logout, or continue? (r/s/l/c) " choice
    case $choice in
        r|R)
            sudo reboot
            break;;
        s|S)
            sudo shutdown -h now
            break;;
        l|L)
            gnome-session-quit --logout
            break;;
        c|C)
            break;;
        *)
            echo "Invalid choice. Please choose again.";;
    esac
done

echo "Script complete."
