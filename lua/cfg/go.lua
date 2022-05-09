require("go").setup(
	{
		gofmt = "gopls",
		goimport = "gopls",
	}
)
-- vim.cmd([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]])
