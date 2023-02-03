-- ##########################################################
-- # Maintainer:   Javier Orfo                              #
-- # URL:          https://github.com/javio7/nvim-hemingway #
-- ##########################################################

local M = {}

function M.is_string(value) return type(value) == "string" end

function M.table_length(table)
    local count = 0
    for _ in pairs(table) do count = count + 1 end
    return count
end

return M
