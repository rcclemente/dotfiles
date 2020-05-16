# Dotfiles

- [Intro](#intro)
- [Installation](#installation)
- [Iterm](#iterm)
- [Zsh](#zsh)
- [Tmux](#tmux)
- [Neovim](#neovim)


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

## Iterm

#### Installation

- Download at https://www.iterm2.com/downloads.html

#### Install Dracula theme

- Download the theme

```
  git clone https://github.com/dracula/iterm.git ~/iterm_dracula
```

- Configure iterm

1. iTerm2 > Preferences > Profiles > Colors Tab
1. Open the Color Presets... drop-down in the bottom right corner
1. Select Import... from the list
1. Select the Dracula.itermcolors file
1. Select the Dracula from Color Presets...

- Delete
```
  rm -rf ~/iterm_dracula
```

## Zsh

#### Oh My Zsh

- Download (https://github.com/ohmyzsh/ohmyzsh#getting-started)

```
  brew install wget
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  ln -s dotfiles/zshrc .zshrc
```

## Neovim

#### Install

    curl -fLo $HOME/.config/nvim/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### Vim plug

    sh -c 'curl -fLo  ~/.config/nvim/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


#### Install Theme - https://github.com/romkatv/powerlevel10k#manual

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

  Set ZSH_THEME="powerlevel10k/powerlevel10k"

### Fonts

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

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


