# this line is needed changing
export ZSH="~/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source ~/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

plugins=(
    git
    autojump
    vi-mode
    history
    colored-man-pages
    colorize
    web-search
    dirhistory
    extract
)

HIST_STAMPS="yyyy-mm-dd"

# autojump
[[ -s /home/jack/.autojump/etc/profile.d/autojump.sh ]] && source /home/jack/.autojump/etc/profile.d/autojump.sh

bindkey ',' autosuggest-accept

source $ZSH/oh-my-zsh.sh
