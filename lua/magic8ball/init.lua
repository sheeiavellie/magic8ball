local Magic8BallGroup = vim.api.nvim_create_augroup("Magic8Ball", {})

--@class Magic8Ball
--@field group_id number
--@field ui Magic8BallUI
local Magic8Ball = {}

Magic8Ball.__index = Magic8Ball

--@return Magic8Ball
function Magic8Ball.new()
    local self = setmetatable({}, Magic8Ball)
    self.group_id = Magic8BallGroup

    return self
end

--@param self Magic8Ball
function Magic8Ball.setup(self, config)
    print("AMOGUS")
end

local magic8Ball = Magic8Ball.new()

return magic8Ball
