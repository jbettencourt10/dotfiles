return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        numbers = 'none', -- No buffer numbers, but can be "ordinal" or "buffer_id"
        close_command = 'bdelete! %d', -- Command to close a buffer
        right_mouse_command = 'bdelete! %d', -- Close buffer with right-click
        left_mouse_command = 'buffer %d', -- Go to buffer with left-click
        middle_mouse_command = nil, -- Disable middle-click buffer delete
        indicator = {
          icon = '▎', -- Style of the active buffer indicator
          style = 'icon',
        },
        buffer_close_icon = '', -- Close icon on each buffer tab
        modified_icon = '●', -- Modified buffer indicator
        close_icon = '', -- Global close icon
        left_trunc_marker = '', -- Left truncation marker for overflow
        right_trunc_marker = '', -- Right truncation marker for overflow
        max_name_length = 18,
        max_prefix_length = 15, -- Prefix used when a buffer is truncated
        tab_size = 20, -- Tab size
        diagnostics = 'nvim_lsp', -- Show LSP diagnostics on buffer tabs
        show_buffer_icons = true, -- Show buffer icons
        show_buffer_close_icons = true, -- Show close icons
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- Don't change buffer order
        separator_style = 'slant', -- Style for buffer separator (can be "thick", "thin", or "slant")
        always_show_bufferline = true,
        offsets = {
          {
            filetype = 'NvimTree', -- Space for NvimTree or other file explorers
            text = 'File Explorer',
            text_align = 'left',
          },
        },
      },
    }
  end,
}
