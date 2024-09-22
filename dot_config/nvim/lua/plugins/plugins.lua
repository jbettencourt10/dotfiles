return {
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
},
{ "navarasu/onedark.nvim", name = "onedark", priority = 1000 },

}
