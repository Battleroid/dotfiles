#!/bin/bash

# Battleroid / Casey Weed
# If you have questions, issues, concerns or want to make this less shitty
# looking and performing, be my guest and voice them on the github dealio.

# Pick your colorscheme

user=$(whoami)
if [ $user != "root" ]; then
	echo "Must be run as root!"
	exit 1
fi

cmd=(whiptail --separate-output --title "Choose colorschemes" --checklist "Pick options to install" 10 60 5)
options=(calmar256-light "" off \
	jellybeans "" on)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
	case $choice in 
		calmar256-light)
			calmar=true
			echo "Calmar selected"
			;;
		jellybeans)
			jellybeans=true
			echo "Jellybeans selected"
			;;
	esac
done

if [[ -z "$calmar" ]]; then
	calmar=false
fi

if [[ -z "$jellybeans" ]]; then
	jellybeans=false
fi

# One of these may not be necessary, I can't remember, don't hate me

packages=(wget bzip2 tar build-essential cmake python python-dev ruby ruby-dev libncurses5-dev git git-core)
get=()

# Check dependencies

for i in "${packages[@]}"
do
	dpkg -s $i >/dev/null 2>&1
	if [ $? != 0 ]; then
		get+=($i)
	fi
done

if [ ${#get[@]} -ne 0 ];  then
	apt-get install -y `printf "%s " "${get[@]}"`
fi

# Get Python version

case "$(python --version 2>&1)" in
	*" 3."*)
		echo "Python version is too new (3)"
		exit 1
		;;
	*" 2.7"*)
		echo "Python version is correct (2.7)"
		python="2.7"
		;;
	*" 2.6"*)
		echo "Python version is correct (2.6)"
		python="2.6"
		;;
esac

# Grab Vim archive, need a good way of figuring out the latest version, so
# it does not need to be specified each time.

TMPDIR=$(mktemp -d vim.XXXX)
cd $TMPDIR
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxf vim-7.4.tar.bz2
cd vim74/src/

# Configure, make, and install

./configure --enable-pythoninterp \
	--with-python-config-dir=/usr/lib/python${python}/config \
	--enable-rubyinterp \
	--with-features=huge

make
make install

# Cleanup, optional

# cd ../../../
# rm -rf $TMPDIR 

# Get and install Vundle, my vimrc, jellybeans and calmar256-light

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir ~/.vim/colors ~/.vim/autoload ~/.vim/plugin
wget https://raw.github.com/Battleroid/dotfiles/master/.vimrc -O ~/.vimrc

if $calmar ; then
	wget http://www.calmar.ws/dotfiles/dotfiledir/calmar256-light.vim -O ~/.vim/colors/calmar256-light.vim
fi

if $jellybeans ; then
	wget https://raw.github.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -O ~/.vim/colors/jellybeans.vim
fi

# Make Vundle install everything

echo "Warning: There will be a bunch of error messages, just ignore them!"
read -n1 -r -p "Press any key to continue..." key
vim +BundleInstall +qall

# clang_complete needs to be made

cd ~/.vim/bundle/clang_complete/
make install

cd ~
