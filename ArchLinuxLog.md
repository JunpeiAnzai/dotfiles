# ctrl-caps swapping
edit `.profile`

    setxkbmap -option ctrl:swapcaps
    ln -s ~/dotfiles/.profile ~/.profile
	
# fcitx
due to confliction to mozc-emacs, deleted.
edit `/etc/locale.gen` coment-off

    ja_JP.UTF-8
and

    sudo locale-gen
    gsettings set org.gnome.settings-daemon.plugins.keyboard active false

in `~/dotfiles/.xprofile`
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS="@im=ibus"

deleted.
# ibus-mozc
    gsettings set org.gnome.settings-daemon.plugins.keyboard active true
	yaourt -S mozc

# system font

    yaourt -S ttf-migmix
	yaourt -S otf-ipaexfont
	yaourt -S ttf-linux-libertine
	yaourt -S ttf-vlgothic
	yaourt -S source-han-sans
	
create/edit `~/dotfiles/.fonts.conf`

    ln -s ~/dotfiles/.fonts.conf ~/.fonts.conf

# latex environment

    yaourt -S texlive-most
    yaourt -S texlive-langcjk
stab  

# oh-my-zsh
deleted.

    yaourt -S wget
    wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# tmux
    pacman -S tmux

## tmux-mem-cpu-load
    yaourt -S tmux-mem-cpu-load
edit `.tmux.conf` and,

    tmux -source ~/.tmux.conf
	
# solarlized
## terminal(xterm)
    wget https://raw.githubusercontent.com/altercation/solarized/master/xresources/solarized
    mv solarized ~/dotfiles/.Xresources
    ln -s ~/dotdiles/.Xresources ~/.Xresources
    xrdb ~/.Xresources
check xterm.  

## terminal(gnome-terminal)
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git

## tmux
    git clone https://github.com/seebi/tmux-colors-solarized.git
create & edit `.tmux.conf`

    set-option -g prefix C-t
and at terminal,

    tmux source-file ~/.tmux.conf
      
## emacs
    git clone https://github.com/sellout/emacs-color-theme-solarized.git
    cp -r emacs-color-theme-solarized ~/.emacs.d/theme/
