--
-- LSP config
--
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require'virtualtypes'.on_attach

-- Configure servers.
lspconfig.html.setup({ cmd = { 'html-languageserver', '--stdio' }, filetypes = { 'html', 'blade' }, on_attach = on_attach, capabilities = capabitilies })
lspconfig.intelephense.setup({ on_attach = on_attach, capabilities = capabitilies })
lspconfig.crystalline.setup({ on_attach = on_attach, capabilities = capabitilies })
lspconfig.tailwindcss.setup({ capabitilies = capabitilies })
lspconfig.ccls.setup({ capabitilies = capabitilies })
lspconfig.zls.setup({ cmd = { '/home/cyril/zls/zls' }, filetypes = { 'zig' }, capabilities = capabitilies })
lspconfig.gdscript.setup({ on_attach = on_attach, flags = { debounce_text_changes = 150, }, capabilities = capabitilies })

-- Signature

require "lsp_signature".setup {
    bind = true,
    doc_lines = 5,
    trigger_on_newline = true
}
