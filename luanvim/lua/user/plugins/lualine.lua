local status_ok, feline = pcall(require, 'lualine')
if not status_ok then
	return
end

lualine.setup(
	options = {
		theme  = custom_gruvbox,
	},
)
