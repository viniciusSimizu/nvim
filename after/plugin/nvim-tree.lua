require("nvim-tree").setup({
	view = {
		width = "40%",
		side = "right",
		relativenumber = true,
		preserve_window_proportions = true,
	},
	renderer = {
		add_trailing = true,
		indent_markers = {
			enable = true,
		},
	},
})

vim.keymap.set("n", "ç", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "Ç", vim.cmd.NvimTreeFindFileToggle)
