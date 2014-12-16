vim-dotfiles
============

Installing
----------

Clone Git repo in ~/.vim
```
git clone git://github.com/etsit/vim-dotfiles.git ~/.vim
```

Create directory for temporary and backup files
```
mkdir ~/.vim-tmp
```

Create symlinks
```
ln -s ~/.vim/vimrc ~/.vimrc
```

and if ~/.vim/gvimrc exists,
```
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Update any existing plugins
```
cd ~/.vim
git submodule update --init --recursive
```


#### Plugins Installation 

The following plugins need special installation procedures
or have 3rd-party prerequisities:
- Syntastic: 
    - https://github.com/scrooloose/syntastic
    - Using JSHint:
        - (sudo) npm install -g jshint
        - https://github.com/scrooloose/syntastic/wiki/JavaScript:---jshint
- YouCompleteMe: 
    - http://valloric.github.io/YouCompleteMe/
        - Easiest install: cd ~/.vim/bundle/YouCompleteMe && ./install.sh
- Tern for Vim: 
    - https://github.com/marijnh/tern_for_vim
        - In bundle/tern_for_vim: npm install
          - Can't use NVM node

Update documentation after installation (with command from Pathogen)
```
:Helptags
```

