-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",

  -- Overrides for jonathan blow theme
  hl_override = {
    -- Custom editor colors
    ["Comment"] = { italic = true, fg = "#3fdf1f" },
    Normal = { fg = "#d3b58d", bg = "#041818" },
    ["@comment"] = { italic = true, fg = "#3fdf1f" },
    Keyword = { fg = "#ffffff" },
    ["Visual"] = { bg = "#1d90ff" },
    ModeMsg = { reverse = true }, -- mode-line
    -- CursorLine = { bg = "#d0f0d0" }, -- close to darkseagreen2 highlight
    Search = { fg = "#000080", bg = "#d0f0d0" }, -- highlight
    String = { fg = "#0fdfaf" },
    Identifier = { fg = "#c8d4ec" },
    WarningMsg = { fg = "#504038" },

    -- Telescope highlights
    TelescopeNormal = { bg = "#041818" },
    TelescopeBorder = { bg = "#041818", fg = "#041818" },
    TelescopePromptNormal = { bg = "#0f1f1f" },
    TelescopePromptBorder = { bg = "#0f1f1f", fg = "#0f1f1f" },
    TelescopeResultsNormal = { bg = "#041818" },
    TelescopeResultsBorder = { bg = "#041818", fg = "#041818" },
    TelescopeSelection = { bg = "#0f2f2f" },

    NvimTreeNormal = { bg = "#041818", fg = "#d3b58d" },
    NvimTreeNormalNC = { bg = "#041818", fg = "#d3b58d" },
    NvimTreeEndOfBuffer = { fg = "#041818" },
    NvimTreeCursorLine = { bg = "#0f1f1f" },

    -- File/directory highlights
    NvimTreeDirectoryName = { fg = "#c8d4ec" },
    NvimTreeFileName = { fg = "#d3b58d" },
    NvimTreeRootName = { fg = "#ffffff", bold = true },
    NvimTreeIndentMarker = { fg = "#3fdfaf" },
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M
