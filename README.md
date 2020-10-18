## Install

### Arch-Linux / Manjaro

```make
git clone https://github.com/Dgame/dgame-system
sudo pacman -Sy && yes j | sudo pacman -S make
make -f arch.mk [check|install]
update
```

### Windows 10 WSL (Ubuntu 18.04 / 20.04)

```make
git clone https://github.com/Dgame/dgame-system
sudo apt-get -y update && sudo apt-get -y install make
make -f wsl.mk [check|install]
update
```

----

 - [x] git
 - [x] Fira-Code
 - [x] profanity
 - [x] keepass
 - [x] terminal
   - [x] alacritty
   - [x] tmux
   - [x] taskwarrior
 - [x] shell
   - [x] fish
     - [x] fisher
     - [x] spacefish (prompt) with fisher
 - [x] editor
   - [x] vim
   - [x] vs-code
   - [x] sublime
 - [x] programming
   - [x] rust
   - [x] php
     - [x] composer
     - [x] php-pear / pecl
   - [x] jetbrains
   - [x] workspace
 - [x] docker
     - [x] docker-compose
 - [x] credentials
 - [x] browser
     - [x] Brave

