local appearance = require('config-lspinstall/handlers/appearance')
local diagnostics = require('config-lspinstall/appearance/diagnostics')
local actions = require('config-lspinstall/handlers/actions')

local M = {}

function M.on_attach()
    diagnostics.setup()
    appearance.on_attach()
    actions.on_attach()
end

return M
