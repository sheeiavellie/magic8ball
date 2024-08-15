local Utils = require("magic8ball.utils")
local Float = require("magic8ball.ui.float")

---@class Magic8Ball
---@field float Magic8ballFloat
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

---@return Magic8Ball
function Magic8Ball:new()
    local magic8ball = setmetatable({
        float = Float:new(),
    }, self)
    return magic8ball
end

local magic8ball = Magic8Ball:new()

function Magic8Ball:setup()
    vim.api.nvim_create_autocmd('WinResized', {
        group = Utils.magic8ball_group_id,
        callback = function()
            self.float:resize()
        end
    })
end

return magic8ball
