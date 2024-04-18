local float = require("magic8ball.ui.float")

local M = {}

function M.clear_memory()
    if float.buf_id ~= nil then
        float:toggle()
    end

    require("plenary").reload.reload_module("magic8ball")
end

return M
