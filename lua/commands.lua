-- Genereal
  vim.cmd([[ au BufEnter *.txt,*conf*,*.c,*.cpp,*.rs,*.go,*.html,*.css,*.js,*.ts,*.tsx,*.jsx,*.yaml,*.yml,*.toml,*.py call feedkeys("g;zz") ]])

-- Spell checker
  vim.cmd([[ au BufEnter *.txt :set spell ]])

-- Highlight colors
  vim.cmd([[ au BufEnter *.css :HighlightColorsOn ]])

-- Line width
