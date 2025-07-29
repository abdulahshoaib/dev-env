#!/usr/bin/env bash

set -e

# Colors
color_red='\033[0;31m'
color_green='\033[0;32m'
color_yellow='\033[0;31m'
color_blue='\033[0;31m'

# Logs
info() { echo -e "${color_blue}[*] $1${color_reset}"; }
success() { echo -e "${color_green}[✔] $1${color_reset}"; }
warn() { echo -e "${color_yellow}[!] $1${color_reset}"; }
fail() { echo -e "${color_red}[✘] $1${color_reset}"; exit 1; }

# install paru

info "Installing base-devel & git"
sudo pacman -S --needed --noconfirm base-devel git || fail "Failed to install base-devel/git"

info "Cloning paru AUR repo"
if git clone https://aur.archlinux.org/paru.git; then
  cd paru || fail "Failed to cd into paru"
else
  fail "Failed to clone paru"
fi

success "Paru installed"

info "Using Paru to install rest of the packages"

info "Installing Sway Utils"
info "* swaylock"
info "* swayimg"
info "* waybar"
info "* wlogout"
info "* wlroots"
info "* fuzzel"
info "* mako"
info "* sddm"
info "* swaybg"
info "* swayfx-git"
paru -S swaylock --needed --noconfirm || fail "Failed to install swaylock"
paru -S swayimg --needed --noconfirm || fail "Failed to install swayimg"
paru -S wlogout --needed --noconfirm || fail "Failed to install wlogout"
paru -S wlroots --needed --noconfirm || fail "Failed to install wlroots"
paru -S waybar  --needed --noconfirm || fail "Failed to install waybar"
paru -S fuzzel --needed --noconfirm || fail "Failed to install fuzzel"
paru -S mako --needed --noconfirm || fail "Failed to install mako"
paru -S sddm--needed --noconfirm || fail "Fail to install greetd"
paru -S swaybg --needed --noconfirm || fail "Fail to install swaybg"
paru -S swayfx-git --needed --noconfirm || fail "Fail to install swayfx-git"
success "Installed Sway Utils"

info "Installing Media Utils"

info "--- Audio --- "
info "* pipewire"
info "* pipewire-pulse"
info "* wirepumber"
info "* pavucontrol"
paru -S pipewire --needed --noconfirm || fail "Failed to install pipewire"
paru -S pipewire-pulse --needed --noconfirm || fail "Failed to install pipewire-pulse"
paru -S wireplumber --needed --noconfirm || fail "Failed to install wireplumber"
paru -S pavucontrol --needed --noconfirm || fail "Failed to install pavucontrol"
success "Installed Audio dependencies"

info "--- Screen Sharing/Recording ---"
info "* wf-recorder"
info "* xdg-desktop-portal"
info "* xdg-desktop-portal-wlr"
paru -S wf-recorder --needed --noconfirm || fail "Failed to install wf-recorder"
paru -S xdg-desktop-portal --needed --noconfirm || fail "Failed to install xdg-desktop-portal"
paru -S xdg-desktop-portal-wlr --needed --noconfirm || fail "Failed to install xdg-desktop-portal-wrl"
success "Installed Screen Sharing/Recoding dependencies"

info "--- Screen-Shot ---"
info "* grim"
info "* slurp (dep)"
paru -S grim --needed --noconfirm || fail "Failed to install grim"
paru -S slurp --needed --noconfirm || fail "Failed to install slurp"
success "Installed Screen-Shot dependencies"

info "Installing File Manager"
info "* thunar"
info "* nemo"
paru -S thunar --needed --noconfirm || fail "Failed to install thunar"
paru -S nemo --needed --noconfirm || fail "Failed to install nemo"
success "Installed File Managers"

info "Installing Media Apps"
info "* Spotify"
info "* mpv"
info "* imv"
paru -S spotify --needed --noconfirm || fail "Failed to install spotify"
paru -S mpv --needed --noconfirm || fail "Failed to install mpv"
paru -S imv --needed --noconfirm || fail "Failed to install imv"
success "Installed Media Apps"

info "Installing Bluetooth Manager"
info "* bluez"
info "* bluez-utils"
info "* blueman"
paru -S bluez --noconfirm --needed || fail "Failed to install bluez"
paru -S bluez-utils --needed --noconfirm || fail "Failed to install bluez-utils"
paru -S blueman --needed --noconfirm || fail "Failed to install blueman"
success "Installed Bluetooth Manager"

info "Installing Network Manager"
info "* networkmanager"
paru -S networkmanager --needed --noconfirm || fail "Failed to install networkmanager"
success "Installed Network Manager"

