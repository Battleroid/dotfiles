if exists("b:current_syntax")
	finish
else
	let b:current_syntax = "cnf"
endif

syn region sectionTitle start="\[" end="\]"
highlight link sectionTitle Identifier