function install_php {
	# $@ contains the packages to install globally
	# it can include: phpunit, codeception, robo

	# install php
	sudo apt-get install -y php php-cli php-xml php-curl php-mysql php-mbstring php-sqlite libapache2-mod-php php-cgi php-gd

	# install composer
	wget https://getcomposer.org/composer.phar
	chmod +x composer.phar
	sudo mv composer.phar /usr/local/bin/composer

	for package in "$@"; do
    	if [[ $package == "phpunit" ]]; then
			wget https://phar.phpunit.de/phpunit.phar
			chmod +x phpunit.phar
			sudo mv phpunit.phar /usr/local/bin/phpunit
    	elif [[ $package == "codeception" ]]; then
			wget http://codeception.com/codecept.phar
			chmod +x codecept.phar
			sudo mv codecept.phar /usr/local/bin/codecept
    	elif [[ $package == "robo" ]]; then
			wget http://robo.li/robo.phar
			chmod +x robo.phar
			sudo mv robo.phar /usr/local/bin/robo
		else
			echo "Trying to install unknown PHP package: '$package'"
    	fi
	done
}
