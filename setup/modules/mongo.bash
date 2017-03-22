function install_mongo {
	local service_file_path="$1" 	# The mongodb service file path
	if [[ -z "$service_file_path" ]]; then
		service_file_path="$setup_path/files/mongodb.service"
	fi
	# install mongodb
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
	echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
	sudo apt-get update
	sudo apt-get install -y mongodb-org --allow-unauthenticated
	sudo cp "$service_file_path" /etc/systemd/system/mongodb.service
	sudo systemctl start mongodb
	sudo systemctl enable mongodb
}