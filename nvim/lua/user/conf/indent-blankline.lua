
local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
    return
end

ibl.setup({
   whitespace = { highlight = { "Whitespace", "NonText" }}
})
