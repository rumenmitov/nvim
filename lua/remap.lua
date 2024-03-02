-- General
  vim.keymap.set("i", "<C-c>", "<esc>")

-- Leader

-- File explorer
  vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Terminal
  vim.keymap.set("n", "<leader>t", vim.cmd.terminal)

-- Copying and pasting from clipboard
  vim.keymap.set("n", "<S-y>", "\"+y")
  vim.keymap.set("v", "<S-y>", "\"+y")
  vim.keymap.set("n", "<S-p>", "\"+p")
  vim.keymap.set("v", "<S-p>", "\"+p")

-- Moving vertically
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Searching for words
  vim.keymap.set("n", "n", "nzz")

-- Code help
  vim.keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float()
  end)
  vim.keymap.set("n", "<leader>fx", function()
      vim.lsp.buf.code_action()
  end)

-- Moving lines
  vim.keymap.set("i", "<C-Up>", "<esc>:m-2<enter>i")
  vim.keymap.set("i", "<C-Down>", "<esc>:m+<enter>i")
  vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")
  vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")

-- Global search and replace 
  vim.keymap.set("n", "<leader>sr", function()
    local search_term = vim.fn.input("Search: ")
    local replace_term = vim.fn.input("Replace: ")
    vim.cmd("%s/" .. search_term .. "/" .. replace_term)
  end)

-- Open file in new buffer
  vim.keymap.set("n", "<leader>o", "<esc>:e ")

-- Buffers
  vim.keymap.set("n", "<C-p>", ":bp<CR>")
  vim.keymap.set("n", "<C-n>", ":bn<CR>")
  vim.keymap.set("n", "<C-q>", ":bd!<CR>")
  vim.keymap.set("n", "<C-s>", ":up!<CR>")

-- Zen mode
  vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode)
