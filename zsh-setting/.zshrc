# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# [[ ${!2} == \$\'* ]] && eval $2=${!2}
# source ~/.bashrc
# source ~/.fonts/*.sh 

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# show all theme $ ls ~/.oh-my-zsh/themes
#
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="robbyrussell"
# $ p10k configure
#ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/antigen.zsh

# Load the oh-my-zsh's library.
#antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

# powerlevel9k customization
# add a new line
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs time background_jobs_joined)
# turn off right prompt
POWERLEVEL9K_DISABLE_RPROMPT=false
# triangle icon
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'
# fonts
POWERLEVEL9K_MODE='awesome-fontconfig'
# vcs color
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='red1'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='blue'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
# status color
POWERLEVEL9K_STATUS_OK_FOREGROUND='green'
# vi-mode color
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='green'



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'

# plugins
# colored-man-pages: adds colors to manpages
# colorize: cat with syntax highlight support
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

source $ZSH/oh-my-zsh.sh fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# history format
HIST_STAMPS="yyyy-mm-dd"

#
#[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# <alias>
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# powerline
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then
  source $POWERLINE_SCRIPT
fi

# autojump
[[ -s /home/jack/.autojump/etc/profile.d/autojump.sh ]] && source /home/jack/.autojump/etc/profile.d/autojump.sh

# zsh-autosuggest to acommplish by using ','
bindkey ',' autosuggest-accept 

