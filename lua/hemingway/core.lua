-- ##########################################################
-- # Maintainer:   Javier Orfo                              #
-- # URL:          https://github.com/javio7/nvim-hemingway #
-- ##########################################################

local comment = require'hemingway'.comments[vim.bo.filetype]

local M = {}
local esc_code = vim.api.nvim_replace_termcodes("<esc>", true, true, true)
local get_line = vim.fn.getline
local set_line = vim.fn.setline

local function is_left_commented(text, comment_string)
    local _, position = string.find(text, comment_string, 1, true)
    if position == #comment_string then
        return true
    end
    return false
end

local function is_right_commented(text, comment_string)
    if string.find(text, comment_string, #text - #comment_string, true) then
        return true
    end
    return false
end

local function get_final_single_line(text)
    if not is_left_commented(text, comment.single) then
        return comment.single .. text
    end
    return string.sub(text, #comment.single + 1)
end

local function get_final_left_line(text)
    if not is_left_commented(text, comment.left) then
        return comment.left .. text
    end
    return string.sub(text, #comment.left + 1)
end

local function get_final_right_line(text)
    if not is_right_commented(text, comment.right) then
        return text .. comment.right
    end
    return string.sub(text, 1, #text - #comment.right)
end

function M.comment()
    if comment then
        local line_number = vim.fn.line(".")
        local line_text = get_line(line_number)

        if comment.single then
            set_line(line_number, get_final_single_line(line_text))
        else
            if not is_left_commented(line_text, comment.left) then
                line_text = comment.left .. line_text .. comment.right
            else
                line_text = string.sub(line_text, #comment.left + 1, #line_text - #comment.right)
            end
            set_line(line_number, line_text)
        end
    end
end

function M.multi_comment()
    if comment then
        vim.cmd("normal gv")
        local start_line = vim.fn.line("v")
        local end_line = vim.fn.line(".")
        if comment.left then
            local left_text = get_final_left_line(get_line(start_line))
            set_line(start_line, left_text)

            local right_text = get_final_right_line(get_line(end_line))
            set_line(end_line, right_text)
        else
            for i = start_line, end_line do
               local text = get_final_single_line(get_line(i))
               set_line(i, text)
            end
        end
        vim.cmd("normal " .. esc_code)
    end
end

return M
