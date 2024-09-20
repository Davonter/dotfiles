
local status_ok, dracula = pcall(require, "dracula")
if not status_ok then
  vim.notify("dracula not found!")
  return
end

dracula.setup({
    transparent_bg = true
})
