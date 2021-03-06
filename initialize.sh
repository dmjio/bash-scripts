#!/usr/bin/env bash

export SH_CONFIG=$(cd $(dirname $0); echo $PWD)
(cd $SH_CONFIG && git submodule update --init)
ln -sfv ../.secrets $SH_CONFIG/secrets
ln -sfv $SH_CONFIG/oh-my-zsh $HOME/.oh-my-zsh
ln -sfv $SH_CONFIG/shrc.sh $HOME/.zshrc
ln -sfv $SH_CONFIG/shrc.sh $HOME/.bashrc
rm -f $SH_CONFIG/oh-my-zsh/oh-my-zsh
