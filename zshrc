source $HOME/.bashrc
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kalleand"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source /etc/profile.d/autojump.zsh

# Customizing the path
export PATH="$HOME/other/git-hooks:$HOME/other/android-studio/bin:/home/kaan/other/android-ndk-r9c:$HOME/.rbenv/bin:$HOME/.gem/ruby/2.0.0/bin:$PATH"

# Vim commands in terminal
bindkey -v
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

alias gst='git status'
alias gc='git commit'
alias ga='git add'
alias ..='cd ..'
alias ...='cd ../..'

alias j="j 1>/dev/null"
alias o="mimeopen "
alias h="history|grep "
alias f="find . |grep "
alias p="ps aux |grep "
#alias ranger=/home/kaan/other/ranger/ranger.py --clean
#alias vimr="vim --remote-silent "

#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.(o|out|pdf|jpg|so|png|class|toc|log|)'
zstyle ':completion:*' list-colors "di=34;1:ln=33;1:so=35;1:pi=33;1:ex=32;1:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

export EDITOR=vim
export BROWSER=firefox

# Ruby shims and autocompletion
eval "$(rbenv init -)"

# Autocompletion
autoload -U compinit; compinit

#if [[ ! -n $TMUX && ! -o login ]] then ((tmux ls | grep -vq attached && tmux at) || tmux) && exit; fi
