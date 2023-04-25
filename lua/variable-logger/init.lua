local default_config = {
  prefix = '',
}

local M = {}

function M.setup(opt)
  if opt ~= nil then
    M.config = opt
  end
end

function M.log_variable(prefix)
  vim.fn.setreg('"', "")
  local current_position = vim.api.nvim_win_get_cursor(0)
  vim.cmd("normal! viwy")
  local yanked_text = vim.fn.getreg('"')
  vim.fn.setreg('"', string.format("console.log(%s, %s, '%s', %s)\n", M.config.prefix, prefix, yanked_text, yanked_text))
  vim.api.nvim_win_set_cursor(0, current_position)
end

return M
