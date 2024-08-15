local equal = assert.are.same

local Utils = require("magic8ball.tests.utils")
local Float = require("magic8ball.ui.float")

describe("magic8ball", function()
    before_each(function()
        Utils.clear_memory()
        Float = require("magic8ball.ui.float")
    end)

    it("make sure that toggle when called by float:toggle()", function()
        equal(Float.buf_id, nil)
        equal(Float.win_id, nil)

        Float:toggle()

        local buf_id = Float.buf_id
        local win_id = Float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        Float:toggle()

        equal(Float.buf_id, nil)
        equal(Float.win_id, nil)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
    it("make sure that toggle when buffer is unloaded", function()
        equal(Float.buf_id, nil)
        equal(Float.win_id, nil)

        Float:toggle()

        local buf_id = Float.buf_id
        local win_id = Float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        vim.api.nvim_buf_delete(buf_id, { force = true })

        equal(nil, Float.buf_id)
        equal(nil, Float.win_id)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
    it("make sure that toggle when window is close using :quit", function()
        equal(Float.buf_id, nil)
        equal(Float.win_id, nil)

        Float:toggle()

        local buf_id = Float.buf_id
        local win_id = Float.win_id
        equal(true, vim.api.nvim_buf_is_valid(buf_id))
        equal(true, vim.api.nvim_win_is_valid(win_id))

        vim.api.nvim_win_close(win_id, true)

        equal(nil, Float.buf_id)
        equal(nil, Float.win_id)
        equal(false, vim.api.nvim_buf_is_valid(buf_id))
        equal(false, vim.api.nvim_win_is_valid(win_id))
    end)
end)
