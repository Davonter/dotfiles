local status_ok, clangd_extensions = pcall(require, "clangd_extensions")
if not status_ok then
    vim.notify("clangd_extensions not found!")
    return
end

clangd_extensions.setup {
    inlay_hints = {
        inline = true,
    },
    ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
        },
        kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
        },
    },
}
