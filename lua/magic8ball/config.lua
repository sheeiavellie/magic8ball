local M = {}

---@class Magic8BallSettings
---@field use_cursor_position_for_random boolean

---@class AnswersConfig
---@field answers_list string[]
---@field answers_file_path string

---@class UIConfig
---@field float FloatConfig

---@class Magic8BallConfig
---@field settings Magic8BallSettings
---@field answers AnswersConfig

---@return Magic8BallConfig config
function M.get_default_config()
    return {
        settings = {
            use_cursor_position_for_random = true,
        },
        answers = {
            answers_list = {
                --positive
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
                --neutral
                "Reply hazy, try again",
                "Ask again later",
                "Better not tell you now",
                "Cannot predict now",
                "Concentrate and ask again",
                --negative
                "Don't count on it",
                "My reply is no",
                "My sources say no",
                "Outlook not so good",
                "Very doubtful",
            },
            answers_file_path = "",
        },
    }
end

return M
