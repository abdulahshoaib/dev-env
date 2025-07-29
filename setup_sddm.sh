#!/usr/bin/env bash

paru -S sddm-sugar-dark --needed --noconfirm

tee /etc/sddm.conf > /dev/null <<EOF
[Theme]
Current=sugar-dark
EOF

# Copy wallpapers to ~/Wallpapers
./wallpaper/setup_wallpaper.sh

# Copy Randomizer script to .local/bin
cp "./wallpaper/randomizer.sh" "$HOME/.local/bin/randomizer.sh"

# Create a randomizer service
cp "./wallpaper/sddm-service-rand.sh" "/usr/local/bin/sddm-wallpaper-randomizer.sh"
chmod +x /usr/local/bin/sddm-wallpaper-randomizer.sh

tee /etc/systemd/system/sddm-wallpaper.service > /dev/null <<EOF
[Unit]
Description=Randomize SDDM wallpaper before display manager starts
Before=sddm.service
After=local-fs.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/sddm-wallpaper-randomizer.sh

[Install]
WantedBy=multi-user.target
EOF

# Enable the service
systemctl enable sddm-wallpaper.service
