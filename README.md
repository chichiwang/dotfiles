## Dependencies
Ensure the following are installed:

* [vim](http://www.vim.org/download.php)
* [vim-plug](https://github.com/junegunn/vim-plug)
* [tmux](https://tmux.github.io/)
* [tmux plugin manager](https://github.com/tmux-plugins/tpm)
    * `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
* [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
* [cmake](https://cmake.org/)
* [ctags](http://ctags.sourceforge.net/)
  * `brew install ctags` for OSX
  * `sudo apt-get install ctags` for linux
  * Add `export PATH="/usr/local/bin:$PATH"` to `.bash_profile` or `.zshrc` to let your shell know which ctags to use

### Optional dependencies
Optionally install the following:

* [nvm](https://github.com/creationix/nvm)

## Setup
To start using these dotfiles, copy the `.vim` directory, `.vimrc` file, and the `tmux.conf` file over to your home directory `~`.

### Tmux
If using `zsh` as your shell, uncomment the line in `.tmux.conf` that sets the default shell to `zsh`.

If using any shell other than the system shell, set that shell as the tmux default instead.

### Directory Colors
To set up directory colors for your shell, copy the `.dir_colors` file to your home directory `~`.

Add the script snippet found in [conf/dir_colors.rc](conf/dir_colors.rc) to your `.bashrc` or `.zshrc` file.

### Preserve SSH passphrase
To preserve a ssh passphrase for your terminal session, add the snippet found in [conf/ssh_passphrase.rc](conf/ssh_passphrase.rc) to your `.bashrc` or `.zshrc` file.

### Exposing nvm command
To ensure that nvm loads on startup add the snippet found in [conf/nvm.rc](conf/nvm.rc) to your `.bashrc` or `.zshrc`.

## Installation

### Vim Plugins
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

### OSX Tmux bindings
Shift-UP and Shift-DOWN do not pass to Tmux bindings in the OSX terminal. In order to make it work, go into Terminal > Preferences > Keyboard (tab) and add bindings for SHIFT-UP and SHIFT-DOWN to send text: SHIFT-UP and SHIFT-DOWN respectively. Use this [page](http://superuser.com/questions/841391/os-x-terminal-eating-the-shift-key) as a guide.

