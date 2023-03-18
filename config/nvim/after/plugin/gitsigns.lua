local gitsigns = require('gitsigns')

gitsigns.setup {
  keymaps = {
    -- Keybindings for blame mode
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  },
}
