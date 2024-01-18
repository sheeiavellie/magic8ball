--@class Magic8Ball
--@field config Magic8BallConfig
--@field ui Magic8BallUI
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

--@return Magic8Ball
function Magic8Ball:new()
    local config = "amongus" --TODO:add config here

    local magic8Ball = setmetatable({
        config = config,
        ui = "amogus" --TODO:add ui
    }, self)

    return magic8Ball
end

local magic8Ball = Magic8Ball:new()

--@param self Magic8Ball
--@param config Magic8BallConfig
function Magic8Ball.setup(self, config)
    --TODO:do config magic here

    return self
end

return magic8Ball
