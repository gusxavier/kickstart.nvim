-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'NeogitOrg/neogit',
    branch = 'nightly',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diffview open' },
    },
  },
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitlinker').setup { mappings = nil }
    end,
    keys = {
      {
        '<leader>gl',
        "<cmd>lua require('gitlinker').get_buf_range_url('n')<cr>",
        mode = 'n',
        desc = 'Git link line',
      },
      {
        '<leader>gl',
        "<cmd>lua require('gitlinker').get_buf_range_url('v')<cr>",
        mode = 'v',
        desc = 'Git link range',
      },
      {
        '<leader>gL',
        "<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').open_in_browser})<cr>",
        mode = 'v',
        desc = 'Git open repo homepage',
      },
    },
  },
  {
    'echasnovski/mini.files',
    config = true,
    opts = {
      mappings = {
        go_in = 'L',
        go_in_plus = 'l',
      },
    },
    keys = {
      { '<leader>e', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>', desc = 'Mini.files open current file dir' },
      { '<leader>E', '<cmd>lua MiniFiles.open()<cr>', desc = 'Mini.files open' },
    },
  },
  {
    'guns/vim-sexp',
    ft = 'clojure',
  },
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = 'clojure',
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    ft = 'clojure',
    config = function()
      require('rainbow-delimiters.setup').setup {}
    end,
  },
  {
    'Olical/conjure',
    ft = { 'clojure' },
    config = function()
      vim.g['conjure#client#clojure#nrepl#test#current_form_names'] = {
        'deftest',
        'defspec',
        'defflow',
        'init-flow',
        'init-e2e-flow',
      }
      vim.g['conjure#log#botright'] = true
      vim.g['conjure#log#wrap'] = true
      vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = false
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
      vim.g['conjure#extract#tree_sitter#enabled'] = true
      -- vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
      -- Make LSP diagnostics ignore log file
      vim.cmd 'autocmd BufReadPost,BufNewFile conjure-log-* lua vim.diagnostic.disable(0)'
    end,
  },
}
