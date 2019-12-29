#!/usr/bin/env sh

if [ -f /etc/os-release ]; then
    . /etc/os-release
    os=$NAME
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

echo "OS is $os"

if [ "$os" = "Manjaro Linux" ]; then
    yes j | sudo pacman -S ansible --needed && \
    ansible-playbook --check --ask-become-pass -i hosts linux.yml && \
    yes j | sudo pacman -Syu
else
   echo "Unknow OS: $os"
   exit 1
fi