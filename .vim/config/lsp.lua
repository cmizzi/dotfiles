--
-- LSP config
--
local lspconfig = require('lspconfig')
local coq = require 'coq'
local on_attach = function ()
    -- Nothing.
end

-- Configure servers.
lspconfig.html.setup(coq.lsp_ensure_capabilities({ cmd = { 'html-languageserver', '--stdio' }, filetypes = { 'html', 'blade' }, on_attach = on_attach }))
lspconfig.intelephense.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lspconfig.crystalline.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach }))
lspconfig.tailwindcss.setup(coq.lsp_ensure_capabilities())
lspconfig.ccls.setup(coq.lsp_ensure_capabilities())
lspconfig.zls.setup(coq.lsp_ensure_capabilities({ cmd = { '/home/cyril/zls/zls' }, filetypes = { 'zig' } }))
lspconfig.gdscript.setup(coq.lsp_ensure_capabilities({ on_attach = on_attach, flags = { debounce_text_changes = 150, } }))

-- Signature

require "lsp_signature".setup {
    bind = true,
    doc_lines = 5,
    trigger_on_newline = true
}
