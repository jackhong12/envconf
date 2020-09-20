# TODO: Need to modify this line.
export ZSH="~/.oh-my-zsh"

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

# TODO: Need to modify this line.
source $ZSH/oh-my-zsh.sh

source ~/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply


HIST_STAMPS="yyyy-mm-dd"

# autojump
[[ -s /home/jack/.autojump/etc/profile.d/autojump.sh ]] && source /home/jack/.autojump/etc/profile.d/autojump.sh

bindkey ',' autosuggest-accept

