local Magic8BallGroup = require("magic8ball.autocmd")

--@class Magic8Ball
--@field group_id number
--@field ui Magic8BallUI
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

--@return Magic8Ball
function Magic8Ball:new()
    local magic8Ball = setmetatable({}, self)
    self.group_id = Magic8BallGroup

    return magic8Ball
end

--@param self Magic8Ball
function Magic8Ball.setup(self, config)
    return self
end

local magic8Ball = Magic8Ball:new()


return magic8Ball
