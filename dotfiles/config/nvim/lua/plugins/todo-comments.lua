return {
  "folke/todo-comments.nvim",
  event = "LazyFile",
  dependencies = "nvim-telescope/telescope.nvim",
		-- stylua: ignore
		keys = {
			{ ']t', function() require('todo-comments').jump_next() end, desc = 'Next todo comment' },
			{ '[t', function() require('todo-comments').jump_prev() end, desc = 'Previous todo comment' },
			{ '<LocalLeader>dt', '<cmd>TodoTelescope<CR>', desc = 'todo' },
			{ '<leader>xt', '<cmd>TodoTrouble<CR>', desc = 'Todo (Trouble)' },
			{ '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
			{ '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
			{ '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
		},
  opts = { signs = false },
}
