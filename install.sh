#!/usr/bin/env sh
help() {
    echo "Usage: ./install [-g arg]"
    echo "-g (the password for the github account)"
    echo "-h (print this message)"
}

while getopts ':g:h' opt; do
    case $opt in
        g)
            github_pw=$OPTARG
            ;;
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
    GITHUB_PW=$github_pw \
    ansible-playbook --ask-become-pass -i hosts linux.yml
else
   echo "Unknow OS: $os"
   exit 1
fi