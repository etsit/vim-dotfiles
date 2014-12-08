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
        - "install the tern server by running npm install in the bundle/tern_for_vim directory.
          Caution: Because the node process is not run using your standard shell, the NVM version
          of node.js won't work. You need a global node executable."

Update documentation after installation (with command from Pathogen)
```
:Helptags
```