info "Installing dev_env Core"
info "* openssh"
info "* man-db"
info "* man-page"
info "* docker"
info "* docker-compose"
info "* curl"
info "* wget"
info "* github-cli"
paru -S openssh --needed --noconfirm || fail "Failed to install openssh"
paru -S man-db --needed --noconfirm || fail "Failed to install man-db"
paru -S man-page --needed --noconfirm || fail "Failed to install man-page"
paru -S tldr --needed --noconfirm || fail "Failed to install tldr"
paru -S docker --needed --noconfirm || fail "Failed to install docker"
paru -S docker-compose --needed --noconfirm || fail "Failed to install docker-compose"
paru -S curl --needed --noconfirm || fail "Fail to install curl"
paru -S wget --needed --noconfirm || fail "Fail to install wget"
paru -S github-cli --needed --noconfirm || fail "Fail to install github-cli"
success "Installed dev_env Core dependencies"

info "Installing Utils"
info "* fzf"
info "* ripgrep"
info "* cliphist"
info "* lsblk"
info "* blkid"
info "* themechanger"
info "* tlp"
info "* udiskie"
paru -S fzf --needed --noconfirm || fail "Failed to install fzf"
paru -S ripgrep --needed --noconfirm || fail "Failed to install ripgrep"
paru -S cliphist --needed --noconfirm || fail "Failed to install cliphist"
paru -S lsblk --needed --noconfirm || fail "Failed to install lsblk"
paru -S blkid --needed --noconfirm || fail "Failed to install blkid"
paru -S themechanger-git --needed --noconfirm || fail "Fail to install themechanger-git"
paru -S tlp --needed --noconfirm || fail "Fail to install tlp"
paru -S udiskie --needed --noconfirm || fail "Fail to install udiskie"
success "Installed Utils"

info "Installing Softwares"
info "* ghostty"
info "* neovim"
info "* tmux"
info "* zsh"
info "* oh-my-zsh"
paru -S ghostty --needed --noconfirm || fail "Fail to install ghostty"
paru -S neovim --needed --noconfirm || fail "Fail to install neovim"
paru -S tmux --needed --noconfirm || fail "Fail to install tmux"
paru -S zsh --needed --noconfirm || fail "Fail to install zsh"
paru -S oh-my-zsh --needed --noconfirm || fail "Fail to install oh-my-zsh"
success "Installed Softwares"

info "Installing dev_env"
info "* clang"
info "* gcc"
info "* cmake"
info "* make"
info "* ninja"
info "* Go"
info "* zig"
info "* node"
info "* npm"
info "* pnpm"
info "* bun"
info "* rails"
info "* lua"
info "* rust"
paru -S clang --needed --noconfirm || fail "Fail to install clang"
paru -S gcc --needed --noconfirm || fail "Fail to install clang"
paru -S make --needed --noconfirm || fail "Fail to install make"
paru -S cmake --needed --noconfirm || fail "Fail to install cmake"
paru -S ninja --needed --noconfirm || fail "Fail to install ninja"
paru -S go --needed --noconfirm || fail "Fail to install go"
paru -S zig --needed --noconfirm || fail "Fail to install zig"
paru -S nodejs --needed --noconfirm || fail "Fail to install nodejs"
paru -S npm --needed --noconfirm || fail "Fail to install npm"
paru -S pnpm --needed --noconfirm || fail "Fail to install pnpm"
paru -S lua --needed --noconfirm || fail "Fail to install lua"
paru -S rust --needed --noconfirm || fail "Fail to install rust"
curl -fsSL https://bun.com/install || fail "Fail to install bun"
success "Installed dev_env"

success "Successfully installed all packages"

info "Starting services..."
sudo systemctl start tlp.service
sudo systemctl enable --now tlp.service

sudo systemctl start docker.service
sudo systemctl enable --now docker.service

for dm in gdm sddm lightdm ly; do
  if systemctl is-enabled "$dm.service" &>/dev/null; then
    echo "Disabling $dm"
    sudo systemctl disable --now "$dm.service"
  fi
done

sudo systemctl start greetd.service
sudo systemctl enable --now greetd.service

sudo systemctl start bluetooth.service
sudo systemctl enable --now bluetooth.service

sudo systemctl start NetworkManager.service
sudo systemctl enable --now NetworkManager.service
success "All services started successfully"

info "Installing Nerd Fonts"

paru -S fontforge --needed --noconfirm || fail "Fail to install fontforge"
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add src

fonts=(VictorMono FiraCode FiraMono Hasklig Hermit BigBlueTerminal MartianMono)

for font in "${fonts[@]}"; do
  if [ -d "src/$font" ]; then
    ./font-patcher src/"$font"/*.ttf --complete --mono
  else
    warning "Font folder for $font not found. Skipping."
  fi
done

success "Installed Nerd Font, Set VictorMono as the default"

./setup_fuzzel.sh
./setup_ghostty.sh
./setup_waybar.sh
./setup_nvim.sh
./setup_tmux.sh
./setup_zsh.sh
./setup_grub.sh
./setup_sddm.sh
./setup_swaylock.sh
./setup_sway.sh
