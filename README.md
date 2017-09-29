# Dotfiles

Collection my configurations

Some features:
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

#### Vim 8
    
    brew install vim --with-override-system-vi
    git config --global core.editor "/usr/local/bin/vim"

#### MacVim (optional)

    brew install macvim --env-std --with-override-system-vim
    git config --global core.editor "/usr/local/bin/vim"

#### Fonts

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    git clone https://github.com/abertsch/Menlo-for-Powerline.git
    install fonts in directory

#### Install Vundle

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

#### Karabiner Elements

    Import Change caps_lock key
    https://pqrs.org/osx/karabiner/complex_modifications/

## Vim plugins

#### Search for text in file

    brew install fzf
    # To install useful key bindings and fuzzy completion:
    $(brew --prefix)/opt/fzf/install

#### Installing/Updating Vim

    vim +PluginInstall +qall

#### Keep vim colors consistent in bashrc

    if [ -n $TMUX  ]; then
      alias vim="TERM=screen-256color vim"
      alias vi="TERM=screen-256color vim"
    fi

## Raw links

https://raw.githubusercontent.com/rcclemente/dotfiles/master/tmux.conf


