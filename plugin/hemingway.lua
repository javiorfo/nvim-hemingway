-- ############################################################
-- # Maintainer: System Malt                                  #
-- # URL:        https://github.com/systemmalt/nvim-hemingway #
-- ############################################################

if vim.g.hemingway then
  return
end

vim.g.hemingway = 1

vim.api.nvim_create_user_command('HemingwayInfo', 'lua require("hemingway.info").show()', {})
vim.api.nvim_set_keymap('n', '<Plug>HemingwayComment', '<cmd>lua require("hemingway.core").comment()<CR>', {})
vim.api.nvim_set_keymap('v', '<Plug>HemingwayMultiComment', '<cmd>lua require("hemingway.core").multi_comment()<CR>', {})
