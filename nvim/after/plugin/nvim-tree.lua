
-- examples for your init.lua


-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()


-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
		width = 30,
    mappings = {
      list = {
        { key = "<leader>u", action = "dir_up" },
        { key = "<leader>co", action = "NvimTreeCollapse" },
        { key = "<leader><C-r>", action = "NvimTreeRefresh" },

      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
	on_attach = my_on_attach,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })



vim.keymap.set("n", "<leader>po", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)

