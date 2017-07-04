# Dotfiles

Collection of my vim and tmux configurations
Some features:
- Git vim integration 
- vim and tmux navigation using h/j/k/l


## Installation

    rm -rf .vim
    rm .vimrc
    rm .tmux.conf
    
    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    ln -s dotfiles/vimrc ~/.vimrc
    ln -s dotfiles/tmux.conf ~/.tmux.conf
    
#### Install Vundle
    
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
#### Install jellybean for vim
    
    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim 
    mv jellybeans.vim ~/.vim/colors/

#### MacVim
    
    brew install macvim --env-std --with-override-system-vim

#### Fonts
    
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh 
    cd ..
    rm -rf fonts
    
#### Update Iterm font

![Iterm Font Config](https://github.com/rcclemente/dotfiles/blob/master/images/tmux_powerline_font.png "Inconsolata")


#### Update Vim
    
    vim +PluginInstall +qall

## More Fun stuff


