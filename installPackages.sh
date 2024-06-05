#!/bin/bash

logDIR="$HOME/.SSIP_logs/"
packagesFile="$HOME/.packagesFile"

checkDir() {
	if [ -d $HOME/.SSIP_logs ]; then
		echo "SSIP directory for Packages logs already exists!"
		echo "Path: ~/.SSIP_logs/"
	else
		echo "Creating SSIP directory for Packages logs..."
		mkdir $HOME/.SSIP_logs
		echo "SSIP directory for Packages logs created!"
		echo "Paht: ~/.SSIP_logs/"
	fi
}

installPackages() {
	while IFS= read -r package; do
		sudo apt install $package >>$logDIR/$package.log
	done <$packagesFile
}

main() {
	checkDir
	sudo apt-get update -y >>"$logDIR/update.log"
	sudo apt-get upgrade -y >>"$logDIR/upgrade.log"
	installPackages
}

main
