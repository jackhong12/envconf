
## Install tmux
```
sudo apt-get install tmux
```

## [.tmux](https://github.com/gpakosz/.tmux) Configuration
```
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local ~/
```

### In `.tmux.conf.local`
- mouse mode
```
set -g mouse on
```

- powerline fonts
```
# status left/right sections separators
tmux_conf_theme_left_separator_main='\uE0B0'  # /!\ you don't need to install Powerline
tmux_conf_theme_left_separator_sub='\uE0B1'   #   you only need fonts patched with
tmux_conf_theme_right_separator_main='\uE0B2' #   Powerline symbols or the standalone
tmux_conf_theme_right_separator_sub='\uE0B3'  #   PowerlineSymbols.otf font, see README.md
```
