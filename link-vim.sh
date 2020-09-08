#!/usr/bin/env zsh
vimrc=$HOME/.vimrc
viminit=$HOME/.config/nvim/init.vim
plugins=$HOME/.vim/plugins
langs=$HOME/.vim/langs
pwd=$(pwd)

if [ -e $vimrc ]; then
	rm -i $vimrc
fi

if [ -e $viminit ]; then
	rm -i $viminit
fi

if [ -e $plugins ]; then
	rm -i $plugins
fi

if [ -e $langs ]; then
	rm -i $langs
fi

# link init
echo "Linking init.vim..."
mkdir mkdir $(dirname $initvim) -p || true
ln -s ${PWD}/init.vim ${HOME}/.config/nvim/init.vim

# link plugins and langs
echo "Linking langs & plugins..."
mkdir mkdir $(dirname $langs) -p || true
ln -s ${PWD}/langs ${HOME}/.vim/langs
ln -s ${PWD}/plugins ${HOME}/.vim/plugins

# link vimrc
echo "Linking .vimrc ..."
ln -s ${PWD}/.vimrc ${HOME}/.vimrc