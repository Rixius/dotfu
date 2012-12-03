function! CFolding(lnum)
	let line = getline(a:lnum)
	if match(line, '^\([a-zA-Z]\+ \)\+[a-zA-Z0-9_]\+(.*)\s\?{\?') >= 0
		return '>1'
	elseif match(line, '^}') >= 0
		return '<1'
	else
		return '='
	endif

	return '1'
endfunction


setlocal foldmethod=expr
setlocal foldexpr=CFolding(v:lnum)
setlocal foldcolumn=3
