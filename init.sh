echo "Spawining vim bash and top configuration"

rm -rf ~/.vim ~/.vimrc  ~/.bashrc ~/.toprc
ln -s  ~/.vg_config/bashrc ~/.bashrc
ln -s  ~/.vg_config/vim    ~/.vim
ln -s  ~/.vg_config/vimrc  ~/.vimrc
ln -s  ~/.vg_config/toprc  ~/.toprc
ln -s  ~/.vg_config/screenrc  ~/.screenrc


echo "Done!"

echo "Getting plugins from git"

/bin/sh  ~/.vg_config/vim/bundle/ctrlp.sh
/bin/sh  ~/.vg_config/vim/bundle/nerdtree.sh
/bin/sh  ~/.vg_config/vim/bundle/rename.sh
/bin/sh  ~/.vg_config/vim/bundle/tagbar.sh
/bin/sh  ~/.vg_config/vim/bundle/vim-air.sh

echo "Done!"
