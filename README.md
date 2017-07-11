# Dotfiles

Collection of my vim and tmux configurations
Some features:
- Iterm configuration
- Git vim integration 
- vim and tmux navigation using h/j/k/l


## Installation

    rm -rf .vim
    rm .vimrc
    rm .tmux.conf
    
    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    ln -s dotfiles/vimrc ~/.vimrc
    ln -s dotfiles/tmux.conf ~/.tmux.conf
    
#### MacVim (optional)
    
    brew install macvim --env-std --with-override-system-vim

#### Fonts
    
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh 
    cd ..
    rm -rf fonts
    
#### Update Iterm 
  
  - Settings

![Iterm Font Config](https://github.com/rcclemente/dotfiles/blob/master/images/tmux_powerline_font.png "Inconsolata")

![Iterm Allow terminal apps to clipboard](https://github.com/rcclemente/dotfiles/blob/master/images/iterm_allow_tmux_vim_to_copy_clipboard.png)

  - Install the theme

    cd ~
    $ git clone https://github.com/dracula/iterm.git

  - Activating theme

    1. iTerm2 > Preferences > Profiles > Colors Tab
    2. Open the Color Presets... drop-down in the bottom right corner
    3. Select Import... from the list
    4. Select the Dracula.itermcolors file
    5. Select the Dracula from Color Presets

#### Install Vundle
    
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
#### Install jellybean for vim
    
    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim
    mv dracula.vim ~/.vim/colors/

## Vim plugins

#### Installing/Updating Vim
    
    vim +PluginInstall +qall


#### Ack searcher

    brew install ack
    
- In your .vimrc

