#!/bin/bash
printf "\nWe will need to install Samba and NFS
\n"

sudo pacman -S samba --needed

echo

read -n 1 -s -r -p "Using nvim to config Samba at /etc/samba/smb.conf.

For example:
[Name]
path = /some/folder
browseable = yes
writable = yes
guest ok = yes
read only = no

Please any key to edit..."

echo

sudo nvim /etc/samba/smb.conf

echo

printf "\nThen start Samba services on boot.
\n"

sudo systemctl enable smb nmb

echo

printf "\nFinally, create a Samba user with the following template
USING the ROOT user NOT sudo:
smbpasswd -a [username]
\n"
