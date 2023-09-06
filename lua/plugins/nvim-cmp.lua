-- then: setup supertab in cmp
return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-emoji',
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    local luasnip = require('luasnip')
    local cmp = require('cmp')

    opts.mapping = vim.tbl_extend('force', opts.mapping, {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        -- Don't block <CR> if signature help is active
        -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
        if
          not cmp.visible()
          or not cmp.get_selected_entry()
          or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help'
        then
          fallback()
        else
          cmp.confirm({
            -- Replace word if completing in the middle of a word
            -- https://github.com/hrsh7th/nvim-cmp/issues/664
            behavior = cmp.ConfirmBehavior.Replace,
            -- Don't select first item on CR if nothing was selected
            select = false,
          })
        end
      end,
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { 'i', 's' }),
      -- ['<S-Tab>'] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   elseif luasnip.jumpable(-1) then
      --     luasnip.jump(-1)
      --   else
      --     fallback()
      --   end
      -- end, { 'i', 's' }),
    })
  end,
}
