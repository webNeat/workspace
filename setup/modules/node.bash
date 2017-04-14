function install_node {
	local version="$1" 		# 6.x or 7.x
	local packages="$2" 	# Packages to install globally
	# install node & npm
	curl -sL "https://deb.nodesource.com/setup_$version" | sudo -E bash -
	sudo apt-get install -y nodejs
	# install global node packages
	sudo npm install -g $packages
}