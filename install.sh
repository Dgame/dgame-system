#!/usr/bin/env sh
help() {
    echo "Usage: ./install [-g arg]"
    echo "-h (print this message)"
}

while getopts ':h' opt; do
    case $opt in
        h)
            help
            ;;
        ?)
            echo "Invalid Parameter given. $(help)"
            ;;
    esac
done

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

if [ "$os" = "Manjaro Linux"  ]; then
    branch="$(pacman-mirrors -G)"
    echo "Branch is $branch";
    if [ "$branch" != "unstable" ]; then
        sudo pacman-mirrors --api --set-branch unstable && \
            sudo pacman-mirrors --fasttrack 5 && \
            yes j | sudo pacman -Syyu
    fi
    yes j | sudo pacman -S ansible && \
        ansible-playbook --ask-become-pass -i hosts linux.yml
else
   echo "Unknow OS: $os"
   exit 1
fi