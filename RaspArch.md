# enable sshd socket

    systemctl start sshd.socket
    systemctl enable sshd.socket

# resize sd card partition
http://raspberry-hosting.com/en/faq/cras-quis-nibh

# recognize wifi dongle
http://uls.self.jp/blog/freebsd/archives/2012/03/ubuntu-1110-wli-uc-gnpusblan.html

# enable auto connect to wifi
`netctl-auto` and `netctl enable` will be conflict.
https://wiki.archlinux.org/index.php/Raspberry_Pi

    pacman -S iw dhclient
	netctl enable wlan0@~~~

# turn off wifi power management
https://bbs.archlinux.org/viewtopic.php?id=161801
http://lowreal.net/2014/01/09/1

# move /var/log to RAM
https://wiki.archlinux.org/index.php/Raspberry_Pi


edit `/etc/fstab`

    tmpfs   /var/log        tmpfs   nodev,nosuid,size=16M   0       0

and
    rm -R /var/log
	reboot

# samba
http://obihoernchen.net/wordpress/877/setup-samba-4-on-arch-linux/

    pacman -S samba
	systemctl enable smbd nmbd
	
edit `/etc/sambda/smb.conf`

# util for NTFS
    pacman -S ntfs-3g


# mediatomb
https://wiki.archlinux.org/index.php/MediaTomb


    pacman -S mediatomb


    systemctl start mediatomb
    systemctl enable mediatomb	

edit `/var/lib/mediatomb/.mediatomb/config.xml`
http://plamo.linet.gr.jp/~matsuki/linux/glantank/dlna.html

    systemctl restart mediatomb

access `host:50500` and edit settings

# mysql(mariadb)

    pacman -S mariadb

    systemctl start mysqld
	systemctl enable mysqld


# ntpd

    systemctl start ntpd
	systemctl enable ntpd

