return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		},
		cmd = "Neotree",
		keys = {
			{
				"\\",
				":Neotree reveal<CR>",
				silent = true
			}
		},
		lazy = false,
		opts = {
			filesystem = {
				hijack_netrw_behavior = "open_current",
				window = {
					mappings = {
						['\\'] = "close_window",
					}
				}
			}
		},
		config = function()
			(require("neo-tree")).setup({
				close_if_last_window = true
			});
		end
	}
};
