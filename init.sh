echo "Spawining vg configuration"

mkdir ~/.old_config

mkdir ~/.vimswap
mkdir ~/.vimswap/backup
mkdir ~/.vimswap/temp
mkdir ~/.vimswap/undo

mv ~/.vim       ~/.old_config/.vim
mv ~/.bashrc    ~/.old_config/.bashrc
mv ~/.vimrc     ~/.old_config/.vimrc
mv ~/.gdbinit   ~/.old_config/.gdbinit
mv ~/.screenrc  ~/.old_config/.screenrc
mv ~/.tmux.conf ~/.old_config/.tmux.conf
mv ~/.zshrc     ~/.old_config/.zshrc

ln -s  ~/.vg_config/bashrc ~/.bashrc
ln -s  ~/.vg_config/vim    ~/.vim
ln -s  ~/.vg_config/vimrc  ~/.vimrc
ln -s  ~/.vg_config/gdbinit  ~/.gdbinit
ln -s  ~/.vg_config/screenrc  ~/.screenrc
ln -s  ~/.vg_config/tmux.conf ~/.tmux.conf
ln -s  ~/.vg_config/zshrc ~/.zshrc

curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh

source ~/.git-prompt.sh

echo "Done!"


echo "Getting plugins from git"

/bin/sh  ~/.vg_config/vim/bundle/ctrlp.sh
/bin/sh  ~/.vg_config/vim/bundle/nerdtree.sh
/bin/sh  ~/.vg_config/vim/bundle/rename.sh
/bin/sh  ~/.vg_config/vim/bundle/tagbar.sh
/bin/sh  ~/.vg_config/vim/bundle/bufftabline.sh
#/bin/sh  ~/.vg_config/vim/bundle/vim-air.sh

echo "Done!"
