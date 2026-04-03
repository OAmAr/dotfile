# ~/.zshrc — base config (portable, all machines)

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Editor
export EDITOR=vim

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
alias gs='git status'
alias gp='git pull'
alias gc='git commit'
alias gco='git checkout'
alias glog='git log --oneline --graph --decorate'

# Machine-local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
