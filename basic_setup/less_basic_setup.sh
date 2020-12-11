# Add zsh, vundle, and set up dotfiles
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

source ~/fresh_install/dotfiles/createsymlinks.sh

# Add bash_aliases
echo "if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi" >> ~/.bashrc

echo "# Use ZSH" >> ~/.bashrc
echo "export SHELL=/bin/zsh" >> ~/.bashrc
echo "exec /bin/zsh -l" >> ~/.bashrc


# Install vundle
cd && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install tpmgit clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf

# Set up fancy diff for git
mkdir -p ~/.diffsofancy
cp ~/fresh_install/dotfiles/diff-so-fancy ~/.diffsofancy/
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

# Install vim plugins
vim -c 'PluginInstall' -c 'qa!'

#Install LSD
wget https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd-musl_0.17.0_amd64.deb
sudo dpkg -i lsd-musl_0.17.0_amd64.deb

#Install conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# source ~/.bashrc when done
source ~/.bashrc
