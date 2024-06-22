hook global WinSetOption filetype=hare %{
	# Here you can change the keybind mapping
    map global normal <s-d> "<a-i>c(^|[^\w:]),[^\w:]<ret>:haredoc-get<ret>"	
    define-command haredoc-get -docstring "Call haredoc with current selection" %{
    	evaluate-commands %sh{
    		line=$kak_cursor_line
    		char=$kak_cursor_char_column
    		selected=$kak_selection
    		# We do NO_COLOR since kakoune info boxes dont support ANSI color codes
    		haredoc_info=$(export NO_COLOR="N"; haredoc $selected)
    		# Change info box style in -style
    		printf "info -title '$selected' -style below -anchor $line.$char '$haredoc_info'"
    	}
    }
}

