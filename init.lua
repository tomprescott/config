local g = vim.g
local o = vim.o
local opt = vim.opt
local a = vim.api
o.termguicolors = true
o.hidden = true
o.scrolloff = 8

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = true
o.cursorline = true
o.signcolumn = 'yes'

-- Better editing experience 
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.backupdir = '/tmp/'

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Highlight the region on yank
a.nvim_create_autocmd('TextYankPost', {
    group = num_au,
        callback = function()
                vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
                    end,
                    })

vim.cmd('colorscheme embark')
require('lualine').setup() 

--KEYBINDINGS
vim.keymap.set('n', '<Leader>bp', ':bp<CR>')
vim.keymap.set('n', '<Leader>bn', ':bn<CR>')

--PLUGINS
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  --html tag support
  
  use 'alvan/vim-closetag'

  -- Display buffers in tabs
  use 'ap/vim-buftabline'
  
  -- Auto Pairs
  use 'jiangmiao/auto-pairs'

  -- Python support
  use 'davidhalter/jedi-vim'

  -- Terraform support
  use 'hashivim/vim-terraform'

  -- Dashboard is a nice start screen for nvim
  use 'glepnir/dashboard-nvim'

  -- Telescope and related plugins --
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim",
        config = function()
        require("telescope").setup {
          extensions = {
            file_browser = {
              theme = "ivy",
              -- disables netrw and use telescope-file-browser in its place
              hijack_netrw = true,
              mappings = {
                ["i"] = {
                  -- your custom insert mode mappings
                },
                ["n"] = {
                  -- your custom normal mode mappings
                },
              },
            },
          },
        }
        end
  }
  -- To get telescope-file-browser loaded and working with telescope,
  -- you need to call load_extension, somewhere after setup function:
  require("telescope").load_extension "file_browser"

  -- Productivity --
  use 'vimwiki/vimwiki'
  use 'jreybert/vimagit'

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      }
    end
  }

  -- A better status line --
  use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- File management --
  use 'vifm/vifm.vim'
  use 'scrooloose/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'

  -- Tim Pope Plugins --
  use 'tpope/vim-surround'

  -- Syntax Highlighting and Colors --
  use 'PotatoesMaster/i3-vim-syntax'
  use 'kovetskiy/sxhkd-vim'
  use 'vim-python/python-syntax'
  use 'ap/vim-css-color'

  -- Junegunn Choi Plugins --
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Colorschemes --
  --use 'RRethy/nvim-base16'
  --use 'kyazdani42/nvim-palenight.lua'

  use {
    'embark-theme/vim',
    as = 'embark',
    config = function()
      vim.cmd('colorscheme embark')
    end
  }

  -- Other stuff --
  use 'frazrepo/vim-rainbow'
end)

