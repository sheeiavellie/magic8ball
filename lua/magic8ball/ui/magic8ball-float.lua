local utils = require("magic8ball.utils")

--@class Magic8ballFloat
--@field m8b_state Magic8ballState
--@field buf_id number
--@field win_id number
--@field closing boolean
local Magic8ballFloat = {}
Magic8ballFloat.__index = Magic8ballFloat

local function close_window(buf_id, win_id)
    if win_id ~= nil and vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
    end

    if buf_id ~= nil and vim.api.nvim_buf_is_valid(buf_id) then
        vim.api.nvim_buf_delete(buf_id, { force = true })
    end
end

local function create_window_config()
    local width = 34
    local height = 5
    --local ui = vim.api.nvim_list_uis()[1]
    return {
        relative = 'editor',
        row = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        width = width,
        height = height,
        border = 'rounded',
        title = 'Magic8Ball🔮',
        title_pos = 'center',
        style = 'minimal',
    }
end

local function create_window()
    local buf_id = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(buf_id, 4, 4, false, {
        "AMOGUS Press ENTER to get the answer...",
    })
    local config = create_window_config()
    local win_id = vim.api.nvim_open_win(buf_id, true, config)
    return buf_id, win_id
end

function Magic8ballFloat.new(m8b_state)
    local self = setmetatable({
        m8b_state = m8b_state,
        buf_id = nil,
        win_id = nil,
        closing = false,
    }, Magic8ballFloat)
    return self
end

function Magic8ballFloat:resize()
    if self.win_id == nil then
        return
    end
    local config = create_window_config()
    vim.api.nvim_win_set_config(self.win_id, config)
end

function Magic8ballFloat:toggle()
    if self.buf_id == nil then
        local buf_id, win_id = create_window()
        self.buf_id = buf_id
        self.win_id = win_id

        utils.on_close(buf_id, function()
            if self.closing then
                return
            end

            close_window(nil, self.win_id)
            self.buf_id = nil
            self.win_id = nil
        end)
    else
        self.closing = true
        close_window(self.buf_id, self.win_id)
        self.buf_id = nil
        self.win_id = nil
        self.closing = false
    end
end

return Magic8ballFloat
