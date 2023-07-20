require("gpetryk.set")

require("lazy").setup("gpetryk.lazy", {
  dev = {
    path = "~/dotfiles/nvim_plugins"
  },
  change_detection = {
    enabled=true,
    notify=false
  },
  lockfile = vim.fn.stdpath('config') .. "/.lazy-lock.json"
})

require("gpetryk.keymaps")
require("gpetryk.tabline")
require("gpetryk.autosave")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

vim.g.gitblame_display_virtual_text = 0
vim.g.gitblame_message_template = '<author> • <date> • <summary>'
vim.g.gitblame_message_when_not_committed = 'Not Committed Yet'
vim.g.gitblame_date_format = '%r'
