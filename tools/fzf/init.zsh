# to place as $HOME/.fzf.zsh
# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hugo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# Options
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
# use highlight, if it doesn't work (filetype not known) use cat, if it doesn't work (is a directory) is tree
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
