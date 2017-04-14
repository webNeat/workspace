function install_sublime { # requires git to be installed
	# install sublime build #3126
	wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
	sudo dpkg -i sublime-text_build-3126_amd64.deb
	sudo apt-get install -y -f
	rm sublime-text_build-3126_amd64.deb
	# install packages control
	# wget "https://packagecontrol.io/Package%20Control.sublime-package"
	# mv "Package%20Control.sublime-package" ~/.config/sublime-text-3/
	# for package in "$@"; do
 #    	if [[ $package == "phpunit" ]]; then

 #    	elif [[ $package == "codeception" ]]; then

	# 	else
	# 		echo "Trying to install unknown Sublime package: '$package'"
 #    	fi
	# done
}
