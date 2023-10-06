local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- themes
  use "flazz/vim-colorschemes"
  -- use "folke/tokyonight.nvim"
  -- use "jacoborus/tender.vim"
  -- use "olimorris/onedarkpro.nvim"
  use "savq/melange"

  -- startup screen
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- tmux/vim pane navigation
  use "christoomey/vim-tmux-navigator" -- navigate between tmux and nvim

  -- Editing plugins
  use { "windwp/nvim-autopairs"} -- Autopairs, integrates with both cmp and treesitter

  -- commentor
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- surround changer
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  -- end Editor plugin

  -- nvim-tree
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'

  -- Fuzzy Finder (files, lsp, etc)
  -- use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  --
  -- -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Completion
	use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completions

  -- Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

  -- Language server
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

  -- use 'sheerun/vim-polyglot' -- syntax highlighting

  -- Search
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  -- search

  -- Visuals Plugins
  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons',
  }

  -- Filetype override
  use { "nathom/filetype.nvim", }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      'mitchellh/tree-sitter-hcl',
    },
  }

  -- Git
  use "tpope/vim-fugitive"
  use "kdheepak/lazygit.nvim"

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Markdown
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

