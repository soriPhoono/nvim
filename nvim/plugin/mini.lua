if vim.g.did_load_mini_plugin then
  return
end
vim.g.did_load_mini_plugin = true

local animate = require('mini.animate')

animate.setup({
  cursor = {
    enable = true,
    timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
  },
  scroll = {
    enable = true,
    timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),
    subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
  },
  resize = {
    enable = true,
    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
  },
  open = {
    enable = true,
    timing = animate.gen_timing.quadratic({ duration = 250, unit = 'total' }),
  },
  close = {
    enable = true,
    timing = animate.gen_timing.quadratic({ duration = 150, unit = 'total' }),
  },
})

local starter = require('mini.starter')

starter.setup({
  evaluate_single = false,
  header = {
    '',
    '  ⣀⣤⣤⣀',
    ' ⣴⠟⠛⠛⠿⣿⣦',
    '⣠⡿⠁    ⠈⢿⡄',
    '⣾⡟      ⢻⣿',
    '⣼⡇  ⢀⣀⣀⣀  ⢸⣧',
    '⣿⡇  ⠸⠿⠿⠿  ⢸⣿',
    '⣿⡇  ⣀⣀⣀⣀  ⢸⣧',
    '⢻⣷⡀    ⢀⣾⡟',
    ' ⠙⣿⣦⣤⣴⣿⠋',
    '   ⠙⠿⠿⠋',
    '',
    '           nvim',
    '',
  },
  footer = '  NixOS  ',
  items = {
    starter.section('Quick actions'),
    starter.item('New file', 'ene | startinsert'),
    starter.item('Find files', 'Telescope find_files'),
    starter.item('Recent files', 'Telescope oldfiles'),
    starter.item('Live grep', 'Telescope live_grep'),
    starter.item('Toggle tree', 'Neotree toggle'),
    starter.item('Quit', 'qa'),
  },
  content_hooks = {
    starter.gen_hook.adding_bg_colors(),
    starter.gen_hook.aligning('center', 'center'),
  },
})

-- Open starter when no file is specified
if vim.fn.argc() == 0 then
  vim.schedule(function()
    starter.open()
  end)
end
