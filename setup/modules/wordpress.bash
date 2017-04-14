function install_wordpress {
	local db_name="$1"
	local db_user="$2"
	local db_pass="$3"
	wget -c http://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	sudo rsync -av wordpress/* /var/www/html/
	rm -rf wordpress
	rm latest.tar.gz
	cd /var/www/html
	sudo rm index.html
	sudo chown -R www-data:www-data .
	sudo chmod -R 755 .
	sudo mv wp-config-sample.php wp-config.php
	sudo sed -i -e "s/database_name_here/$db_name/g" wp-config.php
	sudo sed -i -e "s/username_here/$db_user/g" wp-config.php
	sudo sed -i -e "s/password_here/$db_pass/g" wp-config.php

	sudo apt-get install -y php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd
	sudo systemctl restart apache2.service
}
