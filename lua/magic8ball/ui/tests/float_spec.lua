local equal = assert.are.same

local utils = require("magic8ball.tests.utils")
local float = require("magic8ball.ui.magic8ball-float")

describe("magic8ball", function()
    before_each(function()
        utils.clear_memory()
        float = require("magic8ball.ui.magic8ball-float")
    end)

    it("make sure that toggle works with float", function()
        equal(float.buf_id, nil)
        equal(float.win_id, nil)

        float:toggle()

        local buf_id = float.buf_id
        local win_id = float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        float:toggle()

        equal(float.buf_id, nil)
        equal(float.win_id, nil)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
end)
