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

git clone https://github.com/dracula/iterm.git
Install manually
Download using the GitHub .zip download option and unzip them.
- iTerm2 > Preferences > Profiles > Colors Tab
- Open the Color Presets... drop-down in the bottom right corner
- Select Import... from the list
- Select the Dracula.itermcolors file
- Select the Dracula from Color Presets...

#### Terminal

Dracula - https://draculatheme.com/terminal/
load theme from $HOME/dotfiles/terminal-app/Dracula.terminal

#### Oh My Zsh
https://github.com/ohmyzsh/ohmyzsh#getting-started

    brew install wget
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ln -s dotfiles/zshrc .zshrc

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


