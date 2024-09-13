local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("comment not found!")
  return
end

comment.setup {
}
