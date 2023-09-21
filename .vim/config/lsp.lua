--
-- LSP config
--
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require'virtualtypes'.on_attach
local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.rustywind.with({
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "html", "blade", },
        }),
        -- null_ls.builtins.diagnostics.psalm,
    }
})

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

    if server.name == "yamlls" then
      opts.settings = {
        yaml = {
          schemas = {
            ["kubernetes"] = "/*.yaml"
          }
        }
      }
    end

    -- We don't have any other choice yet, we have to define configuration here.
    if server.name == "rust_analyzer" then
      local rustopts = {
        tools = {
          autoSetHints = true,
          hover_with_actions = false,
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },

        server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
          settings = {
            ["rust-analyzer"] = {
              completion = {
                postfix = {
                  enable = false
                }
              },
              checkOnSave = {
                command = "clippy"
              },
            }
          }
        }),
      }

      require("rust-tools").setup(rustopts)
      server:attach_buffers()
    else
      server:setup(opts)
    end
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
