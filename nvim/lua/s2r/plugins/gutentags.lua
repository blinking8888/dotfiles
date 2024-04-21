return {
	'ludovicchabant/vim-gutentags',
	config = function()
		vim.g.gutentags_cache_dir = vim.fn.stdpath('cache') .. '/tags'
		vim.g.gutentags_ctags_executable = 'ctags-universal'
		vim.g.gutentags_ctags_exclude = {
			'.git',
			'.hg',
			'.svn',
			'.stack-work',
			'build',
			'node_modules',
			'bower_components',
			'__pycache__',
			'.cache',
			'.vscode',
			'.idea',
			'.vs',
			'.github',
			'.gitlab',
			'.gitignore',
			'.gitkeep',
			'.DS_Store',
			'.env',
			'target',
			'Cargo.lock',
			'.clangd'
		}
	end,
}
