#!/bin/sh
#firstly, install dropbox.
#---------- mendeleydesktop ------
sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:ubuntu-wine/ppa
sudo add-apt-repository -y ppa:marlin-devs/marlin-daily
sudo apt-add-repository -y ppa:starws-box/deadbeef-player
sudo add-apt-repository -y ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get -y install emacs zsh texlive byobu source-highlight ibus-mozc mozc-server mozc-utils-gui emacs-mozc emacs-mozc-bin ibus-el fontforge gpicview monkeytail alien xdvik-ja xorg-dev ubuntu-tweak wine linux-headers-generic ttf-inconsolata ttf-takao build-essential omake omake-doc git marlin deadbeef-player ap-hotspot yatex auto-complete-el easypg mercurial gitk
export LESS='-R'
export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s'
#---------- cocot ----------------
cd ~/
git clone https://github.com/vmi/cocot
cd cocot
./configure
make
sudo make install
#--------- emacs -----------------
cp -r ~/Dropbox/.emacs.d ~/
cd ~/.emacs.d
hg clone https://bitbucket.org/tequilasunset/auto-complete-latex
git clone https://github.com/hayamiz/twittering-mode.git
#--------- zsh -------------------
# need check
cp ~/Dropbox/.zshrc ~/
git clone https://github.com/robbyrussell/oh-my-zsh
#--------- Ricty -----------------
cd ~/
git clone https://github.com/yascentur/Ricty

#---------- directory name -----------
LANG=C xdg-user-dirs-gtk-update
#mendeley desktop, google-chrome
#/usr/share/X11/xorg.conf.d/50-synaptics.conf
## This option enables three-point-fingar swipe
#Section "InputClass"
#        Identifier "enable synaptics SHMConfig"
#        Driver "synaptics"
#        MatchIsTouchpad "on"
#        MatchDevicePath "/dev/input/event*"
#        Option "SHMConfig" "on"
#EndSection
#cpan
#cpan install Time::HiRes and X11:GUITest
#gnome-session-properties
#add gesture~.pl
#system setting -> keybord
#disable cursor blink
