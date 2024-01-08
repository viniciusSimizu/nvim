require('lint').linters_by_ft = {
	lua = {'luacheck'},
	typescript = {'eslint'},
	javascript = {'eslint'},
	java = {'checkstyle'},
	html = {'tidy'},
	css = {'stylelint'},
	sql = {'sqlfluff'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
