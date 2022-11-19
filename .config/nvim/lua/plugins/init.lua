return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> packer plugin manager
    use 'folke/tokyonight.nvim' --> Tokyo night color scheme
    use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"} --> Adds More Colors in the files
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    use {
    'kyazdani42/nvim-tree.lua',
     requires = 'kyazdani42/nvim-web-devicons',
  }
    use("RRethy/nvim-base16")
    use {'glepnir/dashboard-nvim'}

end)
