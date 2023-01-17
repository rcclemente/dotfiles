local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
  ensure_installed = {
		"bash",
		"c",
		"css",
		"hcl",
		"java",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"ruby",
		"rust",
		"terraform",
		"tsx",
		"typescript",
		"yaml",
	}, -- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "css" } },
})
