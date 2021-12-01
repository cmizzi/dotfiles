--
-- LSP config
--
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require'virtualtypes'.on_attach
local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")

null_ls.config({
    sources = {
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.formatting.rustywind.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "html", "blade", },
        }),
        -- null_ls.builtins.diagnostics.psalm,
    }
})

-- Configure servers.
lspconfig["null-ls"].setup({ on_attach = on_attach })

-- Automatic servers.
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    server:setup(opts)
end)

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
