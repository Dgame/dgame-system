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

os="$(uname)"

if [ "$os" = "Linux" ]; then
    branch = "$(pacman-mirrors -G)"
    if [ "$branch" -ne "unstable" ]; then
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