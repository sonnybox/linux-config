#!/bin/bash
cp -r ~/.config/alacritty ./
cp -r ~/.config/hypr ./
cp -r ~/.config/fish ./
cp -r ~/.config/easyeffects/output ./easyeffects
cp -r ~/.config/rofi ./
cp -r ~/.config/starship.toml ./
cp -r ~/.bin ./

cd nvim
git submodule init
git submodule update

cd ..
git add .
GIT_EDITOR=nvim git commit
