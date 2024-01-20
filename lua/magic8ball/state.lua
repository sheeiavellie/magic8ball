--@class Magic8BallState
--
local Magic8BallState = {}
Magic8BallState.__index = Magic8BallState

function Magic8BallState.new()
    return setmetatable({
    }, Magic8BallState)
end

return Magic8BallState
