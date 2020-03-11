export PATH=$HOME/bin:$HOME/.local/bin:$HOME/.node/bin:/usr/local/bin:$PATH
alias vconf='vim /home/eduardo/.vimrc'
alias zconf='vim /home/eduardo/.zshrc'
alias zs="source /home/eduardo/.zshrc"
alias i3conf='vim /home/eduardo/.config/i3/config'
alias fvim='vim $(fzf)'
alias emacs='XLIB_SKIP_ARGB_VISUALS=1 emacs'
alias ddoc='/home/eduardo/.emacs.d/bin/doom doctor'
alias dsync='/home/eduardo/.emacs.d/bin/doom sync'
alias dref='/home/eduardo/.emacs.d/bin/doom refresh'
alias dupgrade='/home/eduardo/.emacs.d/bin/doom upgrade'

if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi
