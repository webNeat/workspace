function install_node {
	local packages="$1" 	# Packages to install globally
	# install node & npm
	curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
	sudo apt-get install -y nodejs
	# install global node packages
	sudo npm install -g $packages
}