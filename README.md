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

- [Documentation](https://docs.microsoft.com/de-de/windows/wsl/install-win10)
  - `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
  - `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
  - `wsl --set-default-version 2`

- [Windows-Terminal Documentation](https://docs.microsoft.com/en-us/windows/terminal/)
  - [Settings.json](https://gist.github.com/Dgame/0504db67cfdcac8d8dea01c633ba4db1)

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
