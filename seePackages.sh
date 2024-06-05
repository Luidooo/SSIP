#!/bin/bash

packagesFile="$HOME/.packagesFile"

allPackages() {
	while IFS= read -r line; do
		echo $line
	done <$packagesFile
}

seePackages() {
	if [ -f $packagesFile ]; then
		filesLines
		echo "You have $count Packages!"
		echo ""
		allPackages
		echo ""
		echo "To add more packages call 'addPackages' "
	else
		echo "Packages File dind't exist."
		echo "creating..."
		touch $HOME/.packagesFile
		echo "Packages File created!"
		echo "You have to call 'addPackages' to add Packages"
	fi
}

filesLines() {
	count=0
	while IFS= read -r line; do
		count=$((count + 1))
	done <$packagesFile
}

seePackages
