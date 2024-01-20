require('vis')

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	--per-window configuration--
	vis:command('set relativenumber')
	vis:command('set autoindent on')
	vis:command('set cursorline on')
	vis:command('set tabwidth 2')
	vis:command('set syntax on')
	--vis:command('set show-spaces on')--
	vis:command('set colorcolumn 100')
end)
