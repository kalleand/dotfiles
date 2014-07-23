HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
bindkey -v

alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

alias gst='git status'
alias gc='git commit'
alias ga='git add'

alias o="xdg-open "
alias h="history|grep "
alias f="find . |grep "
alias p="ps aux |grep "

#Firefox addon sdk enabling alias.
alias addon-sdk="cd /opt/addon-sdk && source bin/activate; cd -"

#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.(o|out|pdf|jpg|so|png|class|toc|log|)'
zstyle ':completion:*' list-colors "di=34;1:ln=33;1:so=35;1:pi=33;1:ex=32;1:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
zstyle ':completion:*' menu select
export EDITOR=vim
export BROWSER=firefox

PROMPT='
  %n at %~
%(?..[%?])> '

# autojump
source /etc/profile.d/autojump.zsh

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand suffix
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'r:|[._-]=** r:|=** l:|=*' 'r:|[._-]=** r:|=** l:|=*' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' max-errors 5 numeric
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/kaan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