edit ~/.emacs.d/init.el

    (add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
    (load-theme 'solarized-dark t t) 


# tmux-powerline

    yaourt -S bc
	
    git clone https://github.com/erikw/tmux-powerline.git
edit `.tmux.conf`

    set-option -g status on
    set-option -g status-interval 2
    set-option -g status-utf8 on
    set-option -g status-justify "centre"
    set-option -g status-left-length 60
    set-option -g status-right-length 90
    set-option -g status-left "#(~/path/to/tmux-powerline/powerline.sh left)"
    set-option -g status-right "#(~/path/to/tmux-powerline/powerline.sh right)"
http://matsu.teraren.com/blog/2013/02/10/moteru-tmux-powerline/

# source-highlight
    yaourt -S source-highlight

# ricty
    yaourt -S fontforge
download Inconsolata and Migu1M.

    git clone https://github.com/yascentur/Ricty.git
    ./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf
    mkdir ~/.fonts
    cp -f Ricty*.ttf ~/.fonts/
    fc-cache -vf

## patch powerline font for Ricty
    git clone https://github.com/Lokaltog/vim-powerline.git
    fontforge -lang=py -script ./vim-powerline/fontpatcher/fontpatcher $HOME/.fonts/Ricty-Regular.ttf
    fontforge -lang=py -script ./vim-powerline/fontpatcher/fontpatcher $HOME/.fonts/Ricty-Bold.ttf
    mv Ricty-Regular-Powerline.ttf ~/.fonts
    mv Ricty-Bold-Powerline.ttf ~/.fonts
    fc-cache -fv

# disable cursor blink
    gsettings set org.gnome.desktop.interface cursor-blink false

# mercurial
    
# emacs
## mozc.el
    yaourt -Ss mozc
conflict to mozc-fcitx. remove mozc-fcitx.

## twittering-mode
    git clone git://github.com/hayamiz/twittering-mode.git
    cp twittering-mode.el ~/.emacs.d/lisp/

## Undo-Tree
`package-install` and choose `undo-tree`.  
edit `init.el`

    (require 'undo-tree)
    (global-undo-tree-mode)

## undohist
`auto-install-from-url`
    http://cx4a.org/pub/undohist.el

edit `init.el`
    (require 'undohist)
	(undohist-initialize)
## solarized
goto solarized section.
stab  

## auto-complete.el
add repositories

    (add-to-list 'package-archives 
        '("marmalade" .
          "http://marmalade-repo.org/packages/"))
    (add-to-list 'package-archives
      '("melpa" . "http://melpa.milkbox.net/packages/") t)
    (package-initialize)

and `package-refresh-contents`. 
`install-package` and choose `auto-complete`.

    hg clone https://bitbucket.org/tequilasunset/auto-complete-latex
    cp -r auto-complete-latex ~/.emacs.d/lisp/

add f90 dictionary
    ln -s ~/dotfiles/f90-mode ~/.emacs.d/elpa/auto-complete-1.4/dict/f90-mode
## markdown-mode.el
first,

    yaourt -S markdown

`package-install` and choose `markdown-mode`

## yatex
    hg clone http://www.yatex.org/hgrepos/yatex yatex
edit `makefile` line 6

    -- PREFIX = /usr/local
	++ PREFIX = /usr
	sudo make install

## flymake
`package-install` and choose `flymake`

### flymake for fortran
stab

## magit
`package-install` and choose `magit`

## popwin

	git clone https://github.com/m2ym/popwin-el.git
	cp popwin.el ~/.emacs.d/lisp/

edit `init.el`

    (require 'popwin)
	(setq display-buffer-function 'popwin:display-buffer)


## direx

    git clone https://github.com/m2ym/direx-el.git
    cp direx* ~/.emacs.d/lisp/

edit `init.el`

    (require 'direx)
	(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

after installation `popwin.el`,

    (push '(direx:direx-mode :position left :width 25 :dedicated t)
	      popwin:special-display-config)
    (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


## ctxmenu
`package-install` from melpa, `ctxmenu`  
edit `init.el`

    (require 'ctxmenu)
    (require 'ctxmenu-config)
    (define-key global-map (kbd "M-@") 'ctxmenu:show)

## deferred and inertial-scroll
eval

    (auto-install-from-url "http://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
	(auto-install-from-url "http://github.com/kiwanami/emacs-inertial-scroll/raw/master/inertial-scroll.el")

and edit init.eln

# aspell
create `.aspell.conf` and edit

    lang en US
and,

    ln -s ~/dotfiles/.aspell.conf ~/.aspell.conf

# make github key
    mkdir ~/.ssh/github
	ssh-keygen
	mv id_rsa.github.com* ~/.ssh/github/
edit ~/.ssh/config

    Host github.com
      Compression yes
      IdentityFile ~/.ssh/github/id_rsa.github.com
	  User git
and test connection,

    ssh-add ~/.ssh/github/id_rsa.github.com
    ssh -T git@github.com

# chromium
## font rendoring
edit `~/dotfiles/fonts.conf`

    <match target="font">
      <edit mode="assign" name="autohint"><bool>true</bool></edit>
      <edit mode="assign" name="hinting"><bool>true</bool></edit>
      <edit mode="assign" name="hintstyle"><const>hintslight</const></edit>
    </match>

and

	ln -s ~/dotfiles/fonts.conf ~/.config/fontconfig/fonts.conf

## flash plugin
    yaourt -S chromium-pepper-flash

## pdf plugin
    yaourt -S chromium-libpdf

# Intel parallel Studio XE
first, you have to get license file *.lic.  
since package cache exceeds memory size of PC (`tmpfs` directory `/tmp`), mount `/tmp` in `ext4` and reboot.
in `/etc/fstab`,

    UUID=76a969c1-ba28-4b7e-848f-8c915fbcaa9b       /tmp               ext4            rw,relatime,data=ordered 0 1  
and,

    yaourt -S intel-parallel-studio-xe
	
after installation and license activation, add to `/dotfiles/orig.zsh`

    source /opt/intel/pkg_bin/compilervars.sh intel64
final, recover `/etc/fstab` configuration.

# gcc-fortran
    yaourt -S gcc-fortran

# zukitwo-theme
    yaourt -S zukitwo-themes
	yaourt -S ttf-droid
    yaourt -S gnome-tweak-tool

ttf-droid conflicts ttf-google-fonts
# profile-sync-daemon
    yaourt -S profile-sync-daemon
edit `/etc/psd.conf`

    sudo systemctl enable psd psd-resync
	sudo systemctl start psd psd-resync
check whether psd runs properly or not,
    profile-sync-daemon parse

# dropbox
    yaourt -S dropbox
	yaourt -S nautilus-dropbox

edit `.profile`, add `dropboxd &`

# mendeleydesktop
    yaourt -S mendeleydesktop
	
# gvfs-smb
    yaourt -S gvfs-smb
nautilus doesn't show windows network automatically?  
stab

# ntfs-3g
    yaourt -S ntfs-3g


# wifi
https://wiki.archlinux.org/index.php/Lenovo_Ideapad_G580
need?  

    yaourt -S wireless_tools

    iw link set wlp2s0 up
    yaourt -S dhclient

edit `/etc/netctl/wlp2s0-ssid

    ForceConnect=yes
	DHCPClient='dhclient'

and connect,

    # netctl start wlp2s0-ssid

startup

    # netctl enable wlp2s0-ssid
    

# hdparm
    yaourt -S hdparm

# SSD TRIM support
edit `/etc/fstab`, add option `discard`

# NetworkManager
    sudo systemctl disable netctl
	sudo systemctl disable netctl@ssid
	sudo systemctl enable NetworkManager NetworkManager-dispatcher ModemManager
	sudo systemctl start NetworkManager NetworkManager-dispatcher ModemManager

# suspend when laptop lid is closed.
    edit `/etc/systemd/logind.conf`
    HandleLidSwitch=Suspend

or,

    yaourt -S acpid
	edit `/etc/acpi/handler.sh`
	systemctl restart acpid

# gnuplot
    yaourt -S gnuplot
edit `init.el`, enable gnuplot-mode.

# japanese in pdf (under using pdf viewer evince)
    yaourt -S xpdf-languages
	yaourt -S poppler-data

# mpd
    yaourt -S mpd mpc
	chown -R mpd /var/lib/mpd

edit `/etc/mpd.conf`

# ncmpcpp
    yaourt -S ncmpcpp
    ln -s ~/dotfiles/ncmpcpp_config ~/.ncmpcpp/config
## edit keybindings
    sudo cp /usr/share/ncmpcpp/keys ~/dotfiles/ncmpcpp_keys
    ln -s ~/dotfiles/ncmpcpp ~/.ncmpcpp/keys

# alsa
    yaourt -S alsa-utils

# microsoft fonts
    yaourt -S ttf-ms-fonts

# google fonts
    yaourt -S ttf-google-fonts-git

# scheme
    yaourt -S gauche
	yaourt -S quack

# teamviewer9
edit `/etc/pacman.conf`. uncomment multilib repository(2 lines).  

    yaourt -S teamviewer

# golang
    yaourt -S go

## peco
    go get github.com/lestrrat/peco/cmd/peco/

# colordiff
    yaourt -S colordiff

edit `.zshrc`

# softwere access point

    yaourt -S hostapd

edit `/etc/hostapd/hostapd.conf`


## increase entropy

    yaourt -S haveged
	sudo systemctl enable haveged

## virtualbox

    yaourt -S virtualbox qt4
	modprobe vboxdrv
	modprobe vboxnetadp
	modprobe vboxnetflt
	modprobe vboxpci
	gpasswd -a $USER vboxusers


