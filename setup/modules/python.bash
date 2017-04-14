function install_python {
	local version="$1"
	sudo apt-get install -y "python$version"
	sudo rm /usr/bin/python
	sudo ln -s $(which "python$version") /usr/bin/python
}
