local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("User", {
		pattern = "TSUpdate",
		callback = function()
			require("nvim-treesitter.parsers").rapresence = {
				install_info = {
					url = "https://github.com/KiliLoje/tree-sitter-rapresence",
					branch = 'master',
					generate = true,
				},
				filetype = "rapresence",
			}
		end,
	})

	vim.filetype.add({
		extension = {
			txt = function(path, bufnr)
				local filename = vim.fn.fnamemodify(path, ":t")

				if filename:match("^%d+%-Rich%.txt$") then
					return "rapresence"
				end

				local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]
				if first_line and first_line:match("#RP") then
					return "rapresence"
				end

				return nil
			end,
		},
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rapresence",
		callback = function()
			vim.opt_local.wrap = true
			vim.opt_local.linebreak = true
			vim.opt_local.breakindent = true
		end,
	})
end

return M
