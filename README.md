
INSTALLATION
============

Clone Git repo:
> git clone git://github.com/etsit/vim-dotfiles.git ~/.vim

Create symlinks:
> ln -s ~/.vim/vimrc ~/.vimrc
and if ~/.vim/gvimrc exists,
> ln -s ~/.vim/gvimrc ~/.gvimrc

Update any existing plugins:
> cd ~/.vim
> git submodule init
> git submodule update


INSTALLATION OF PLUGINS
=======================

Update doc after installation with command
(from Pathogen)
> :Helptags

The following plugins need special installation procedures
or 3rd party software installations: 
- Syntastic: https://github.com/scrooloose/syntastic 
- YouCompleteMe: http://valloric.github.io/YouCompleteMe/
- Tern for Vim: https://github.com/marijnh/tern_for_vim

