O = {
  cmdheight = 1,
  auto_close_tree = 0,
  auto_complete = true,
  colorscheme = 'onedark', -- aurora, nord, onedark, palenight
  relative_number = true,
  shell = 'zsh',
  python = {
    linter = '',
    -- @usage can be 'yapf', 'black'
    formatter = '',
    autoformat = false,
    isort = false,
    diagnostics = { virtual_text = true, signs = true, underline = true }
  },
  lua = {
    -- @usage can be 'lua-format'
    formatter = '',
    autoformat = false,
    diagnostics = { virtual_text = true, signs = true, underline = true }
  },
  sh = {
    -- @usage can be 'shellcheck'
    linter = '',
    -- @usage can be 'shfmt'
    formatter = '',
    autoformat = false,
    diagnostics = { virtual_text = true, signs = true, underline = true }
  },
  json = {
    formatter = 'prettier',
    autoformat = false,
    diagnostics = { virtual_text = true, signs = true, underline = true }
  },
  css = { formatter = 'prettier', autoformat = false, virtual_text = true },
}

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
