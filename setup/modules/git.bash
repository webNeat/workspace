function install_git {
	local username="$1" 	# the user's full name
	local email="$2" 		# the user's email
	local editor="$3" 		# the interactive editor
	# install git
	sudo apt-get install -y git
	# configure git
	if [[ -n "$username" ]]; then
		git config --global user.name "$username"
	fi
	if [[ -n "$email" ]]; then
		git config --global user.email "$email"
	fi
	if [[ -n "$editor" ]]; then
		git config --global core.editor "$editor"
	fi
	# generate a new ssh-key using the same email
	cat /dev/zero | ssh-keygen -t rsa -b 4096 -C $email -q -N ""
}