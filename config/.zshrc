# Tools to be installed
#
# eza
# rg
# fzf
# git
# fzf-tab
# fd

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf-tab)


source $ZSH/oh-my-zsh.sh


export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
alias vim="nvim"

alias chrome="open -a 'Google Chrome'"
alias fd='fd --no-ignore'
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export CLICOLOR=1
alias g="git"
alias gs="git status"

source $ZSH/oh-my-zsh.sh
alias ll="eza -l --no-user --group-directories-first --no-permissions" # Had to put this here as something else was overloading it
alias rg='rg -i --hidden --glob "!.git/**"'
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/Applications/Sublime Text.app/Contents/SharedSupport/bin"

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
HISTIGNORE="exit:clear"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Set VI mode
bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

function helpme() {
  echo ""
  echo "Liam's Help Menu"
  echo "------------------------"
  echo "1. rg - to search files (set to case insensitive, ignoring .git)"
  echo "2. ll - alias for eza"
  echo "3. fzf - fuzzy search. Type it, press enter and search. Used by ctrl-r too."
  echo "4. fzf-tab - for fuzzy search completion. Just use tab."
  echo "5. VI mode enabled. Esc w to move forward, b to move back a word"
  echo "6. Ctrl+e to edit current command. :wq to exit. Ctrl+y with v visual select to copy to mac cb"
  echo "7. Ctrl+o to open lf. l to open file. q to quit."
  echo "------------------------"
}

. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
