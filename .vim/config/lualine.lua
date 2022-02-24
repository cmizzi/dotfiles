require('lualine').setup({
  options = {
    theme = 'rose-pine',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      'branch',
      'diff',
    { 'diagnostics', sources = { 'nvim_diagnostic' } },
    },
    lualine_c = { 
      'filename', 
    },
    lualine_x = {
      'filetype',
      'encoding',
      'fileformat',
    },
    lualine_y = {
      '(vim.bo.expandtab and "●" or "⇥ ") .. " " .. vim.bo.shiftwidth',
    },
    lualine_z = {
      'location',
      'progress',
    },
  },
})
