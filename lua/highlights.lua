local M = {}

M.override = {
  -- Neo-tree highlights
  NeoTreeNormal = { bg = "#041818" },
  NeoTreeNormalNC = { bg = "#041818" },
  NeoTreeEndOfBuffer = { fg = "#041818" },
  NeoTreeCursorLine = { bg = "#0f1f1f" },

  -- Telescope highlights
  TelescopeNormal = { bg = "#041818" },
  TelescopeBorder = { bg = "#041818", fg = "#041818" },
  TelescopePromptNormal = { bg = "#0f1f1f" },
  TelescopePromptBorder = { bg = "#0f1f1f", fg = "#0f1f1f" },
  TelescopeResultsNormal = { bg = "#041818" },
  TelescopeResultsBorder = { bg = "#041818", fg = "#041818" },
  TelescopeSelection = { bg = "#0f2f2f" },
}

M.add = {} -- if you have extra groups you want to define manually

return M
