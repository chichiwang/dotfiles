## Dependencies
* [vim](http://www.vim.org/download.php)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [tmux](https://tmux.github.io/)
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* [cmake](http://brewformulas.org/Cmake)

## Installation

Inside vim:
```
:source ~/.vimrc
:PlugInstall 
```

Bash:
```
~/.vim/plugged/YouCompleteMe/install.py --clang-completer
```

## Special Instructions

Shift-UP and Shift-DOWN do not pass to Tmux bindings in the OSX terminal. In order to make it work, go into Terminal > Preferences > Keyboard (tab) and add bindings for SHIFT-UP and SHIFT-DOWN to send text: SHIFT-UP and SHIFT-DOWN respectively. Use this [page](http://superuser.com/questions/841391/os-x-terminal-eating-the-shift-key) as a guide.

