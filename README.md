## Install

```make
git clone https://github.com/Dgame/dgame-system
sudo pacman -Sy && yes | LC_ALL=en_US.UTF-8 sudo pacman -S make
make -f arch [check|install]
yes | LC_ALL=en_US.UTF-8 sudo pacman -Syu
```

## Test with vagrant

```bash
vagrant up [archlinux|manjaro]
```

or

```bash
vagrant provision [archlinux|manjaro] --provision-with test
```

or use the _Makefile_:
 - `make up [os=$os]` will execute `vagrant up $os`
 - `make down [os=$os]` will execute `vagrant destroy $os`
 - `make again [os=$os]` will execute `vagrant reload $os`
 - `make test [os=$os]` will execute `vagrant provision $os --provision-with test`

## Plugins:
 - `aur` plugin from https://github.com/kewlfft/ansible-aur
 - `yay` plugin from https://github.com/mnussbaum/ansible-yay

----

 - [x] git
 - [x] Fira-Code
 - [x] profanity
 - [x] keepass
 - [x] terminal
   - [x] alacritty
   - [x] tmux
     - [x] xclip
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
     - [x] Google-Chrome


