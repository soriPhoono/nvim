if vim.g.did_load_notify_plugin then
  return
end
vim.g.did_load_notify_plugin = true

require('notify').setup {
  fps = 60,
  icons = {
    DEBUG = '',
    ERROR = '',
    INFO = '',
    TRACE = '',
    WARN = '',
  },
  level = vim.log.levels.INFO,
  minimum_width = 50,
  render = 'default',
  stages = 'fade_in_slide_out',
  timeout = 2000,
  top_down = true,
}

vim.notify = require('notify')
