#!/bin/bash
set -e

PACKAGE_URL="https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb"
PACKAGE_FILE="protonvpn-stable-release_1.0.8_all.deb"
EXPECTED_SHA256="0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180"

echo "Downloading ProtonVPN repository package..."
wget -O "$PACKAGE_FILE" "$PACKAGE_URL"

echo "Verifying package integrity..."
echo "$EXPECTED_SHA256 $PACKAGE_FILE" | sha256sum --check -

echo "Installing ProtonVPN repository..."
sudo dpkg -i "./$PACKAGE_FILE"
sudo apt update

echo "Installing ProtonVPN GUI..."
sudo apt install -y proton-vpn-gnome-desktop

echo "Installing optional system tray support for GNOME..."
sudo apt install -y libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator

echo "ProtonVPN installation complete."

