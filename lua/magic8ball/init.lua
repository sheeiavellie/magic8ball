local utils = require("magic8ball.utils")

--@class Magic8Ball
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

--@return Magic8Ball
function Magic8Ball.new()
    local self = setmetatable({}, Magic8Ball)
    return self
end

--@param self Magic8Ball
function Magic8Ball:setup()

end

return Magic8Ball.new()
