# install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "# Use ZSH" >> ~/.bashrc
echo "export SHELL=/bin/zsh" >> ~/.bashrc
echo "exec /bin/zsh -l" >> ~/.bashrc

# zsh vim keybinginds
echo "# Use vi key-bindings" >> ~/.zshrc
echo "bindkey -v" >> ~/.zshrc

# zsh reverse search
echo "# Reverse search" >> ~/.zshrc
echo "bindkey '^R' history-incremental-search-backward" >> ~/.zshrc

# Add bash_aliases
wget -O ~/.bash_aliases https://raw.githubusercontent.com/jerpint/fresh_install/master/basic_setup/bash_aliases  
echo "if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi" >> ~/.zshrc

# Set up fancy diff for git
mkdir -p ~/.diffsofancy
wget -O  ~/.diffsofancy/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/diff-so-fancy
chmod +x ~/.diffsofancy/diff-so-fancy

git config --global core.pager "~/.diffsofancy/diff-so-fancy | less --tabs=4 -RFX"
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

# Install vundle
# cd && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim plugins
# vim -c 'PluginInstall' -c 'qa!'

# install fzf
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

#Install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# source bashrc when done
source ~/.bashrc
