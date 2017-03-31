function install_apache {
	# $@ should contain the modules to enable
    sudo apt-get install -y apache2
	for module in "$@"; do
		sudo a2enmod $module
	done
    sudo systemctl restart apache2
}