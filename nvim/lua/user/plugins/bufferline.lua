local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

-- bufferline.setup{
--	options = {
--		numbers = "buffer_id",
--		always_show_bufferline = true,
--		separator_style = "thin"
--	}
-- }
bufferline.setup {
	options = {
		numbers = "buffer_id",
		indicator = {
			icon = '▎'
		},
		buffer_close_icon = '',
		modified_icon = '',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center"
			}
		},
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
	},
	highlights = {
		buffer_selected = {
			bold = true
		}
	}
}
