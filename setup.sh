# ------------------------------
# INSTALL SCRIPT
# ------------------------------
# stop if something fails
set -e

# /usr/local/bin does not exist on a fresh install
if [ ! "/usr/local/bin" ]; then
	sudo mkdir -p /usr/local/bin
fi

# ------------------------------
# INSTALL XCODE
# ------------------------------
if [ "$ (xcode-select --print-path)" ]; then
	echo Bypassing the install of xcode as it already exists on the machine
else
	echo Installing Xcode CLI tools

	# download and intall command line tools for xcode
	curl -O https://dl.dropboxusercontent.com/u/4119997/Setup/xcode462_cltools_10_86938259a.dmg && open xcode462_cltools_10_86938259a.dmg

	echo "Press enter once Command Line Tools for Xcode are installed"
  	read

  	# accept the xcode license
	sudo xcodebuild -license
fi

# ------------------------------
# INSTALL BREW
# ------------------------------
if [ "$ (which brew)" ]; then
	echo Bypassing the install of Brew as it already exists on the machine
else
	echo Installing brew
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
fi

# ------------------------------
# INSTALL NODE / NPM
# ------------------------------
if [ "$ (which node)" ]; then
	echo Bypassing the install of Node as it already exists on the machine
else
	echo Installing node and npm manager
	brew install node
fi

# ------------------------------
# INSTALL COMPOSER
# ------------------------------
if [ "$ (composer)" ]; then
	echo Bypassing the install of Composer as it already exists on the machine
else
	echo Installing Composer Globally for PHP dependency
	echo Updating your Brew install
	
	brew update

	echo Installing PHP 5.5 Dependency - Please wait as this may take a while

	brew install php55-intl

	echo Installing Composer

	brew install josegonzalez/php/composer
fi

# ------------------------------
# INSTALL YEOMAN
# ------------------------------
if [ "$ (which yo)" ]; then
	echo Bypassing the install of Yeoman as it already exists on the machine
else
	echo Installing yeoman
	sudo npm install -g yo
fi

# ------------------------------
# INSTALL SUBLIME TEXT 3
# ------------------------------
#read -p "Do you really want to install Sublime Text 3 on /usr/local? [Y/n]: " CONFIRM
#CONFIRM=$(echo "${CONFIRM}" | tr [a-z] [A-Z])
#if [[ "${CONFIRM}" = 'N' ]] || [[ "${CONFIRM}" = 'NO' ]]; then
#    echo Bypassing the install of sublime text 3
#else
#	echo Downloading sublime text 3
#fi

# ------------------------------
# OTHER TOOLS
# ------------------------------
brew install wget mtr iftop pv tmux

# completion message
echo You are ready to go!