# Add zsh, vundle, and set up dotfiles
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone https://github.com/jerpint/fresh_install.git

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

# Install tpmgit clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf

# source ~/.bashrc when done
source ~/.bashrc
