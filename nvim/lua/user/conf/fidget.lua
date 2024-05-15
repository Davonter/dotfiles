local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  vim.notify("comment not found!")
  return
end


fidget.setup{ }
