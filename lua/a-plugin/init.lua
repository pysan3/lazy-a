local M = {
  level = vim.log.levels.INFO,
}

function M.say(msg)
  vim.notify(string.format([[say(%s): %s]], M.level, msg), M.level, {})
end

function M.is_valid_level(level)
  for _, value in ipairs(vim.log.levels) do
    if value == level then
      return true
    end
  end
  return false
end

function M.setup(config)
  if config and M.is_valid_level(config.level) then
    M.level = config.level
  end
  local setup_res = { pcall(M.say, [[A: Hello from init.lua setup!]]) }
  vim.print(string.format([[A: setup_res: %s]], vim.inspect(setup_res)))
end

return M
