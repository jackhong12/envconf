

# antigen
source ~/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

HIST_STAMPS="yyyy-mm-dd"

bindkey ',' autosuggest-accept	# bind autocompelet
