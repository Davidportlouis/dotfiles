#!/bin/bash

dir=$(pwd)
# setting up tools
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git tmux vim 
cd "$HOME" || exit
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs

cd "$dir" || exit
trueline="trueline"
folders=("bash" "git" "vim" "tmux" "trueline" "node")
files="bashrc gitconfig vimrc tmux.conf trueline npmrc"
i=0
for file in $files; do
    if test -e "$HOME/.$file"; then
        if test -d "$HOME/.$file"; then
            rm -rf "$HOME/.$file"
            echo "Setting Up $file..."
	    cp -r "$(pwd)/$file" "$HOME/.$file"
        fi
        rm -rf "$HOME/.$file"
        echo "Setting Up $file..."
        if [[ "$file" = "$trueline" ]]; then
            cp -r "$(pwd)/$file" "$HOME/.file"
        else
	    cp "$(pwd)/${folders[i]}/.$file" "$HOME/"
        fi
    else
        echo "$HOME/.$file does not exist"
	echo "Setting Up $file..."
	if [[ "$file" = "$trueline" ]]; then
		cp -r "$(pwd)/$file" "$HOME/.$file"
	else
		cp "$(pwd)/${folders[i]}/.$file" "$HOME/"
	fi
    fi
    ((i++))
done


