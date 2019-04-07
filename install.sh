#!/bin/bash

if (( UID != 0 )); then
	printf "privilege escalation required\n"
	su -c 'hash git >/dev/null 2>&1 || pacman -Syy git
	git clone --depth=1 https://bitbucket.org/archlabslinux/installer && cp -fv installer/archlabs-installer /usr/bin/ && rm -rf installer'
else
	hash git >/dev/null 2>&1 || pacman -Syy git
	git clone --depth=1 https://bitbucket.org/archlabslinux/installer && cp -fv installer/archlabs-installer /usr/bin/ && rm -rf installer
fi

[ $? -eq 0 ] && printf "\nInstall complete\n"
