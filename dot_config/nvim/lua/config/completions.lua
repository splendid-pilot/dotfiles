local bind = require("utils.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local mapping = {}

function mapping.lsp(buf)
  local map = {
    ["n|go"] = map_cr("AerialToggle!"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
    -- ["n|gs"] = map_callback(function()
    --     vim.lsp.buf.signature_help()
    --   end)
    --   :with_desc("lsp: Signature help")
    --   :with_buffer(buf)
    --   :with_silent(),
    -- ["n|<leader>cR"] = map_cr("Lspsaga rename ++project")
    --   :with_silent()
    --   :with_buffer(buf)
    --   :with_desc("lsp: Rename in project range"),
    -- ["nv|ga"] = map_cr("Lspsaga code_action"):with_silent():with_buffer(buf):with_desc("lsp: Code action for cursor"),
    -- ["nv|<C-S-k>"] = map_cr("Lspsaga peek_definition"):with_silent():with_buffer(buf):with_desc("lsp: Peek definition"),
    -- ["n|gh"] = map_cr("Glance references"):with_silent():with_buffer(buf):with_desc("lsp: Show reference"),
    -- ["n|gm"] = map_cr("Glance implementations"):with_silent():with_buffer(buf):with_desc("lsp: Show implementation"),
  }

  bind.nvim_load_mapping(map)
end
return mapping
