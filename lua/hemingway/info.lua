-- ##########################################################
-- # Maintainer:   Javier Orfo                              #
-- # URL:          https://github.com/javio7/nvim-hemingway #
-- ##########################################################

local comments = require'hemingway'.comments
local Logger = require'hemingway.util'.Logger
local M = {}

local function get_info_string()
    local ft = vim.bo.filetype or "Unknown"
    local comment = (string.gsub(vim.inspect(comments[ft]), "\n", "")) or "Unknown"
    return "FILETYPE " .. ft, comment
end

function M.show()
    if comments[vim.bo.filetype] then
        local ft, comment = get_info_string()
        local buf_border = vim.api.nvim_create_buf(false, true)
        local ui = vim.api.nvim_list_uis()[1]
        local width = 55
        local height = 5

        local lines = {
            "┌───────────────────── HEMINGWAY ─────────────────────┐",
            "│                                                     │",
            "│                                                     │",
            "│                                                     │",
            "└─────────────────────────────────────────────────────┘",
        }
        vim.api.nvim_buf_set_lines(buf_border, 0, -1, true, lines)

        local opts_border = { relative = 'editor',
            width = width,
            height = height,
            col = (ui.width / 2) - (width / 2),
            row = (ui.height / 2) - (height / 2),
            style = 'minimal',
            focusable = false
        }

        vim.api.nvim_open_win(buf_border, true, opts_border)
        vim.cmd("syn keyword hemInfoTitle HEMINGWAY | hi link hemInfoTitle Boolean")

        local opts_text = {
            relative = 'editor',
            row = opts_border.row + 1,
            height = opts_border.height - 2,
            col = opts_border.col + 2,
            width = opts_border.width - 4,
            style = 'minimal',
        }

        local buf_text = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_open_win(buf_text, true, opts_text)
        vim.cmd("syn keyword hemInfoFiletype FILETYPE | hi link hemInfoFiletype Boolean")

        vim.api.nvim_buf_set_lines(buf_text, 0, -1, true, { ft, "", comment })

        vim.cmd(string.format("au BufLeave <buffer> bd %d | quit", buf_border))
        vim.cmd("nnoremap <buffer> <esc> <cmd>quit<cr>")
    else
        Logger:warn("Comments not set for this unknown file.")
    end
end

return M
