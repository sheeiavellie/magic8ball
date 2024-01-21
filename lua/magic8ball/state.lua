--@class Magic8BallState
--
local Magic8BallState = {}
Magic8BallState.__index = Magic8BallState

function Magic8BallState.new()
    return setmetatable({
    }, Magic8BallState)
end

function Magic8BallState:handle_key(key)
end

return Magic8BallState
