vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

local config = {
  options = {
    g = {
      autoformat_enabled = true,
    }
  },

  colorscheme = "duskfox",

  plugins = {
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"

      config.sources = {
        null_ls.builtins.formatting.prettier
      }

      return config
    end,

    heirline = function(config)
      -- statusline
      config[1] = {
        hl = { fg = "fg", bg = "bg" },
        astronvim.status.component.mode(),
        astronvim.status.component.git_branch(),
        astronvim.status.component.file_info(
          astronvim.is_available "bufferline.nvim" and { filetype = {}, filename = false, file_modified = false } or nil
        ),
        astronvim.status.component.git_diff(),
        astronvim.status.component.diagnostics(),
        astronvim.status.component.fill(),
        astronvim.status.component.macro_recording(),
        astronvim.status.component.fill(),
        astronvim.status.component.lsp(),
        astronvim.status.component.treesitter(),
        astronvim.status.component.nav(),
        astronvim.status.component.mode { surround = { separator = "right" } },
      }

      -- winbar
      config[2] = {
        fallthrough = false,
        -- if the current buffer matches the following buftype or filetype, disable the winbar
        {
          condition = function()
            return astronvim.status.condition.buffer_matches {
              buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
              filetype = { "NvimTree", "neo-tree", "dashboard", "Outline", "aerial" },
            }
          end,
          init = function() vim.opt_local.winbar = nil end,
        },
        -- if the window is currently active, show the breadcrumbs
        {
          condition = astronvim.status.condition.is_active,
          astronvim.status.component.breadcrumbs { hl = { fg = "winbar_fg", bg = "winbar_bg" } },
        },
        -- if the window is not currently active, show the file information
        {
          astronvim.status.component.file_info {
            file_icon = { hl = false },
            hl = { fg = "winbarnc_fg", bg = "winbarnc_bg" },
            surround = false,
          },
        },
      }

      -- return the final configuration table
      return config
    end,
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true, -- enable format on save
      },
    },
  },

  indent_blankline = {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
  },
}

return config
