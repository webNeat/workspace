function install_nginx {
	# install nginx
	sudo apt-get install -y nginx
	# configure nginx
	sudo update-rc.d nginx defaults
	sudo service nginx restart
}