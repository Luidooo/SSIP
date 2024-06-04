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
		#echo $line #to see packages, descomenta
	done <$packagesFile
}

update() {
	count=0
	while IFS= read -r line; do
		count=$((count + 1))
	done <$packagesFile
	echo "Packages file are Update, you have $count packages!"
	echo "The last package is $package"
}

createFile
echo "Type the name of package you wanna add"
read package
echo "$package" >>$packagesFile
update
