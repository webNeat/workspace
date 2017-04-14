function install_mysql { # requires running post_install
	echo "sudo apt-get -y install mysql-server" >> "$post_install_path"
	echo "cp $setup_path/dot-files/.my.cnf $home_path" >> "$post_install_path"
}

function mysql_create_db { # after install_mysql, requires running post_install
	local db_name="$1"
	local db_user="$2"
	local db_pass="$3"
	local query="CREATE DATABASE $db_name; GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost' IDENTIFIED BY '$db_pass'; FLUSH PRIVILEGES;"
	echo "echo \"$query\" | mysql" >> "$post_install_path"
	echo "sudo systemctl restart mysql.service" >> "$post_install_path"
}
