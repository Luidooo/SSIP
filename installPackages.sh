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

readPackages() {
	while IFS= read -r package; do
		echo "$package"
	done <packagesFile
}

main() {
	checkDir
	readPackages
	#sudo apt-get update -y >>"$logDIR/update.log"
	#sudo apt-get upgrade -y >>"$logDIR/upgrade.log"
}

main
