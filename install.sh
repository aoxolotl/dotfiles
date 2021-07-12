#!/bin/bash
# copy files to user folder
cp -i .bashrc $HOME
cp -i .bash_aliases $HOME
cp -i .tmux.conf $HOME
cp -i .vimrc $HOME

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
