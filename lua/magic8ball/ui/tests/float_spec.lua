local equal = assert.are.same

local utils = require("magic8ball.tests.utils")
local float = require("magic8ball.ui.float")

describe("magic8ball", function()
    before_each(function()
        utils.clear_memory()
        float = require("magic8ball.ui.float")
    end)

    it("make sure that toggle when called by float:toggle()", function()
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
    it("make sure that toggle when buffer is unloaded", function()
        equal(float.buf_id, nil)
        equal(float.win_id, nil)

        float:toggle()

        local buf_id = float.buf_id
        local win_id = float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        vim.api.nvim_buf_delete(buf_id, { force = true })

        equal(nil, float.buf_id)
        equal(nil, float.win_id)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
    it("make sure that toggle when window is close using :quit", function()
        equal(float.buf_id, nil)
        equal(float.win_id, nil)

        float:toggle()

        local buf_id = float.buf_id
        local win_id = float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        vim.api.nvim_win_close(win_id, true)

        equal(nil, float.buf_id)
        equal(nil, float.win_id)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
end)
