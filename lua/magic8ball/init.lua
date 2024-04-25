local utils = require("magic8ball.utils")
local float = require("magic8ball.ui.float")
local State = require("magic8ball.state")


--@class Magic8Ball
--@field state Magic8BallState
--@field float Magic8ballFloat
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

--@return Magic8Ball
function Magic8Ball.new()
    local state = State.new()
    local self = setmetatable({
        state = state,
        float = float.new(state),
    }, Magic8Ball)
    return self
end

--@param self Magic8Ball
function Magic8Ball:setup()
    vim.api.nvim_create_autocmd('WinResized', {
        group = utils.magic8ball_group_id,
        callback = function()
            self.float:resize()
        end
    })
    --@param key string
    vim.on_key(function(key)
        self.state:handle_key(key)
    end)
end

return Magic8Ball.new()
