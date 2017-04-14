# Global variables
setup_path="/setup"       # path to the setup folder on the vm
home_path="/home/ubuntu"  # the home directory in the vm
post_install_path="/vagrant/post_install" # post install script (for interactive commands)

# Creating the post install script
touch $post_install_path
chmod +x $post_install_path

# Copying dot-files
cp $setup_path/dot-files/.bash_aliases $setup_path/dot-files/.variables $home_path

# Including .variables file into .bashrc
echo "source $home_path/.variables" >> "$home_path/.bashrc"

# Updating packages
sudo apt-get update

# Installing common packages
sudo apt-get install -y curl unzip build-essential

# Define `use` function
function use {
	for module in "$@"; do
		source "$setup_path/modules/$module.bash"
	done
}