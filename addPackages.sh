#!/bin/bash

packagesFile="$HOME/.packagesFile"

createFile() {
	if [ -f $packagesFile ]; then
		filesLines
		echo "Packages File exist! and has $count lines"
	else
		echo "Packages File dind't exist."
		echo "creating..."
		touch $HOME/.packagesFile
		echo "Packages File created!"
	fi
}

filesLines() {
	count=0
	while IFS= read -r line; do
		count=$((count + 1))
		echo $count
	done <$packagesFile
}

createFile
