# Dotfiles

- [Intro](#intro)
- [Installation](#installation)
  - [Prequisites](#prequisites)
  - [Iterm](#iterm)
  - [Zsh](#zsh)
  - [Tmux](#tmux)
  - [Neovim](#neovim)
- [Raw Links](#rawlinks)

## Intro
Collection for configurations for the following

* Iterm
* ZSH
* Nvim
* Code searching with ctags

## Installation

### Prequisites

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install wget fzf ack the_silver_searcher git thefuck reattach-to-user-namespace node java ripgrep fd

git clone git@github.com:rcclemente/dotfiles.git ~/dotfiles
mkdir ~/.config
```

Bartender alternative 
```
brew install --cask dozer
```

### Iterm

- Download at https://www.iterm2.com/downloads.html

### Fzf

```
cd ~
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

#### Dracula theme

- Download the theme

```
git clone https://github.com/dracula/iterm.git ~/iterm_dracula
```

- Configure iterm

1. iTerm2 > Preferences > Profiles > Colors Tab
1. Open the Color Presets... drop-down in the bottom right corner
1. Select Import... from the list
1. Select the Dracula.itermcolors file from ~/iterm_dracula
1. Select the Dracula from Color Presets...

- Delete
```
rm -rf ~/iterm_dracula
```

#### Fonts

- Use Nerdfonts

```
brew tap homebrew/cask-fonts
brew install font-hasklug-nerd-font
brew install font-jetbrains-mono-nerd-font
brew install font-hack-nerd-font
```

-- download all 

```
https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e
```

- Powerline fonts 
```
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
```

## Zsh

- Switch to zsh

```
chsh -s /bin/zsh
```

#### Oh My Zsh

- Download (https://github.com/ohmyzsh/ohmyzsh#getting-started)

```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

- Install Theme - https://github.com/romkatv/powerlevel10k#manual

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
ln -s ~/dotfiles/zshrc .zshrc
```

optional:

```
Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

```

Configure

```
p10k configure
```


## Tmux

```
brew install tmux
rm ~/.tmux.conf
ln -s dotfiles/tmux.conf ~/.tmux.conf
```

## Neovim

```
brew install neovim
mkdir ~/.config
ln -s dotfiles/nvim ~/.config/
```

#### Colors

```
cd ~
git clone https://github.com/flazz/vim-colorschemes.git
cp -R vim-colorschemes/colors dotfiles/nvim/
rm -rf vim-colorschemes
```

#### Vim Plug

```
curl -fLo $HOME/.config/nvim/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### Ctags

- Install

```
brew install ctags
```

- Create the tags for your local ruby/rails project

```
ctags --exclude=log --exclude=.git --recurse . `bundle show --paths` ``
```

### Solargraph for ruby coc

- Download command line tools https://developer.apple.com/download/more/

- Switch to the right commandline tools(should have been downloaded in the apple developer site)

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
:PlugInstall
:CocInstall coc-solargraph coc-css coc-html coc-json coc-tsserver
```

### MarkDown Preview

- After install inside nvim

```
:source %
:PluginInstall
:call mkdp#util#install()
```

### Set as git editor

```
git config --global core.editor "nvim"
```

## Raw links

https://raw.githubusercontent.com/rcclemente/dotfiles/master/tmux.conf

## Additional Apps

#### Sleep, Lock... etc
https://github.com/siong1987/shortcuts

#### Window app manger
https://rectangleapp.com/


