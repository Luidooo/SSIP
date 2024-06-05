#!/bin/bash

packagesFile="$HOME/.packagesFile"

createFile() {
	if [ -f $packagesFile ]; then
		filesLines
		echo "Packages File exist! and has $count packages"
	else
		echo "Packages File dind't exist."
		echo "creating..."
		touch $HOME/.packagesFile
		echo "Packages File created!"
		echo "To remove packages, first you need to add packages..."
	fi
}

filesLines() {
	count=0
	while IFS= read -r line; do
		count=$((count + 1))
	done <$packagesFile
}

remove() {
	packageline=0
	find=$false
	while IFS= read -r line; do
		packageline=$((packageline + 1))
		if [ "$package" == "$line" ]; then
			echo "Package found on line $packageline!"
			sed -i "/$package/d" "$packagesFile"
		fi
		if [ $packageline == $count ]; then
			echo "Dint find the package :( "
			find=$true

		fi
	done <$packagesFile
}

createFile
echo "Type the name of package you wanna remove"
read package
remove
filesLines
echo "Packages file are Update, you have $count packages!"
echo "The peackage you remove is $package"
