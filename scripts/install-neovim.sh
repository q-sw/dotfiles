#!/usr/bin/env bash
# Install Neovim config from NixOS source to non-NixOS systems

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_SOURCE="${SCRIPT_DIR}/../00_nixos/home/nvim"
NVIM_TARGET="${HOME}/.config/nvim"

echo "Installing Neovim config from NixOS source..."

# Create target directory
mkdir -p "${NVIM_TARGET}"

# Copy all nvim config files
cp -r "${NVIM_SOURCE}"/* "${NVIM_TARGET}/"

# Copy extra lua config files
if [ -f "${SCRIPT_DIR}/../00_nixos/home/nvim/options.lua" ]; then
    cp "${SCRIPT_DIR}/../00_nixos/home/nvim/options.lua" "${NVIM_TARGET}/"
fi

if [ -f "${SCRIPT_DIR}/../00_nixos/home/nvim/theme.lua" ]; then
    cp "${SCRIPT_DIR}/../00_nixos/home/nvim/theme.lua" "${NVIM_TARGET}/"
fi

echo "Done! Neovim config installed to ${NVIM_TARGET}"