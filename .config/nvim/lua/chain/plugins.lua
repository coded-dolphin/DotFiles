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

packer.startup(function(use)
	use("wbthomason/packer.nvim") --packer itself
	use("nvim-lua/plenary.nvim") -- many other plugins use this

  -- ColorScheme (solarized)
  use {
    "svrana/neosolarized.nvim",
    requires = {"tjdevries/colorbuddy.nvim"}
  }

  use("christoomey/vim-tmux-navigator") -- tmux & splits nav
  use("numToStr/Comment.nvim") -- comment with gc

  -- Vs code like sidebar
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

  -- Beautiful status line
  use ("nvim-lualine/lualine.nvim")

	-- last place
	use("ethanholz/nvim-lastplace")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
