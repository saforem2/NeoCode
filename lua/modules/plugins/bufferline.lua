local M = {}

M.config = function()
    require("bufferline").setup {
    options = {
      --[[ numbers = function(opts)
        return string.format("%s", opts.id)
      end, ]]
      mappings = true,
      numbers = "none",
      indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 20,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 25,
      diagnostics = "nvim_lsp",
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      -- sort_by = "directory",
      -- NOTE: this will be called a lot so don't do any heavy processing here
      custom_filter = function(buf_number)
        if vim.bo[buf_number].filetype ~= "dashboard" then
          return true
        end
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
        },
        {
          filetype = "minimap",
          text = "Minimap",
          text_align = "center",
        },
        {
          filetype = "Outline",
          text = "Symbols",
          text_align = "center",
        },
        {
          filetype = "packer",
          text = "Plugins manager",
          text_align = "center",
        },
      },
      custom_areas = {
        right = function()
          local result = {}
          local error = vim.lsp.diagnostic.get_count(0, [[Error]])
          local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
          local info = vim.lsp.diagnostic.get_count(0, [[Information]])
          local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

          if error ~= 0 then
            result[1] = {
              text = "  " .. error,
              guifg = "#F92672",
            }
          end

          if warning ~= 0 then
            result[2] = {
              text = "  " .. warning,
              guifg = "#FFFF00",
            }
          end

          if hint ~= 0 then
            result[3] = {
              text = "  " .. hint,
              guifg = "#87ff00",
            }
          end

          if info ~= 0 then
            result[4] = {
              text = "  " .. info,
              guifg = "#00CCFF",
            }
          end
          return result
        end,
      },
    },
  }
end

return M
