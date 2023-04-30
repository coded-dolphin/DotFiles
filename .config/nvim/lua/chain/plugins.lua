-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

packer.startup(function(use)
	use("wbthomason/packer.nvim") --packer itself
	use("nvim-lua/plenary.nvim") -- many other plugins use this

  -- ColorScheme (solarized)
  use {
    "svrana/neosolarized.nvim",
    requires = {"tjdevries/colorbuddy.nvim"}
  }

  -- tokyo night
  use 'folke/tokyonight.nvim'

  use("christoomey/vim-tmux-navigator") -- tmux & splits nav
  use("numToStr/Comment.nvim") -- comment with gc

  -- Vs code like sidebar
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

  -- Beautiful status line
  use ("nvim-lualine/lualine.nvim")

	-- last place
	use("ethanholz/nvim-lastplace")

  -- tabline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- syntax highlighting
    use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- display hex rgb or other color
  use("norcalli/nvim-colorizer.lua")

  -- git sings
  use("lewis6991/gitsigns.nvim")

  -- Fuzzy finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder


  -- UI library
  use("MunifTanjim/nui.nvim")

  -- emmet
  use ('mattn/emmet-vim')

	if packer_bootstrap then
		require("packer").sync()
	end
end)
