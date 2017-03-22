function install_mysql { # requires post_install to be run
	echo "sudo apt-get -y install mysql-server" >> "$post_install_path"
}