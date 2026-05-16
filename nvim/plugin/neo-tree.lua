if vim.g.did_load_neo_tree_plugin then
  return
end
vim.g.did_load_neo_tree_plugin = true

require('neo-tree').setup {
  close_if_last_window = true,
  enable_cursor_hijack = false,
  sources = { 'filesystem', 'buffers', 'git_status' },
  source_selector = {
    winbar = true,
    content_layout = 'center',
    sources = {
      { source = 'filesystem', display_name = ' 󰉓 Files ' },
      { source = 'buffers', display_name = ' 󰈚 Bufs ' },
      { source = 'git_status', display_name = ' 󰊢 Git ' },
    },
  },
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_always = true,
    use_libuv_file_watcher = true,
  },
  window = {
    position = 'left',
    width = 30,
    mappings = {
      ['<space>'] = 'toggle_node',
    },
  },
  default_component_configs = {
    indent = { padding = 1, with_markers = true },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      default = '',
    },
    git_status = {
      symbols = {
        added = '',
        modified = '',
        deleted = '',
        renamed = '襁',
        untracked = '',
        ignored = '',
        unstaged = '',
        staged = '',
        conflict = '',
      },
    },
  },
}

vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { desc = '[n]eo-tree toggle' })
vim.keymap.set('n', '<leader>m', ':Neotree focus<CR>', { desc = 'reveal file in neo-tree' })
