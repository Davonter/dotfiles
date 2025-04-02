-- Lazy.nvim 引导安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 插件配置
return require("lazy").setup({
  -- 核心插件（这些插件通常需要立即加载）
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "lewis6991/impatient.nvim" },

  -- 编辑器增强
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    tag = "compat-nvim-0.7",
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "moll/vim-bbye", event = "VeryLazy" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        -- 在这些目录中显示项目标记
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".projectroot" },
        -- 显示最近的项目
        show_hidden = false,
        -- 当切换项目时自动切换到项目目录
        silent_chdir = true,
        -- 当发现项目时自动更新cwd
        update_cwd = true,
        -- 当发现项目时自动更新工作区
        update_focused_file = {
          enable = true,
          update_cwd = true
        },
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    tag = "v2.1.0",
  },

  -- Telescope 相关
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "MattesGroeger/vim-bookmarks" },
      { "tom-anders/telescope-vim-bookmarks.nvim" },
    },
  },

  -- Treesitter 相关
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    tag = "v0.9.1",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
      },
      {
        "romgrk/nvim-treesitter-context",
        event = "VeryLazy",
      },
      { "andymass/vim-matchup", event = "VeryLazy" },
      { "bfrg/vim-cpp-modern", event = "VeryLazy" },
    },
  },

  -- LSP 相关
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "jose-elias-alvarez/null-ls.nvim" },
      { "RRethy/vim-illuminate", event = "VeryLazy" },
      { "p00f/clangd_extensions.nvim", event = "VeryLazy" },
      {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
      },
    },
  },

  -- 编辑器功能增强
  { "preservim/nerdcommenter", event = "VeryLazy" },
  {
    "Shatur/neovim-session-manager",
    event = "VeryLazy",
    commit = "a0b9d25154be573bc0f99877afb3f57cf881cce7",
  },
  { "hedyhli/outline.nvim", event = "VeryLazy" },

  -- 补全相关
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },

  -- 其他工具
  { "ethanholz/nvim-lastplace", event = "BufReadPre" },
  { "nvim-pack/nvim-spectre", event = "VeryLazy" },
  { "tpope/vim-repeat", event = "VeryLazy" },
  { "tpope/vim-surround", event = "VeryLazy" },
  {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopLine", "HopChar1" },
  },

  -- Git 相关
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    tag = "v0.7",
  },
  { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },

  -- UI 相关
  { "lunarvim/colorschemes", lazy = true },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
  },
  { "Mofiqul/dracula.nvim", lazy = true },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    tag = "v2.10.0",
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.1",
    event = "LspAttach",
  },
  { "sindrets/winshift.nvim", cmd = "WinShift" },
  { "EdenEast/nightfox.nvim", lazy = true },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- litee 系列
  {
    "ldelossa/litee.nvim",
    event = "VeryLazy",
    dependencies = {
      { "ldelossa/litee-calltree.nvim" },
    },
  },
  { "levouh/tint.nvim", event = "VeryLazy" },

  { "cpea2506/one_monokai.nvim", lazy = true },

  -- 工具类插件
  {
    "voldikss/vim-translator",
    cmd = { "Translate", "TranslateW", "TranslateR", "TranslateX" },
  },
  { "mtdl9/vim-log-highlighting", ft = "log" },
  { "Pocco81/HighStr.nvim", cmd = "HSHighlight" },
  {
    "vim-test/vim-test",
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
  },
  {
    "Pocco81/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
  },
  { "djoshea/vim-autoread", event = "VeryLazy" },
  {
    "VonHeikemen/fine-cmdline.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
  },
}, {
  -- Lazy.nvim 配置
  defaults = {
    lazy = true, -- 默认所有插件延迟加载
  },
  install = {
    colorscheme = { "nightfox", "habamax" }, -- 安装时使用的主题
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  change_detection = {
    notify = false, -- 禁用更改检测通知
  },
})
