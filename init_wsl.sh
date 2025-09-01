#!/usr/bin/bash

create_user() {
	if ! id $1 &>/dev/null; then
		useradd -m -g users -G wheel $1
	fi
	set_password $1 $2
}

set_password() {
	echo "$1:$2" | chpasswd
}

main() {
	ROOT_PASSWORD=""
	USERNAME=""
	PASSWORD=""

	if [[ $# -eq 0 ]]; then
		echo "No arguments passed"
		exit 1
	fi
	while [[ $# -gt 0 ]]; do
		case "$1" in
			--root_password)
				ROOT_PASSWORD="$2"
				shift 2
				;;
			--username)
				USERNAME="$2"
				shift 2
				;;
			--password)
				PASSWORD="$2"
				shift 2
				;;
			*)
				echo "idk boomer"
				exit 1
				;;
		esac
	done

	pacman -S sudo --noconfirm

	set_password "root" $ROOT_PASSWORD
	create_user $USERNAME $PASSWORD

	sed -i '/%wheel ALL=(ALL:ALL) ALL/s/^# //' /etc/sudoers
	echo -e "\n[user]\ndefault=$USERNAME" >> /etc/wsl.conf
	sed -i '/en_US.UTF-8/s/^#//' /etc/locale.gen
	locale-gen
}

main $@
