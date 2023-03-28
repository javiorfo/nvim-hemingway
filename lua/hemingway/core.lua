-- ##########################################################
-- # Maintainer: Javier Orfo                                #
-- # URL:        https://github.com/javiorfo/nvim-hemingway #
-- ##########################################################

local comments = require'hemingway'.comments

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
    if not is_left_commented(text, comments[vim.bo.filetype].single) then
        return comments[vim.bo.filetype].single .. text
    end
    return string.sub(text, #comments[vim.bo.filetype].single + 1)
end

local function get_final_left_line(text)
    if not is_left_commented(text, comments[vim.bo.filetype].left) then
        return comments[vim.bo.filetype].left .. text
    end
    return string.sub(text, #comments[vim.bo.filetype].left + 1)
end

local function get_final_right_line(text)
    if not is_right_commented(text, comments[vim.bo.filetype].right) then
        return text .. comments[vim.bo.filetype].right
    end
    return string.sub(text, 1, #text - #comments[vim.bo.filetype].right)
end

function M.comment()
    if comments[vim.bo.filetype] then
        local line_number = vim.fn.line(".")
        local line_text = get_line(line_number)

        if comments[vim.bo.filetype].single then
            set_line(line_number, get_final_single_line(line_text))
        else
            if not is_left_commented(line_text, comments[vim.bo.filetype].left) then
                line_text = comments[vim.bo.filetype].left .. line_text .. comments[vim.bo.filetype].right
            else
                line_text = string.sub(line_text, #comments[vim.bo.filetype].left + 1, #line_text - #comments[vim.bo.filetype].right)
            end
            set_line(line_number, line_text)
        end
    end
end

function M.multi_comment()
    if comments[vim.bo.filetype] then
        local start_line = vim.fn.line("v")
        local end_line = vim.fn.line(".")

        if start_line > end_line then
            local aux = start_line
            start_line = end_line
            end_line = aux
        end

        if comments[vim.bo.filetype].left then
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
