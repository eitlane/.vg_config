echo "Spawining vim bash and top configuration"

mkdir ~/.old_config

mv ~/.vim       /.old_config/.vim
mv ~/.bashrc    /.old_config/.bashrc
mv ~/.vimrc     /.old_config/.vimrc
mv ~/.screenrc  /.old_config/.screenrc

ln -s  ~/.vg_config/bashrc ~/.bashrc
ln -s  ~/.vg_config/vim    ~/.vim
ln -s  ~/.vg_config/vimrc  ~/.vimrc
ln -s  ~/.vg_config/screenrc  ~/.screenrc

echo "Done!"

echo "Getting plugins from git"

/bin/sh  ~/.vg_config/vim/bundle/ctrlp.sh
/bin/sh  ~/.vg_config/vim/bundle/nerdtree.sh
/bin/sh  ~/.vg_config/vim/bundle/rename.sh
/bin/sh  ~/.vg_config/vim/bundle/tagbar.sh
/bin/sh  ~/.vg_config/vim/bundle/bufftabline.sh
#/bin/sh  ~/.vg_config/vim/bundle/vim-air.sh

echo "Done!"
