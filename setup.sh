
# stop if something fails
set -e

# /usr/local/bin does not exist on a fresh install
if [! -d "/usr/local/bin"]; then
	sudo mkdir -p /usr/local/bin
fi