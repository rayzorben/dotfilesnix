#!/usr/bin/env bash
set -euo pipefail

DISK="/dev/vda"
HOST="vm"
REPO="https://github.com/rayzorben/dotfilesnix"
MNT="/mnt"

echo ">>> Partitioning $DISK"
sgdisk --zap-all $DISK
sgdisk -n1:1M:+1G -t1:ef00 -c1:"EFI" $DISK
sgdisk -n2:0:0 -t2:8300 -c2:"nixos-root" $DISK


echo ">>> Setting up LUKS2"
cryptsetup luksFormat --type luks2 ${DISK}2
cryptsetup open ${DISK}2 cryptroot

echo ">>> Creating btrfs filesystem with subvolumes"
mkfs.btrfs -L NIXROOT /dev/mapper/cryptroot   # <-- fsLabel matches hosts.nix
mount /dev/mapper/cryptroot $MNT
btrfs subvolume create $MNT/@
btrfs subvolume create $MNT/@home
btrfs subvolume create $MNT/@log
btrfs subvolume create $MNT/@cache
btrfs subvolume create $MNT/@snapshots
umount $MNT

echo ">>> Mounting subvolumes"
mount -o subvol=@,compress=zstd,noatime /dev/mapper/cryptroot $MNT
mkdir -p $MNT/{boot,home,var/log,var/cache,.snapshots}
mount -o subvol=@home,compress=zstd,noatime /dev/mapper/cryptroot $MNT/home
mount -o subvol=@log,compress=zstd,noatime /dev/mapper/cryptroot $MNT/var/log
mount -o subvol=@cache,compress=zstd,noatime /dev/mapper/cryptroot $MNT/var/cache
mount -o subvol=@snapshots,compress=zstd,noatime /dev/mapper/cryptroot $MNT/.snapshots

echo ">>> Formatting EFI partition"
mkfs.vfat -n EFI ${DISK}1
mount ${DISK}1 $MNT/boot

mkdir -p /tmp/ventoy
mount /dev/disk/by-label/Ventoy /tmp/ventoy

echo ">>> Cloning repo"
nix-shell -p git --run "git clone $REPO $MNT/etc/nixos"

echo ">>> Generating hardware config"
nixos-generate-config --root $MNT
cp /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/hosts/$HOST/hardware-configuration.nix

pushd /mnt/etc/nixos
git add hosts/$HOST/hardware-configuration.nix
popd

echo ">>> Installing NixOS with flake"
nixos-install --flake $MNT/etc/nixos#$HOST

echo ">>> Done! Set root password after reboot with 'passwd'"

