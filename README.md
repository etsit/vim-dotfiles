vim-dotfiles
============

Installation
------------

Clone Git repo in ~/.vim
```
git clone https://github.com/etsit/vim-dotfiles
ln -sv ~/vim-dotfiles ~/.vim
```
or, directly naming cloned directory ".vim":
```
git clone https://github.com/etsit/vim-dotfiles ~/.vim
```

Create directory for temporary and backup files
```
mkdir ~/.vim-tmp
```

Create symlinks
```
ln -sv ~/.vim/vimrc ~/.vimrc
```

and if ~/.vim/gvimrc exists,
```
ln -sv ~/.vim/gvimrc ~/.gvimrc
```

Update any existing plugins
```
cd ~/.vim
git submodule update --init --recursive
```


#### Plugins Installation 

##### General git submodule installation

Type in bash:
```
cd ~/.vim/bundle
git submodule add <plugin-url>
git submodule update --recursive --init
```
(add possible plugin specific options to your .vimrc)

Start Vim and type:
```
:Helptags
```
to update documentation after installation (with command from Pathogen).

##### Specific plugin notes
The following plugins need special installation procedures
or have 3rd-party prerequisities:
- Syntastic: https://github.com/scrooloose/syntastic
  - Using JSHint:
      - ```(sudo) npm install -g jshint```
      - https://github.com/scrooloose/syntastic/wiki/JavaScript:---jshint
- Tern for Vim: https://github.com/marijnh/tern_for_vim
  - In bundle/tern_for_vim: ```npm install```
    - Can't use node NVM installation
- Neocomplete: https://github.com/Shougo/neocomplete.vim
  - Requires vim compiled with Lua support
    - Example on Mac OS X using Homebrew (incl. extra options): ```brew install macvim --with-lua --with-luajit --with-cscope --override-system-vim --HEAD```
    - Example on ELinux (Debian):
      - Some prerequisities: ```sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev ruby-dev libluajit-5.1-dev```
      - ```./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-gui=gtk2 --enable-cscope --enable-luainterp --with-lua-prefix=/usr --with-luajit```
      - ```make && sudo make install```
- vim-hdevtools: https://github.com/bitc/vim-hdevtools
  - ghc/ghci
  - hdevtools installed using cabal: ```cabal install hdevtools```
  - Relies on Syntastic
- haskellmode-vim: https://github.com/lukerandall/haskellmode-vim
  - ghc/ghci
    - Haddock indexed doc (usually comes with ghc)
  - wget
- vim-fsharp dependencies
  - mono and fsharp
  - syntastic
  - omnicomplete for completion, e.g. supertab

##### Removal of a plugin

Since plugins are installed as git submodules, first
```
cd ~/.vim/bundle
```
and follow instructions on
http://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule

Don't forget to remove possible plugin configurations from your .vimrc.
