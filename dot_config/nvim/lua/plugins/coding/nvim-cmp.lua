return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "lukas-reineke/cmp-under-comparator" },
    { "f3fora/cmp-spell" },
    { "hrsh7th/cmp-buffer" },
    { "kdheepak/cmp-latex-symbols" },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    table.insert(opts.sources, #opts.sources + 1, {
      name = "neorg",
    })
    table.insert(opts.sources, #opts.sources + 1, {
      name = "spell",
    })
    table.insert(opts.sources, #opts.sources + 1, {
      name = "latex_symbols",
    })

    compare.lsp_scores = function(entry1, entry2)
      local diff
      if entry1.completion_item.score and entry2.completion_item.score then
        diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
      else
        diff = entry2.score - entry1.score
      end
      return (diff < 0)
    end
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        -- require("cmp_tabnine.compare"),
        compare.offset, -- Items closer to cursor will have lower priority
        compare.exact,
        -- compare.scopes,
        compare.lsp_scores,
        compare.sort_text,
        compare.score,
        compare.recently_used,
        -- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
        require("cmp-under-comparator").under,
        compare.kind,
        compare.length,
        compare.order,
      },
    }
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
