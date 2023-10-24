
local lsp_zero = require('lsp-zero')
local sig_config = {
	log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
	debug = true,
	hint_enable = false,
	handler_opts = { border = "single" },
	always_trigger = false,
	timer_interval = 400,
	max_width = 80,
}

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})


require "lsp_signature".setup(sig_config)
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

-- local lsp = require('lsp-zero')
--
-- local sig_config = {
-- 	log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
-- 	debug = true,
-- 	hint_enable = false,
-- 	handler_opts = { border = "single" },
-- 	always_trigger = false,
-- 	timer_interval = 400,
-- 	max_width = 80,
-- }
--
--
-- lsp.preset('recommended')
--
-- -- lsp.ensure_installed()
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 	['<CR>'] = cmp.mapping.confirm({select = false}),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
--
-- cmp.setup({
--   mapping = cmp_mappings
-- })
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
--
-- lsp.setup()
--
-- -- Pyright
-- -- require('lspconfig')['pyright'].setup{
-- -- 	--single_file_support = false,
-- -- 	root_dir = function()
-- -- 		return vim.fn.getcwd()
-- -- 	end
-- -- }
-- --
--
-- vim.diagnostic.config({
--     virtual_text = true,
-- })
--
-- require("luasnip.loaders.from_vscode").lazy_load()
--
-- -- let asyncomplete_auto_completeopt = 0
-- -- set completeopt=menuone,noinsert,noselect,preview


