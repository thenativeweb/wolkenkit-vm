#!/usr/bin/env bash

username='wolkenkit'

# Make the user a member of the sudo group.
sudo usermod -a -G sudo ${username}

# Establish sudo password bypass for memebers of the user's group.
echo "%${username} ALL=NOPASSWD:ALL" > /etc/sudoers.d/wolkenkit
chmod 0440 /etc/sudoers.d/wolkenkit
