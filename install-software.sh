#!/usr/bin/env bash

log() {
  message=$1
  echo "[macOS-setup] $message"
}

log "Installing Homebrew..."
if ! command -v COMMAND &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  log "Homebrew already installed. Skipping."
fi

log "Installing CLI packages..."
# Update here by "brew leaves | pbcopy"
brew install $(cat ./brew-packages.txt)

log "Installing GUI apps..."
for PKG in $(cat ./brew-cask-packages.txt); do
  brew install --cask $PKG || log "Problem during installing $PKG. Skipping."
done


##############################
# Manually install
#LadioCast.app
#LaunchControl.app
#LogiMgr Installer 8.20.233.app
#LINE.app
#ScanSnap Cloud.app
#ScanSnap Online Update.localized
#ScanSnapHomeMain.app
#PicGIF Lite.app
#MynaPortalApp.app
#Microsoft Remote Desktop.app
#Magic Pod Desktop.app

log "✨ Installing software done."
