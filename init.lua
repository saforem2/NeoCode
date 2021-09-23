require "core.global"
require "core.options"
require "core.mappings"
require "modules.plugins"
-- require "colors.doom-one"
-- vim.cmd("colorscheme molokai")
vim.cmd([[
  nnoremap " :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>
]])
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
