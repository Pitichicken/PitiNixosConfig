#!/usr/bin/env bash

cd /etc/nixos

info() { printf '\033[0;36m[INFO] %s\033[0m\n' "$*"; }
error() { printf '\033[0;31m[ERROR] %s\033[0m\n' "$*" >&2; }
question() { printf '\033[1;33m[COMMIT] %s\033[0m\n' "$*"; }

echo ""
info "Starting PitiRebuild"
echo ""

if ! git add -A; then
    error "Git add fail"
    exit 1
fi
info "Git files staged successfully"

if ! sudo nixos-rebuild switch --flake /etc/nixos#nixos; 
then
    error "NixOS rebuild failed, push cancel"
    exit 1
fi
info "PitiRebuild successful!"

if git diff --cached --quiet; then
    info "No change to commit"
    exit 0
fi

echo ""
question "commit message or Enter: "
read -r -p "> " message
if [[ -z "$message" ]]; then
    message="NixOS rebuild: $(date '+%Y-%m-%d %H:%M:%S')"
    info "Using automatic commit message"
fi

echo ""
info "Creating Git commit"
if ! git commit -m "$message"; then
    error "Git commit fail"
    exit 1
fi
info "Commit created successfully!"

echo ""
info "Keep Pushing Joseph"

if ! git push origin main; then
    error "Git push failed, commit saved but not pushed"
    exit 1
fi
info "Git push successful!"

echo ""
info "SAO SUPREMATIE !!!"
echo ""
