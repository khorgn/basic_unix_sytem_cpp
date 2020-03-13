# HELP
> :h  
> :h ref  
> :h mapleader

:h index, `:h normal-index` `:h insert-index` `:h visual-index`  
:h map-modes  
:h map-which-keys  

`:tags` to see the tags stack of jumps
`CTRL-]` in qwerty to jump to tag, `CTRL-$` in AZERTY
`CTRL-T` to go back to the previous entry in the tag stack

`:jumps` to see the jump list
`CTRL-O` to go to the previous entry in the jump list
`CTRL-I` to go to the next entry in the jump list


# NORMAL MODE (Esc)
## registers
> :h registers
> :h recording

registers store text for future use.  
There are ten types of registers:
1. the unnamed register ("), the last yank/delete
2. the numbered registers (0-9)
  1. give access to the last 9 yank/delete (1-9)
  2. give access to the last yank (0)
3. The small delete register "-
4. the user registers (a-z), the user set them
  1. the user registers appended (A-Z), appends the content to the one already existing
5. three read-only registers (:.%), the last command (:), the last interted text (.), the current file (%)
6. alternate buffer register (#)
7. the expression register (=)
8. The selection and drop registers (\*), (+) and (~), the copy (+), the mouse highlight (\*) of the system
9. The black hole register (\_)
10. Last search pattern register (/)

`:registers` to see the list of registers  
`"<register>y` save the yank in the register  
`"<register>d` delete and store it in the register  
`"<register>p` paste the content of the register  
`:let @<REGISTER>='i;'` append the action to the end of the macro
`:let @<register>='<C-r w>` correct the macro, add ' to the end to close the macro text

registers can also be filled with macros
`q<register><sequence of actions>q` to record a macro  
`@<register>` to start the macro  
macros can be modified and saved through copy/paste, being simply text commands

## marks
marks save the current position  
marks can be of 4 kinds:
1. the user local marks (a-z), set by the user and local to the file/buffer  
2. the user global marks (A-Z), set by the user and shared between files/buffers, open the file if closed  
3. the numbered marks (0-9), the location of the cursor when vim was closed (0), one before (1), ...  
4. the yank/change marks ([]), the first([)/last(]) character of the last yanked or changed test  
5. the visual area marks (<>), the first(<)/last(>) line or character of the last selected visual area  
6. the jump marks ('\`), the latest line (')/ character (\`) jump  
7. the buffer mark ("), the cursor position the last time the buffer was opened  
8. the inster mark (^), the position of the cursor for the end of the last insert mode, same as __gi__  

`m<mark>` to set a mark  
`'<mark` to go back to the start of the marked line  
`<backquote><mark>` to go back to the exact position saved  

## folds
folds allows to make the code more readable
see the manual: `:help usr_28.txt` for how to use it

## miscellaneous
`q:` to enter the command-line window  
`*` next occurence of the word under the cursor  
`#` previous occurence of the word under the cursor  

`=` fix indentation, `==` fix current line, `gg=G` fix all file

`gi` jump to last insert mode end  
`g;` and `g,` jump back/forward to last changes  
 jump forward to last changes  
`(` and `)` jump to the start/end of the current sentence  
`{` and `}` jump to the start/end of the current paragraph  
`<C-o>` and `<C-i` jump to older/newer cursor position in jump list  
`:jumps` print the jump list  

`:map` user-defined mapping of keys  
`:imap` user-defined mapping of keys or insert mode  

`:noh[ighlightsearch]` clear the search highlight  

`zo` open folded lines  
`zc` close folded lines  

## Windows
`<C-W>_` max size buffer vertically  
`<C-W>|` max size buffer horizontally  
`<C-W>=` equal size buffers  
`<C-W>+` increase size buffer  
`:sview file` split file in readonly  
`:hide` close current window  
`:only` only keep the current window open  

## Tabs
`:tab split` split the current buffer to a new tab (can be shortcuted tt)  
`:tab c` close tab  

## Diff
_Local_ your current branch, the one merged into  
_Base_ The common ancestor  
_Remote_ The branch you merge into, usually origin/branch  
_Merged_ The merge result  

`]c` and `[c` bring the cursor to the differences  
when the cursor in _merged_ is on a difference, to choose the right change, or non if it's a mix:  
`:diffg(et) RE(MOTE)`  
`:diffg(et) BA(SE)`  
`:diffg(et) LO(CAL)`  
`:diffu(pdate)` update the differences, to change what is seen as a difference

`do` diff optain  
`dp` diff put  

> A good pluggin to check is __ConflictMotions__  

# INSERT MODE (i/a/..., R)
> `:h insert.txt`
> `:help ins-special-keys`

`<C-w>` to remove a word  
`<C-h>` to remove a character  
`<C-u>` to delete all characters on the line (similar to `d0`)
`<C-k>` to enter digraph (see digraphs)
`<C-n>` to find next keyword
`<C-p>` to find previous keyword

`<C-j>` or `<C-M>` to enter a new line  
`<C-i>` to insert a tab
`<C-t>` and `<C-d>` to insert/delete one shiftwidth of intend at the start of the line  
`0 <C-d>`to remove all inserts at the start of the line  
`<C-a>` to insert the last inserted/yanked test  

`<C-r><register>` to insert the content of a register  
`<C-r>=<expression>` to insert the result of an expression  
* `<C-r>=4*3` gives 12
* `<C-r>=system('ls')` gives the result of ls

`<C-o>` to issue a single command in normal mode

# COMMAND MODE (":", "/", "?", "!")
> `:h cmdline.txt`
> `:h ex-edit-index`
> same commands as in insert mode
`<C-f>` to enter command-line window, `<C-c>` to exit
`<C-b>` to place cursor at the beginning of the line
`<C-e>` to place cursor at the end of the line
`<C-D>` to see the list of possible completions

`:set <option>` set the option on (ex: `:set number`)
`:set no<option>` set the option off (ex: `:set nonumber`)
`:set <option>!` toggle the option on/off (ex: `:set number!`)
`:set <option>?` checks the option value (ex: `:set number?`)
`:set all` lists all settings set
`:help option-list` lists all options and with a short explanation (`help option-summary` for long explanation)
`:verbose set <option>` to check where the option was last set
> NOTE: :set only works on settings that are options, variables like `b:current_syntax` (the current syntax of the buffer) can't be accessed or checked with set

## Variables
special variables: `$<environment variable>`, `&<option variables>`, `@<register variables>`


`:echo <variable>` displays a variable value (ex: `echo b:current_syntax` or `echo &number`), variables can have different scope (g[lobal], w[indow], b[uffer], l[ocal], s[cript]) and options can be accessed as variable with &
`:let <variable>=<value>` sets a value to a variable (ex: `&number = 1`)

# Digraphs
> `:h digraphs`
> `:h digraphs-default`
`<C-k>` to start a digraph

# Unicode
> `:h i_CTRL-V`
> `:h i_CTRL-V_digit`
> {nnn} is a number with 3 characters
`ga` gives the unicode representation of the character under the cursor
`<C-v>{nnn}` enter the unicode representation of the decimal number
`<C-v>o{nnn}` enter the unicode representation of the octal number
`<C-v>x{nnn}` enter the unicode representation of the hexadecimal number

