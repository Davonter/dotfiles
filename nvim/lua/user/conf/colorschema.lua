
local dracula_ok, dracula = pcall(require, "dracula")
if dracula_ok then
    dracula.setup({
        transparent_bg = true
    })
end

local nightfox_ok, nightfox = pcall(require, "nightfox")
if nightfox_ok then
    nightfox.setup({
        -- options = {
            -- transparent = true
        -- }
    })
end
