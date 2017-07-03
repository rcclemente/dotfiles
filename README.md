# Dotfiles


## Installation

    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    cd dotfiles
    ln -s vimrc ~/.vimrc
    ln -s tmux.conf ~/.tmux.conf
    cd ..

#### Install Vundle
    
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
#### Install jellybean for vim
    
    mkdir ~/.vim/colors                                                                                                
    wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim ~/.vim/colors/

#### MacVim
    
    brew install macvim --env-std --with-override-system-vim

#### Fonts and Macvim
    
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh 
    cd ..
    rm -rf fonts

#### Airline for vim and tmux
https://github.com/vim-airline/vim-airline
