#!/usr/bin/env sh

distro="unknown"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    os=$NAME
    distro=$ID_LIKE
elif type lsb_release >/dev/null 2>&1; then
    os=$(lsb_release -sd)
    os="${os%\"}" # remove suffix "
    os="${os#\"}" # remove prefix "
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    os=$DISTRIB_DESCRIPTION
else
    os=$(uname -s)
fi

echo "OS is $os and the distribution is $distro"

if [ "$distro" != "arch" ]; then
    yes j | sudo pacman -S ansible --needed && \
    ansible-playbook --ask-become-pass -i hosts linux.yml && \
    yes j | sudo pacman -Syu
else
   echo "$os ($distro) is not supported"
   exit 1
fi