local M = {}

M.magic8ball_group_id = vim.api.nvim_create_augroup("Magic8Ball", {})

function M.on_close(buf_id, cb)
    vim.api.nvim_create_autocmd({ 'WinClosed', 'BufUnload' }, {
        group = M.magic8ball_group_id,
        buffer = buf_id,
        callback = function()
            cb()
        end
    })
end

return M
