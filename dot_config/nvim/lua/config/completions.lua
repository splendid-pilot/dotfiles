local bind = require("utils.bind")
local map_cr = bind.map_cr

local mapping = {}

function mapping.lsp(buf)
  local map = {
    ["n|go"] = map_cr("AerialToggle!"):with_silent():with_buffer(buf):with_desc("lsp: Toggle outline"),
  }

  bind.nvim_load_mapping(map)
end
return mapping
