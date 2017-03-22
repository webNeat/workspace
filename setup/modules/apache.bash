function install_apache {
    sudo apt-get install -y apache2
    sudo systemctl restart apache2
}