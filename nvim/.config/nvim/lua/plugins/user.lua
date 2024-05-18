-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

local prefix_trouble = "<leader>x"

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      {
        "<leader>T",
        "<cmd>TodoTelescope<cr>",
        desc = "Open TODOs in Telescope",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    keys = {
      "<leader>m",
      "<cmd>TSJToggle<cr>",
      desc = "Toggle Treesitter Join",
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "c-e",
      },
    },
    keys = {
      { prefix_trouble, desc = "Trouble" },
      { prefix_trouble .. "X", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
      { prefix_trouble .. "x", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
      { prefix_trouble .. "q", "<cmd»TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "nvim-web-devicons",
    opts = {
      override = {
        go = {
          icon = "󰟓",
          color = "#00ADD8",
        },
        makefile = {
          icon = "",
          color = "#e37933",
        },
      },
    },
  },
  {
    "neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    "noice.nvim",
    opts = {
      cmdline = {
        enabled = true,
      },
      messages = {
        enabled = false,
      },
      popupmenu = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        hover = {
          border = {
            style = "rounded",
            padding = { 0, 2 },
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      opts.statusline = {
        status.component.mode {
          mode_text = {
            icon = {
              kind = "VimIcon",
              padding = {
                right = 1,
                left = 1,
              },
            },
            padding = {
              right = 1,
            },
          },
        }, -- add all the other components for the statusline
        status.component.git_branch(),
        status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
      }
      return opts
    end,
  },
  {
    "jamsmendez/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "folke/tokyonight.nvim",
    -- opts = {},
  },
  {
    "sigmasd/deno-nvim",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

          if curr_client and curr_client.name == "denols" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "tsserver" or client.name == "typescript-tools" then
                vim.lsp.stop_client(client.id, true)
              end
            end
          end

          -- if tsserver attached, stop it if there is a denols server attached
          if curr_client and curr_client.name == "tsserver" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end

          -- if typescript-tools attached, stop it if there is a denols server attached
          if curr_client and curr_client.name == "typescript-tools" then
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            for _, client in ipairs(clients) do
              if client.name == "denols" then
                vim.lsp.stop_client(curr_client.id, true)
                break
              end
            end
          end
        end,
      })
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      opts.server = astrolsp_avail and astrolsp.lsp_opts "denols"
      opts.server.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
    end,
  },
  {
    "fatih/vim-go",
    keys = {
      { "C-n", "<cmd>:cnext<cr>", desc = "Next error" },
      { "C-m", "<cmd>:cprevious<cr>", desc = "Prev error" },
      { "<leader>a", "<cmd>:cclose<cr>", desc = "Close error" },
    },
  },
}
