return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'rose-pine/neovim',
--    config = "require('theme-rose')"
  }
  use {
    'folke/tokyonight.nvim',
   config = "require('theme-tokyonight')"
  }

  use {
    'romgrk/doom-one.vim',
--  config = "require('theme-onedark')"
}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true},
  config = "require('lualine-config')"
}

use {
  'akinsho/bufferline.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = "require('bufferline-config')"
}

  use {
  'kyazdani42/nvim-tree.lua',
   requires = 'kyazdani42/nvim-web-devicons',
   config = "require('nvim-tree-config')"
  }

  use {'windwp/nvim-ts-autotag'}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs', config= "require('autopair-config')"}
  use {'folke/which-key.nvim'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require('telescope-config')"
  }

end)
