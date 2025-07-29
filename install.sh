#!/usr/bin/env bash

set -e

# Colors
color_red='\033[0;31m'
color_green='\033[0;32m'
color_yellow='\033[0;33m'
color_blue='\033[0;34m'
color_reset='\033[0m'

# Logs
info() { echo -e "${color_blue}[*] $1${color_reset}"; }
success() { echo -e "${color_green}[✔] $1${color_reset}"; }
warn() { echo -e "${color_yellow}[!] $1${color_reset}"; }
fail() { echo -e "${color_red}[✘] $1${color_reset}"; exit 1; }

# install paru

# info "Installing base-devel & git"
# sudo pacman -S --needed --noconfirm base-devel git || fail "Failed to install base-devel/git"
#
# info "Cloning paru AUR repo"
# if git clone https://aur.archlinux.org/paru.git; then
#   cd paru || fail "Failed to cd into paru"
# else
#   fail "Failed to clone paru"
# fi
#
# success "Paru installed"
#
# info "Updating AUR..."
# paru -Syu
# success "AUR updated"
#
# info "Using Paru to install rest of the packages"
#
# info "Installing Sway Utils"
# info "* swaylock-effects"
# paru -Rns --noconfirm swaylock-effects swaylock-effects-git swaylock || true
# paru -S swaylock-effects-improved-git --needed || fail "Failed to install swaylock"
# success "swaylock-effects"
# info "* swayimg"
# paru -S swayimg --needed --noconfirm || fail "Failed to install swayimg"
# success "swayimg"
# info "* waybar"
# paru -S waybar  --needed --noconfirm || fail "Failed to install waybar"
# success "waybar"
# info "* wlogout"
# paru -S wlogout --needed --noconfirm || fail "Failed to install wlogout"
# success "wlogout"
# info "* wlroots"
# paru -S wlroots --needed --noconfirm || fail "Failed to install wlroots"
# success "wlroots"
# info "* fuzzel"
# paru -S fuzzel --needed --noconfirm || fail "Failed to install fuzzel"
# success "fuzzel"
# info "* mako"
# paru -S mako --needed --noconfirm || fail "Failed to install mako"
# success "mako"
# info "* sddm"
# paru -S sddm --needed --noconfirm || fail "Fail to install sddm"
# success "sddm"
# info "* swaybg"
# paru -S swaybg --needed --noconfirm || fail "Fail to install swaybg"
# success "swaybg"
# success "Installed Sway Utils"
#
# info "Installing Media Utils"
#
# info "--- Audio --- "
# info "* pipewire"
# paru -S pipewire --needed --noconfirm || fail "Failed to install pipewire"
# success "pipewire"
# info "* pipewire-pulse"
# paru -S pipewire-pulse --needed --noconfirm || fail "Failed to install pipewire-pulse"
# success "pipewire-pulse"
# info "* wirepumber"
# paru -S wireplumber --needed --noconfirm || fail "Failed to install wireplumber"
# success "wirepumber"
# info "* pavucontrol"
# paru -S pavucontrol --needed --noconfirm || fail "Failed to install pavucontrol"
# success "pavucontrol"
# success "Audio"
#
# info "--- Screen Sharing/Recording ---"
# info "* wf-recorder"
# paru -S wf-recorder --needed --noconfirm || fail "Failed to install wf-recorder"
# success "wf-recorder"
# info "* xdg-desktop-portal"
# paru -S xdg-desktop-portal --needed --noconfirm || fail "Failed to install xdg-desktop-portal"
# success "xdg-desktop-portal"
# info "* xdg-desktop-portal-wlr"
# paru -S xdg-desktop-portal-wlr --needed --noconfirm || fail "Failed to install xdg-desktop-portal-wrl"
# success "xdg-desktop-portal-wlr"
# success "Sharing/Recoding"
#
# info "--- Screen-Shot ---"
# info "* grim"
# paru -S grim --needed --noconfirm || fail "Failed to install grim"
# success "grim"
# info "* slurp (dep)"
# paru -S slurp --needed --noconfirm || fail "Failed to install slurp"
# success "slur"
# success "Screen-Shot"
#
# info "Installing File Manager"
# info "* thunar"
# paru -S thunar --needed --noconfirm || fail "Failed to install thunar"
# success "thunar"
# info "* nemo"
# paru -S nemo --needed --noconfirm || fail "Failed to install nemo"
# success "nemo"
# success "File Managers"
#
# info "Installing Media Apps"
# info "* Spotify"
# paru -S spotify --needed --noconfirm || fail "Failed to install spotify"
# success "Spotify"
# info "* mpv"
# paru -S mpv --needed --noconfirm || fail "Failed to install mpv"
# success "mpv"
# info "* imv"
# paru -S imv --needed --noconfirm || fail "Failed to install imv"
# success "imv"
# success "Media Apps"
#
# info "Installing Bluetooth Manager"
# info "* bluez"
# paru -S bluez --noconfirm --needed || fail "Failed to install bluez"
# success "bluez"
# info "* bluez-utils"
# paru -S bluez-utils --needed --noconfirm || fail "Failed to install bluez-utils"
# success "bluez-utils"
# info "* blueman"
# paru -S blueman --needed --noconfirm || fail "Failed to install blueman"
# success "blueman"
# success "Bluetooth Manager"
#
# info "Installing Network Manager"
# info "* networkmanager"
# paru -S networkmanager --needed --noconfirm || fail "Failed to install networkmanager"
# success "networkmanager"
# success "Installed Network Manager"
#
# info "Installing dev_env Core"
# info "* openssh"
# paru -S openssh --needed --noconfirm || fail "Failed to install openssh"
# success "openssh"
# info "* man-db"
# paru -S man-db --needed --noconfirm || fail "Failed to install man-db"
# success "man-db"
# info "* docker"
# paru -S docker --needed --noconfirm || fail "Failed to install docker"
# success "docker"
# info "* tldr"
# paru -S tldr --needed --noconfirm || fail "Failed to install tldr"
# success "tldr"
# info "* docker-compose"
# paru -S docker-compose --needed --noconfirm || fail "Failed to install docker-compose"
# info "* curl"
# paru -S curl --needed --noconfirm || fail "Fail to install curl"
# success "curl"
# info "* wget"
# paru -S wget --needed --noconfirm || fail "Fail to install wget"
# success "wget"
# info "* github-cli"
# paru -S github-cli --needed --noconfirm || fail "Fail to install github-cli"
# success "github-cli"
# success "dev_env Core"
#
# info "Installing Utils"
# info "* fzf"
# paru -S fzf --needed --noconfirm || fail "Failed to install fzf"
# success "fzf"
# info "* ripgrep"
# paru -S ripgrep --needed --noconfirm || fail "Failed to install ripgrep"
# success "ripgrep"
# info "* cliphist"
# paru -S cliphist --needed --noconfirm || fail "Failed to install cliphist"
# success "cliphist"
# info "* util-linux (for lsblk)"
# paru -S  util-linux --needed --noconfirm || fail "Failed to install lsblk"
# success "util-linux (for lsblk)"
# info "* themechanger"
# paru -S themechanger-git --needed --noconfirm || fail "Fail to install themechanger-git"
# success "themechanger"
# info "* tlp"
# paru -S tlp --needed --noconfirm || fail "Fail to install tlp"
# success "tlp"
# info "* udiskie"
# paru -S udiskie --needed --noconfirm || fail "Fail to install udiskie"
# success "udiskie"
# success "Utils"
#
# info "Installing Softwares"
# info "* ghostty"
# paru -S ghostty --needed --noconfirm || fail "Fail to install ghostty"
# success "ghostty"
# info "* neovim"
# paru -S neovim --needed --noconfirm || fail "Fail to install neovim"
# success "neovim"
# info "* tmux"
# paru -S tmux --needed --noconfirm || fail "Fail to install tmux"
# success "tmux"
# info "* zsh"
# paru -S zsh --needed --noconfirm || fail "Fail to install zsh"
# success "zsh"
# success "Installed Softwares"
#
# info "Installing dev_env"
# info "* clang"
# paru -S clang --needed --noconfirm || fail "Fail to install clang"
# success "clang"
# info "* gcc"
# paru -S gcc --needed --noconfirm || fail "Fail to install clang"
# success "gcc"
# info "* cmake"
# paru -S cmake --needed --noconfirm || fail "Fail to install cmake"
# success "cmake"
# info "* make"
# paru -S make --needed --noconfirm || fail "Fail to install make"
# success "make"
# info "* ninja"
# paru -S ninja --needed --noconfirm || fail "Fail to install ninja"
# success "ninja"
# info "* Go"
# paru -S go --needed --noconfirm || fail "Fail to install go"
# success "Go"
# info "* zig"
# paru -S zig --needed --noconfirm || fail "Fail to install zig"
# success "zig"
# info "* node"
# paru -S nodejs --needed --noconfirm || fail "Fail to install nodejs"
# success "node"
# info "* npm"
# paru -S npm --needed --noconfirm || fail "Fail to install npm"
# success "npm"
# info "* pnpm"
# paru -S pnpm --needed --noconfirm || fail "Fail to install pnpm"
# success "pnpm"
# info "* bun"
# curl -fsSL https://bun.com/install || fail "Fail to install bun"
# success "bun"
# info "* rails"
# success "rails not installed DO IT YOURSELF"
# info "* lua"
# paru -S lua --needed --noconfirm || fail "Fail to install lua"
# success "lua"
# info "* rust"
# paru -S rust --needed --noconfirm || fail "Fail to install rust"
# success "rust"
# success "Installed dev_env"
#
# success "Successfully installed all packages"
#
# info "Starting services..."
# sudo systemctl start tlp.service
# sudo systemctl enable --now tlp.service
#
# sudo systemctl start docker.service
# sudo systemctl enable --now docker.service
#
# for dm in gdm lightdm ly; do
#   if systemctl is-enabled "$dm.service" &>/dev/null; then
#     echo "Disabling $dm"
#     sudo systemctl disable --now "$dm.service"
#   fi
# done
#
# sudo systemctl enable --now sddm.service
#
# sudo systemctl start bluetooth.service
# sudo systemctl enable --now bluetooth.service
#
# sudo systemctl start NetworkManager.service
# sudo systemctl enable --now NetworkManager.service
success "All services started successfully"

info "Installing Nerd Fonts"
./setup_fonts.sh
success "Installed Nerd Font, Set VictorMono as the default"

./setup_grub.sh
success "Installed Grub"

./setup_sddm.sh
success "Installed SDDM"

info "Installing Fuzzel"
./setup_fuzzel.sh
success "Installed fuzzel"

info "Installing Ghostty"
./setup_ghostty.sh
success "Installed Ghostty"


info "Installing Waybar"
./setup_waybar.sh
success "Installed Waybar"

info "Installing Neovim"
./setup_nvim.sh
success "Installed Neovim"

info "Installing TMUX"
./setup_tmux.sh
success "Installed TMUX"


info "Installing Swaylock"
./setup_swaylock.sh
success "Installed Swaylock"

info "Installing Sway"
./setup_sway.sh
success "Installed Sway"

success "SETUP COMPLETE"

info "* oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
success "oh-my-zsh"

info "Installing zsh"
./setup_zsh.sh
success "Installed zsh"
