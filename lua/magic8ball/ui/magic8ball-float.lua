--@class Magic8ballFloat
--@field m8b_state Magic8ballState
--@field buf_id number
--@field win_id number
local Magic8ballFloat = {}
Magic8ballFloat.__index = Magic8ballFloat

local function close_window(buf_id, win_id)
    if vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
    end

    if vim.api.nvim_buf_is_valid(buf_id) then
        vim.api.nvim_buf_delete(buf_id, { force = true })
    end
end

local function create_window()
    local buf_id = vim.api.nvim_create_buf(false, true)
    local ui = vim.api.nvim_list_uis()[1]
    local row = 10
    local col = 10
    local win_id = vim.api.nvim_open_win(buf_id, true, {
        relative = 'win',
        row = row,
        col = col,
        width = 24,
        height = 5,
        border = 'rounded',
        title = 'Magic 8 Ball',
        title_pos = 'center',
        style = 'minimal',
    })

    return buf_id, win_id
end

function Magic8ballFloat.new(m8b_state)
    local self = setmetatable({
        m8b_state = m8b_state,
        buf_id = nil,
        win_id = nil,
    }, Magic8ballFloat)
    return self
end

function Magic8ballFloat:show()
    if self.buf_id ~= nil then
        return
    end

    local buf_id, win_id = create_window()
    self.buf_id = buf_id
    self.win_id = win_id
end

function Magic8ballFloat:hide()
    if self.buf_id == nil then
        return
    end

    close_window(self.buf_id, self.win_id)
    self.buf_id = nil
    self.win_id = nil
end

float = Magic8ballFloat:new()
return float
