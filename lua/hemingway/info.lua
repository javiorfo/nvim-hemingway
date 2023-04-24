local comments = require'hemingway'.comments
local Logger = require'hemingway.util'.Logger
local popcorn = require'popcorn'
local borders = require'popcorn.borders'
local M = {}

local function get_info_string()
    local ft = vim.bo.filetype or "Unknown"
    local comment = (string.gsub(vim.inspect(comments[ft]), "\n", "")) or "Unknown"
    return "FILETYPE " .. ft, comment
end

function M.show()
    if comments[vim.bo.filetype] then
        local ft, comment = get_info_string()
        local opts = {
            width = 55,
            height = 5,
            title = { "HEMINGWAY", "Boolean" },
            border = borders.double_border,
            content = {{ ft, "String" }, { "" }, { comment }}
        }

        popcorn:new(opts):pop()
    else
        Logger:warn("Comments not set for this unknown file.")
    end
end

return M
