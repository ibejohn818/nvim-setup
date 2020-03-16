#!/usr/bin/env bash

PWD=$(pwd)


# first backup any current config/settings
if [ -f ${HOME}/.vimrc ]; then
    BDIR=${HOME}/jch-neovim-back
    rm -rf ${BDIR}/ || true
    mkdir ${BDIR} || true
    echo "BACKING UP SETTINGS TO ${BDIR}"

    mv -f ${HOME}/.vimrc ${BDIR}/

    if [ -d ${HOME}/.vim ]; then
        mv -f ${HOME}/.vim ${BDIR}/
    fi

    if [ -f ${HOME}/.config/nvim/init.vim ]; then
        mv -f ${HOME}/.config/nvim/init.vim ${BDIR}/
    fi
fi

echo "INIT Submodules..."
git submodule init
echo "Update Submodules..."
git submodule update

# link init
echo "Linking init.vim..."
mkdir ${HOME}/.config/nvim -p || true
ln -s ${PWD}/init.vim ${HOME}/.config/nvim/init.vim

# link plugins and langs
echo "Linking langs & plugins..."
mkdir ${HOME}/.vim || true
ln -s ${PWD}/langs ${HOME}/.vim/langs
ln -s ${PWD}/plugins ${HOME}/.vim/plugins

# link vimrc
echo "Linking .vimrc ..."
ln -s ${PWD}/.vimrc ${HOME}/.vimrc

echo "CONFIG SETUP COMPLETE...."



