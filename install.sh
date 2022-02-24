#!/bin/sh
#	         ___            __        ____        __
#	       _/_(_)___  _____/ /_____ _/ / /  _____/ /_
#	     _/_// / __ \/ ___/ __/ __ `/ / /  / ___/ __ \
#	 _ _/_/ / / / / (__  ) /_/ /_/ / / /_ (__  ) / / /
#	(_)_/  /_/_/ /_/____/\__/\__,_/_/_/(_)____/_/ /_/
# 		Made by Stefan9110 for Arch Linux dotfiles

# Path for the local repo
CURRENT_PATH="$(dirname $(realpath $0))"
# Path for the backup directory
BACKUP="$CURRENT_PATH/backup/$(date +%d%b%Y-%H:%M:%S)"

# Get current set config dir; XDG Base Directories support
function config_dir() {
	if [ ! -z "$XDG_CONFIG_HOME" ]; then
		echo $XDG_CONFIG_HOME
		return
	fi
	echo "$HOME/.config"
}

# Get path for binaries
function bin_dir() {
	echo "$HOME/.local/bin"
}

# Function used to create a symbolic link of a config file & backup any existing config files
# $1 -> file name
# $2 -> install directory
# $3 -> local directory
function link_file() {
	# Check if config file already exists. If yes, make a backup
	if [ -d "$2/$1" ] || [ -f "$2/$1" ] || [ -L "$2/$1" ]; then
		# Only create backup directory if needed
		if [ ! -d "$BACKUP" ]; then
			mkdir -p "$BACKUP"
		fi

		echo "File $2/$1 already exists. Moving it to $BACKUP"
		mv "$2/$1" "$BACKUP"
	fi

	# Create the symbolic link
	echo "Creating symlink for $3/$1 --> $2/$1"
	ln -s "$3/$1" "$2/$1"
}

function install_dots() {
	# Configure directories
	BIN_DIR="$(bin_dir)"
	CONFIG_DIR="$(config_dir)"
	ZSH_DIR="$ZDOTDIR"

	if [ -z $ZSH_DIR ] || [ ! -d $ZSH_DIR ]; then
		ZSH_DIR="$HOME"
	fi

	if [ ! -d $BIN_DIR ]; then
		echo "Creating $BIN_DIR"
		mkdir -p $BIN_DIR
	fi

	if [ ! -d $CONFIG_DIR ]; then
		echo "Creating $CONFIG_DIR"
		mkdir -p $CONFIG_DIR
	fi

	# Link all config files
	for conf in $(ls -A "$CURRENT_PATH/.config"); do
		link_file $conf "$CONFIG_DIR" "$CURRENT_PATH/.config"
	done

	for executable in $(ls -A "$CURRENT_PATH/.local/bin"); do
		link_file $executable "$BIN_DIR" "$CURRENT_PATH/.local/bin"
	done

	mkdir -p "$CONFIG_DIR/vim"
	link_file ".zshrc" "$ZSH_DIR" "$CURRENT_PATH"
	link_file "vimrc" "$CONFIG_DIR/vim" "$CURRENT_PATH"
	
	# Copy fonts to local share dir
	if [ ! -d "$HOME/.local/share/fonts" ]; then
		echo "Installing fonts..."
		mkdir -p "$HOME/.local/share/fonts"
		cp -r "$CURRENT_PATH/.local/share/fonts" "$HOME/.local/share/fonts"
	fi
}

# Main part
echo "You are about to install Stefan9110/dotfiles! Current directory is $CURRENT_PATH. Note that changing this directory's path will require a reinstall for the dotfiles" 

read -p "Do you want to proceed? [y/N] " -n 1 -r

if [[ ! "$REPLY" =~ [yY] ]]; then
	exit 1
fi

echo
install_dots
