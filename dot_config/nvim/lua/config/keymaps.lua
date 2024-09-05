local bind = require("utils.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode
local plain_map = {
  -- insert mode
  ["i|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: move forward one char"),
  ["i|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: move backward one char"),
  ["i|<A-f>"] = map_cmd("<C-Right>"):with_noremap():with_desc("edit: move forward one char"),
  ["i|<A-b>"] = map_cmd("<C-Left>"):with_noremap():with_desc("edit: move backward one word"),
  ["i|<C-e>"] = map_cmd("<C-o><S-a>"):with_noremap():with_desc("edit: move to the end of line"),
  ["i|<C-a>"] = map_cmd("<C-o><S-i>"):with_noremap():with_desc("edit: move to the beginning of line"),
  ["i|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: delete next word"),
  ["i|<C-j>"] = map_cmd("<C-o>o"):with_noremap():with_desc("edit: add a newline below"),
  ["i|<C-S-j>"] = map_cmd("<C-o>O"):with_noremap():with_desc("edit: add a newline above"),
  ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"):with_desc("edit: Save file"):with_noremap(),

  -- normal mode
  ["n|<S-Tab>"] = map_cr("normal za"):with_noremap():with_silent():with_desc("edit: Toggle code fold"),
  ["n|<C-q>"] = map_cr("wq"):with_desc("edit: Save file and quit"):with_silent():with_noremap(),
  ["n|<A-q>"] = map_cr("q!"):with_desc("edit: Force quit"):with_silent():with_noremap(),
  ["n|<c-n>"] = map_cmd("*``"):with_noremap():with_desc("search: search word under cursor"),
  ["n|cn"] = map_cmd("*``cgn"):with_noremap():with_desc("search: search and replace word under cursor"),
  ["n|<leader>e"] = map_cr("lua vim.diagnostic.open_float();vim.diagnostic.config({virtual_text=false})")
    :with_noremap()
    :with_desc("Open diagnostic")
    :with_silent(),
  ["n|<leader>fx"] = map_cr("!chmod u+x %"):with_noremap():with_desc("Make file executable"):with_silent(),
  ["n|0"] = map_cmd("^"):with_noremap():with_desc("Move to the beginning of line"):with_silent(),
  ["n|<F5>"] = map_cmd([[
  :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
  ]])
    :with_noremap()
    :with_desc("Strip trailing whitespaces")
    :with_silent(),
}
local plug_map = {
  -- command-line mode
  ["c|<C-b>"] = map_cmd("<Left>"):with_noremap():with_desc("edit: Left"),
  ["c|<C-f>"] = map_cmd("<Right>"):with_noremap():with_desc("edit: Right"),
  ["c|<C-a>"] = map_cmd("<Home>"):with_noremap():with_desc("edit: Home"),
  ["c|<C-e>"] = map_cmd("<End>"):with_noremap():with_desc("edit: End"),
  ["c|<C-d>"] = map_cmd("<Del>"):with_noremap():with_desc("edit: Delete"),
  ["c|<C-h>"] = map_cmd("<BS>"):with_noremap():with_desc("edit: Backspace"),
  ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]])
    :with_noremap()
    :with_silent()
    :with_desc("edit: Complete path of current file"),
  ["c|<A-b>"] = map_cmd("<C-Left>"):with_noremap():with_desc("edit: Left a word"),
  ["c|<A-f>"] = map_cmd("<C-Right>"):with_noremap():with_desc("edit: Right a word"),
  ["c|<C-k>"] = map_cmd([[<C-\>estrpart(getcmdline(),0,getcmdpos()-1) <CR>]])
    :with_noremap()
    :with_desc("edit: kill to end of the line"),

  -- Plugin accelerated-jk
  ["n|j"] = map_callback(function()
    return et("<Plug>(accelerated_jk_gj)")
  end):with_expr(),
  ["n|k"] = map_callback(function()
    return et("<Plug>(accelerated_jk_gk)")
  end):with_expr(),

  -- dropbar.nvim
  ["n|<leader>fa"] = map_callback(function()
      require("dropbar.api").pick()
    end)
    :with_noremap()
    :with_silent()
    :with_desc("Pick dropbar"),

  -- smart-splits
  ["n|<A-h>"] = map_cu("SmartResizeLeft"):with_silent():with_noremap():with_desc("window: Resize -3 horizontally"),
  ["n|<A-'>"] = map_cu("SmartResizeDown"):with_silent():with_noremap():with_desc("window: Resize -3 vertically"),
  ["n|<A-;>"] = map_cu("SmartResizeUp"):with_silent():with_noremap():with_desc("window: Resize +3 vertically"),
  ["n|<A-l>"] = map_cu("SmartResizeRight"):with_silent():with_noremap():with_desc("window: Resize +3 horizontally"),
  ["n|<leader>wh"] = map_cu("SmartCursorMoveLeft"):with_silent():with_noremap():with_desc("window: Focus left"),
  ["n|<leader>wj"] = map_cu("SmartCursorMoveDown"):with_silent():with_noremap():with_desc("window: Focus down"),
  ["n|<leader>wk"] = map_cu("SmartCursorMoveUp"):with_silent():with_noremap():with_desc("window: Focus up"),
  ["n|<leader>wl"] = map_cu("SmartCursorMoveRight"):with_silent():with_noremap():with_desc("window: Focus right"),
  ["n|<leader>wH"] = map_cu("SmartSwapLeft"):with_silent():with_noremap():with_desc("window: Move window leftward"),
  ["n|<leader>wJ"] = map_cu("SmartSwapDown"):with_silent():with_noremap():with_desc("window: Move window downward"),
  ["n|<leader>wK"] = map_cu("SmartSwapUp"):with_silent():with_noremap():with_desc("window: Move window upward"),
  ["n|<leader>wL"] = map_cu("SmartSwapRight"):with_silent():with_noremap():with_desc("window: Move window rightward"),

  -- Bufferline
  ["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent():with_desc("buffer: Goto buffer 1"),
  ["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent():with_desc("buffer: Goto buffer 2"),
  ["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent():with_desc("buffer: Goto buffer 3"),
  ["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent():with_desc("buffer: Goto buffer 4"),
  ["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent():with_desc("buffer: Goto buffer 5"),
  ["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent():with_desc("buffer: Goto buffer 6"),
  ["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent():with_desc("buffer: Goto buffer 7"),
  ["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent():with_desc("buffer: Goto buffer 8"),
  ["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent():with_desc("buffer: Goto buffer 9"),
  ["n|<leader>bf"] = map_cr("BufferLinePick"):with_noremap():with_silent():with_desc("buffer: Pick buffer"),
  ["n|<leader>bF"] = map_cr("BufferLinePickClose")
    :with_noremap()
    :with_silent()
    :with_desc("buffer: Pick buffer to close"),
  ["n|<leader>bs"] = map_cr("BufferLineSortByDirectory")
    :with_noremap()
    :with_silent()
    :with_desc("buffer: Sort buffer by tabs"),

  -- Plugin: hop.nvim
  ["nv|<leader>hw"] = map_cmd("<Cmd>HopWordMW<CR>"):with_noremap():with_desc("jump: Goto word"),
  ["nv|<leader>hj"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap():with_desc("jump: Goto line"),
  ["nv|<leader>hk"] = map_cmd("<Cmd>HopLineMW<CR>"):with_noremap():with_desc("jump: Goto line"),
  ["nv|<leader>hc"] = map_cmd("<Cmd>HopChar1MW<CR>"):with_noremap():with_desc("jump: Goto one char"),
  ["nv|<leader>hC"] = map_cmd("<Cmd>HopChar2MW<CR>"):with_noremap():with_desc("jump: Goto two chars"),

  -- Plugin: nvim-spectre
  ["n|<leader>sp"] = map_callback(function()
      require("spectre").open_visual({ select_word = true })
    end)
    :with_silent()
    :with_noremap()
    :with_desc("editn: search&replace current word (project)"),
  ["v|<leader>sp"] = map_callback(function()
      require("spectre").open_visual()
    end)
    :with_silent()
    :with_noremap()
    :with_desc("edit: search & replace current word (project)"),
  ["n|<leader>sf"] = map_callback(function()
      require("spectre").open_file_search({ select_word = true })
    end)
    :with_silent()
    :with_noremap()
    :with_desc("editn: search & replace current word (file)"),

  -- Plugin Oil.nvim
  ["n|-"] = map_cr("Oil"):with_silent():with_noremap():with_desc("Oil"),

  --telescope
  ["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent():with_desc("find: Session"),
  ["n|<leader>fr"] = map_callback(function()
      require("telescope").extensions.frecency.frecency({})
    end)
    :with_noremap()
    :with_silent()
    :with_desc("find: File by frecency"),
  ["n|<leader>fu"] = map_callback(function()
      require("telescope").extensions.undo.undo()
    end)
    :with_noremap()
    :with_silent()
    :with_desc("edit: Show undo history"),
  ["n|<leader>fw"] = map_cu("Telescope grep_string")
    :with_noremap()
    :with_silent()
    :with_desc("Telescope: grep word under cursor"),
  ["n|<leader>fB"] = map_cu("Telescope file_browser path=%:p:h select_buffer=true")
    :with_noremap()
    :with_silent()
    :with_desc("Telescope: File brwoser (cwd)"),
  ["n|<leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent():with_desc("Telescope: zoxide"),
  ["n|<leader>fc"] = map_callback(function()
      require("telescope").extensions.file_browser.file_browser({
        cwd = vim.fn.stdpath("config"),
        depth = false,
        grouped = true,
        add_dirs = false,
        mappings = {
          ["n"] = {
            ["<C-B>"] = require("telescope.actions").preview_scrolling_left,
          },
          ["i"] = {
            ["<C-B>"] = require("telescope.actions").preview_scrolling_left,
          },
        },
      })
    end)
    :with_desc("Telescope: Find Conifg File")
    :with_noremap()
    :with_silent(),

  -- Plugin zen-mode.nvim
  ["n|<leader>uz"] = map_callback(function()
      if vim.g.is_zen == nil or vim.g.is_zen == false then
        vim.g.is_zen = true
        require("lualine").hide()
        require("zen-mode").toggle({
          window = {
            width = 0.85,
          },
        })
      else
        vim.g.is_zen = false
        require("lualine").hide({ unhide = true })
        require("zen-mode").close({})
      end
    end)
    :with_noremap()
    :with_silent()
    :with_desc("Toggle zen-mode"),
}

if not vim.g.is_windows then
  local linux_map = {
    -- Plugin suda.vim
    ["n|<A-s>"] = map_cu("SudaWrite"):with_silent():with_noremap():with_desc("editn: Save file using sudo"),

    -- Plugin sniprun
    ["v|<leader>rr"] = map_cr("SnipRun"):with_desc("Run code by range"):with_noremap():with_silent(),
    ["n|<leader>rr"] = map_cu([[%SnipRun]]):with_desc("Run code by file"):with_noremap():with_silent(),
    -- Plugin yazi.nvim
    ["n|<leader>f-"] = map_callback(function()
        require("yazi").yazi()
      end)
      :with_desc("Open the yazi")
      :with_noremap()
      :with_silent(),
    ["n|<leader>cw"] = map_callback(function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end)
      :with_desc("Open the yazi at working dir")
      :with_noremap()
      :with_silent(),
  }
  bind.nvim_load_mapping(linux_map)
end

if vim.g.neovide then
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  local neovide_map = {
    ["nivct|<C-=>"] = map_callback(function()
        change_scale_factor(1.25)
      end)
      :with_noremap()
      :with_silent()
      :with_desc("Neovide: increase font size"),
    ["nivct|<C-->"] = map_callback(function()
        change_scale_factor(1 / 1.25)
      end)
      :with_noremap()
      :with_silent()
      :with_desc("Neovide: increase font size"),
    ["c|<C-S-v>"] = map_cmd("<C-R>+"):with_silent():with_noremap(),
    ["nivct|<C-S-F11>"] = map_callback(function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
      end)
      :with_silent()
      :with_noremap(),
    ["t|<Esc><Esc>"] = map_cmd([[<C-\><C-n>]]):with_noremap():with_silent(), -- switch to normal mode in terminal.
    ["n|<C-\\>"] = map_cr("ToggleTerm direction=horizontal")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle horizontal"),
    ["i|<C-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=horizontal<CR>")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle horizontal"),
    ["t|<C-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle horizontal"),
    ["n|<A-\\>"] = map_cr("ToggleTerm direction=vertical")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle vertical"),
    ["i|<A-\\>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle vertical"),
    ["t|<A-\\>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
    ["n|<F5>"] = map_cr("ToggleTerm direction=vertical")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle vertical"),
    ["i|<F5>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=vertical<CR>")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle vertical"),
    ["t|<F5>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle vertical"),
    ["n|<A-d>"] = map_cr("ToggleTerm direction=float"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
    ["i|<A-d>"] = map_cmd("<Esc><Cmd>ToggleTerm direction=float<CR>")
      :with_noremap()
      :with_silent()
      :with_desc("terminal: Toggle float"),
    ["t|<A-d>"] = map_cmd("<Cmd>ToggleTerm<CR>"):with_noremap():with_silent():with_desc("terminal: Toggle float"),
  }
  bind.nvim_load_mapping(neovide_map)
end

bind.nvim_load_mapping(plain_map)
if not vim.g.vscode then
  bind.nvim_load_mapping(plug_map)
  vim.keymap.del("t", "<C-h>")
  vim.keymap.del("t", "<C-l>")
  vim.keymap.del("t", "<C-k>")
  vim.keymap.del("t", "<C-j>")
end
