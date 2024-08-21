local M = {}

---@class Magic8BallSettings
---@field use_cursor_position_for_random boolean

---@class Magic8BallConfig
---@field settings Magic8BallSettings
---@field answers {[number]: string[]}

---@return Magic8BallConfig
function M.get_default_config()
    return {
        settings = {
            use_cursor_position_for_random = true,
        },
        answers = {
            [1] = {
                "It is certain",
                "It is decidedly so",
                "Without a doubt",
                "Yes definitely",
                "You may rely on it",
                "As I see it, yes",
                "Most likely",
                "Outlook good",
                "Yes",
                "Signs point to yes",
            },
            [0] = {
                "Reply hazy, try again",
                "Ask again later",
                "Better not tell you now",
                "Cannot predict now",
                "Concentrate and ask again",
            },
            [-1] = {
                "Don't count on it",
                "My reply is no",
                "My sources say no",
                "Outlook not so good",
                "Very doubtful",
            },
        },
    }
end

return M
