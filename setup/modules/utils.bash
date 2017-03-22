function set_hostname {
	echo "sudo hostname $1" >> "$home_path/.bashrc"
	echo "127.0.1.1  $1" >> "/etc/hosts"
}