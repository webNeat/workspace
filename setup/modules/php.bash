function install_php {
	# $@ contains the packages to install globally
	# it can include: phpunit, codeception

	# install php
	sudo apt-get install -y php php-cli php-xml php-curl php-mbstring php7.0-sqlite libapache2-mod-php

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
		else
			echo "Trying to install unknown PHP package: '$package'"
    	fi
	done
}