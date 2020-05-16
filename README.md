# Dotfiles

- [Intro](#intro)
- [Installation](#installation)
- [Tmux](#tmux)
- [Zsh](#zsh)


## Intro
Collection for configurations for the following

* Iterm
* ZSH
* Nvim
* Code searching with ctags

## Installation

```
git clone git@github.com:rcclemente/dotfiles.git ~/dotfiles
```
    rm .tmux.conf

    brew install neovim
    git clone git@github.com:rcclemente/dotfiles.git dotfiles
    ln -s dotfiles/vimrc ~/.vimrc
    ln -s dotfiles/tmux.conf ~/.tmux.conf
    ln -s dotfiles/nvim ~/config/

### Iterm

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

### Oh My Zsh

https://github.com/ohmyzsh/ohmyzsh#getting-started

    brew install wget
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    ln -s dotfiles/zshrc .zshrc

### Neovim
- Download plugin manager

    curl -fLo $HOME/.config/nvim/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### Terminal

Dracula - https://draculatheme.com/terminal/
load theme from $HOME/dotfiles/terminal-app/Dracula.terminal

#### Install Theme - https://github.com/romkatv/powerlevel10k#manual

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

  Set ZSH_THEME="powerlevel10k/powerlevel10k"

### Fonts

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

### Vim plug

    sh -c 'curl -fLo  ~/.config/nvim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Install Dracula for vim

    mkdir -p ~/.vim/colors
    wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim
    mv dracula.vim ~/.vim/colors/

### Ctags

  - Install

    `brew install ctags`

  - Create the tags for your local ruby/rails project

    ``ctags --exclude=log --exclude=.git --recurse . `bundle show --paths` ``

  - In vim to search for a definition of a tag press `<C-]>`

### Vim plugins

#### Search for text in file

    brew install ack
    brew install the_silver_searcher

### Solargraph for ruby coc

  - Swith to the righ commandline tools(should have been downloaded in the apple developer site)

    ```
    sudo xcode-select --switch /Library/Developer/CommandLineTools
    sudo gem install solargraph
    ```

  - And then restore afterwards with

    ```
    sudo xcode-select --switch /Applications/Xcode.app

    ```

  - Inside nvim

    ```
    CocInstall coc-solargraph coc-css coc-html coc-json coc-tsserver
    ```

#### Installing/Updating Vim

    nvim +PlugInstall +qall


### Raw links

https://raw.githubusercontent.com/rcclemente/dotfiles/master/tmux.conf


