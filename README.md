vim-dotfiles
============

Installing
----------

Clone Git repo:
```
git clone git://github.com/etsit/vim-dotfiles.git ~/.vim
```

Create symlinks:
```
ln -s ~/.vim/vimrc ~/.vimrc
```

and if ~/.vim/gvimrc exists,
```
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Update any existing plugins:
```
cd ~/.vim
git submodule update --init --recursive
```


#### Plugins Installation 

The following plugins need special installation procedures
or have 3rd-party prerequisities:
- Syntastic: https://github.com/scrooloose/syntastic 
- YouCompleteMe: http://valloric.github.io/YouCompleteMe/
- Tern for Vim: https://github.com/marijnh/tern_for_vim

Update documentation after installation (with command from Pathogen)
```
:Helptags
```

