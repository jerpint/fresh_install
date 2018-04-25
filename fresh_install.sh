#!/bin/bash

sudo apt update
sudo apt upgrade

# download chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f

# Download google play music+install

# git

sudo apt install git

# install atom

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update; sudo apt install atom

sudo apt install geomview

# configure git
ssh-keygen -t rsa -C "jeremy@focus21.io" -b 4096

# add new ssh key:
# cat ~/.ssh/id_rsa.pub
git config --global user.name "Jeremy Pinto"
git config --global user.email "jeremy@focus21.io"
git config --global push.default simple

# sudo apt install python-pip
# sudo pip install virtualenv
# sudo pip install pew
# sudo pip install pipenv

# install docker : https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository


sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce


# install docker-compose : https://docs.docker.com/compose/install/#install-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose



sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart




# node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt-get install -y nodejs
sudo npm install npm -g
sudo apt install yarn

sudo apt install terminator

sudo apt install postgresql-client-common
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install postgresql-client

sudo apt install python3-pip

sudo pip3 install virtualenv
sudo pip3 install pew
sudo pip3 install pipenv
sudo pip3 install jupyter
sudo pip3 install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6 python3.6-dev

sudo apt-get install exfat-fuse exfat-utils

sudo apt-get install default-jre

sudo apt install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh

cd
git clone git://github.com/joelthelion/autojump.git
cd autojump ./install.py


#sudo apt install i3
#sudo apt install i3blocks
#rm ~/.config/i3/config && ln -s ~/fresh_install/dotfiles/i3_config ~/.config/i3/config
#
#sudo apt install help2man
#git clone https://github.com/haikarainen/light.git
#cd light
#sudo make
#sudo make install


mkdir ~/.git_files
sudo cp ~/fresh_install/dotfiles/git-prompt.sh ~/.git_files/
sudo cp ~/fresh_install/dotfiles/diff-so-fancy ~/.git_files/
chmod +x ~/.git_files/diff-so-fancy

git config --global core.pager "~/.git_files/diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

echo 'alias jpnb="jupyter notebook"' >> ~/.bashrc

echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc

# Git prompt (add branch name to terminal display)                                                 
echo 'export GIT_PS1_SHOWDIRTYSTATE=1' >> ~/.bashrc
echo 'export GIT_PS1_SHOWCOLORHINTS=true' >> ~/.bashrc
echo 'export PROMPT_COMMAND='__git_ps1 "\w" "\\\$ " " (%9s)"'' >> ~/.bashrc
echo ' . ~/.git_files/git-prompt.sh' >> ~/.bashrc
