# NORMAL MODE (Esc)
## registers
registers store text for future use.  
registers can be of three kinds:
1. the "user" registers (a-Z), the user set them
1. the "time" registers ("0-9), give access to the last 10 yank/delete
1. the "special" registers (+\*%#/:.-=), the copy(+) and the selected text(\*) of the system
`:registers` to see the list of registers  
`"<register>y` save the yank in the register  

registers can also be filled with macros
`q<register><sequence of actions>q` to record a macro  
`@<register>` to start the macro  
macros can be modified and saved through copy/paste, being simply text commands

## marks
marks save the current position  
marks can be of __X__ kinds:
1. the user local marks (a-z), set by the user and local to the file/buffer
1. the user global marks (A-Z), set by the user and shared between files/buffers, open the file if closed

`m<mark>` to set a mark
`'<mark` to go back to the start of the marked lnie
`<backquote><mark>` to go back to the exact position saved

## miscellaneous
`q:` to enter the command-line window

# INSERT MODE (i/a/..., R)
> `:help ins-special-keys`
`<C-w>` to remove a word  
`<C-h>` to remove a character  
`<C-u>` to delete all characters on the line (similar to `d0`)
`<C-k>` to enter digraph (see digraphs)
`<C-n>` to find next keyword
`<C-p>` to find previous keyword

`<C-j>` or `<C-M>` to enter a new line  
`<C-i>` to insert a tab

`<C-a>` to insert the last inserted/yanked test
`<C-r><register>` to insert the content of a register

`<C-o>` to issue a single command in normal mode


# COMMAND MODE (:)
> :h ex-edit-index
> same commands as in insert mode
`<C-f>` to enter command-line window
`<C-b>` to place cursor at the beginning of the line
`<C-e>` to place cursor at the end of the line
