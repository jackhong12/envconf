## Generate ssh key
```
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

## oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- Add below in .zshrc
```
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

#source $ZSH/oh-my-zsh.sh

source ~/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply


HIST_STAMPS="yyyy-mm-dd"

# autojump
[[ -s /home/jack/.autojump/etc/profile.d/autojump.sh ]] && source /home/jack/.autojump/etc/profile.d/autojump.sh

bindkey ',' autosuggest-accept
```

## .tmux
- Turn on mouse mode.
```
set -g mouse on
```

- Enable powerline symbols.
```
tmux_conf_theme_left_separator_main="\uE0B0"
tmux_conf_theme_left_separator_sub="\uE0B1"
tmux_conf_theme_right_separator_main="\uE0B2"
tmux_conf_theme_right_separator_sub="\uE0B3"
```

## docker
```
sudo usermod -aG docker $USER
```
