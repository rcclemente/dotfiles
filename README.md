# Dotfiles

Collection my configurations

Some features:
- Iterm configuration
- Git vim integration
- vim and tmux navigation using h/j/k/l
- Code searching with ctags including your rails project's gems

## Installation

    rm -rf .vim
    rm .vimrc
    rm .tmux.conf

    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    ln -s dotfiles/vimrc ~/.vimrc
    ln -s dotfiles/tmux.conf ~/.tmux.conf
    ln -s dotfiles/nvim ~/config/

#### Iterm

- go to Preferences > Keys in iTerm2
- click the plus button at the bottom to new Global Shortcut Keys for each mapping
- Enter the keyboard shortcuts you'd like to use, such as control+h and so on
- Set the Action to Send Escape Sequence and set the Esc+ field to one of the following for each arrow key:

      Up: [A
      Down: [B
      Right: [C
      Left: [D

#### MacVim (optional)

    brew install macvim --env-std --with-override-system-vim
    git config --global core.editor "/usr/local/bin/vim"

#### Fonts

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

#### Install Vundle

 git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### Install Dracula for vim

    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim
    mv dracula.vim ~/.vim/colors/

#### Ctags

  - Install

    `brew install ctags`

  - Create the tags for your local ruby/rails project

    ``ctags --exclude=log --exclude=.git --recurse . `bundle show --paths` ``

  - In vim to search for a definition of a tag press `<C-]>`

## Vim plugins

#### Search for text in file

    brew install ack
    brew install the_silver_searcher

#### Installing/Updating Vim

    vim +PluginInstall +qall

## Raw links

https://raw.githubusercontent.com/rcclemente/dotfiles/master/tmux.conf


