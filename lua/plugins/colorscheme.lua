return {
  -- Option 1: Simple slimfat-inspired colorscheme (no dependencies)
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        
        -- Custom slimfat colors
        on_colors = function(colors)
          colors.bg = "#2f2f2f"           -- Match slimfat background
          colors.bg_dark = "#252525"      -- Darker background
          colors.bg_float = "#2f2f2f"     -- Float background
          colors.bg_popup = "#2f2f2f"     -- Popup background
          colors.bg_sidebar = "#252525"   -- Sidebar background
          colors.bg_statusline = "#2f2f2f" -- Statusline background
          
          colors.fg = "#26C6DA"           -- Match slimfat cyan text
          colors.fg_dark = "#7a7a7a"      -- Match slimfat gray
          colors.fg_float = "#26C6DA"     -- Float text
          colors.fg_sidebar = "#26C6DA"   -- Sidebar text
          
          colors.comment = "#7a7a7a"      -- Match slimfat gray
          colors.dark3 = "#7a7a7a"        -- UI gray
          colors.dark5 = "#353535"        -- Lighter background
          
          -- Keep some accent colors for syntax highlighting
          colors.blue = "#26C6DA"         -- Use cyan for functions
          colors.cyan = "#4DD0E1"         -- Brighter cyan
          colors.green = "#66BB6A"        -- Softer green
          colors.orange = "#FFA726"       -- Orange for numbers/constants
          colors.purple = "#AB47BC"       -- Purple for keywords
          colors.red = "#EF5350"          -- Red for errors
          colors.yellow = "#FFEE58"       -- Yellow for warnings
        end,
        
        on_highlights = function(highlights, colors)
          -- Line numbers (as requested)
          highlights.LineNr = { fg = colors.comment }
          highlights.CursorLineNr = { fg = colors.cyan, bold = true }
          
          -- Make sure main text uses slimfat cyan
          highlights.Normal = { fg = colors.fg, bg = colors.bg }
          highlights.NormalFloat = { fg = colors.fg, bg = colors.bg_float }
          
          -- Telescope styling
          highlights.TelescopeSelection = { bg = colors.dark5, fg = colors.cyan }
          highlights.TelescopeSelectionCaret = { fg = colors.cyan }
          highlights.TelescopePromptPrefix = { fg = colors.cyan }
          highlights.TelescopeMatching = { fg = colors.cyan, bold = true }
          
          -- Tree highlighting
          highlights.NvimTreeNormal = { fg = colors.fg, bg = colors.bg_sidebar }
          highlights.NvimTreeFolderName = { fg = colors.fg }
          highlights.NvimTreeOpenedFolderName = { fg = colors.cyan }
          highlights.NvimTreeSpecialFile = { fg = colors.cyan }
          
          -- Statusline
          highlights.StatusLine = { fg = colors.fg, bg = colors.bg_statusline }
          highlights.StatusLineNC = { fg = colors.comment, bg = colors.bg_dark }
        end,
      })
      
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- Option 2: Use Catppuccin with slimfat colors (alternative)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false, -- Enable this if you prefer catppuccin base
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        color_overrides = {
          mocha = {
            base = "#2f2f2f",         -- Background (matches slimfat)
            mantle = "#252525",       -- Darker background
            crust = "#1e1e1e",        -- Darkest background
            text = "#26C6DA",         -- Main text (matches slimfat)
            subtext1 = "#7a7a7a",     -- Secondary text (matches slimfat)
            subtext0 = "#6a6a6a",     -- Tertiary text
            overlay2 = "#5a5a5a",     -- UI elements
            overlay1 = "#4a4a4a",     -- UI elements
            overlay0 = "#3a3a3a",     -- UI elements
            surface2 = "#353535",     -- Surface elements
            surface1 = "#303030",     -- Surface elements
            surface0 = "#2b2b2b",     -- Surface elements
          },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          telescope = { enabled = true },
          mason = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
