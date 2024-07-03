--
-- LSP config
--
local vim = vim
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require'virtualtypes'.on_attach
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

null_ls.setup({})

require("mason").setup({})
require("mason-lspconfig").setup({})

-- Automatic servers.
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  on_attach = on_attach,
  capabilities = capabilities,
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end,

  ["crystalline"] = function()
    lspconfig.crystalline.setup({
      single_file_support = false
    })
  end,
})


-- Signature
require "lsp_signature".setup {
    bind = true,
    doc_lines = 5,
    trigger_on_newline = true
}

local kind = {
  Text = "TSText",
  Method = "TSFunction",
  Function = "TSFunction",
  Constructor = "TSConstructor",
  Field = "TSField",
  Variable = "TSVariable",
  Class = "TSVariableBuiltin",
  Interface = "TSVariableBuiltin",
  Module = "TSVariableBuiltin",
  Property = "TSProperty",
  Unit = "TSInclude",
  Value = "TSText",
  Enum = "TSVariableBuiltin",
  Keyword = "TSKeyword",
  Snippet = "TSTag",
  Color = "TSText",
  File = "TSInclude",
  Reference = "TSVariable",
  Folder = "TSText",
  EnumMember = "TSField",
  Constant = "TSConstant",
  Struct = "TSVariableBuiltin",
  Event = "TSText",
  Operator = "TSOperator",
  TypeParameter = "TSParameter"
}

for key, value in pairs(kind) do
  vim.cmd("highlight! link CmpItemKind" .. key .. " " .. value)
end
