## Install

### Arch-Linux

```make
sudo pacman -Sy && sudo pacman -S git make --noconfirm
git clone https://github.com/Dgame/dgame-system
make -f arch.mk [check|install]
```
### Manjaro

```make
sudo pacman -Sy && sudo pacman -S git make --noconfirm
git clone https://github.com/Dgame/dgame-system
make -f manjaro.mk [check|install]
```

### Windows 10 WSL (Ubuntu 18.04 / 20.04)

```make
sudo apt-get -y update && sudo apt-get -y install git make
git clone https://github.com/Dgame/dgame-system
make -f wsl.mk [check|install]
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
   - [x] starship (prompt)
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
     - [x] Firefox
