local on_attach = function(_, bufnr)
	require("jdtls.setup").add_commands()
	require("jdtls").setup_dap()

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- Java specific
	vim.keymap.set("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
	vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
	vim.keymap.set("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
	vim.keymap.set("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
	vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
	vim.keymap.set("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local root_markers = { "gradlew", "pom.xml", "rvnw", ".git" }
local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])
local home = os.getenv("HOME")

local capabilities = {
	textDocument = {
		completion = {
			completionItem = {
				snippetSupport = true,
			},
		},
	},
}

local config = {
	flags = {
		allow_incremental_sync = true,
	},
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = root_dir,
}

config.settings = {
	java = {
		signatureHelp = { enabled = true },
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
		},
	},
}
config.cmd = { home .. "/language_servers/jdt-language-server/bin/jdtls" }

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
config.init_options = {
	-- bundles = bundles;
	extendedClientCapabilities = extendedClientCapabilities,
}

-- UI
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
	local opts = {}
	pickers
		.new(opts, {
			prompt_title = prompt,
			finder = finders.new_table({
				results = items,
				entry_maker = function(entry)
					return {
						value = entry,
						display = label_fn(entry),
						ordinal = label_fn(entry),
					}
				end,
			}),
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr)
				actions.goto_file_selection_edit:replace(function()
					local selection = actions.get_selected_entry(prompt_bufnr)
					actions.close(prompt_bufnr)

					cb(selection.value)
				end)

				return true
			end,
		})
		:find()
end

-- Server
require("jdtls").start_or_attach(config)
