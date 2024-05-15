
local status_ok, outline = pcall(require, "outline")
if not status_ok then
  vim.notify("outline not found")
	return
end

outline.setup({ })
