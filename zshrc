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

alias lock="customi3lock.sh"

#Firefox addon sdk enabling alias.
alias addon-sdk="cd /opt/addon-sdk && source bin/activate; cd -"

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.(o|out|pdf|jpg|so|png|class|toc|log|)'
zstyle ':completion:*' list-colors "di=34;1:ln=33;1:so=35;1:pi=33;1:ex=32;1:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
zstyle ':completion:*' menu select
export EDITOR=vim
export BROWSER=firefox

PATH=~/other/:~/other/locking:$PATH

# Add ruby gems to path
PATH=~/.gem/ruby/2.2.0/bin:$PATH

PROMPT='
  %n at %~
%(?..[%?])> '

# To make dirstack work
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20
# end of dirstack

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus
# autojump
source /usr/share/autojump/autojump.zsh

# The following lines were added by compinstall

#zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
#zstyle ':completion:*' expand suffix
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|=**' 'r:|[._-]=** r:|=** l:|=*' 'r:|[._-]=** r:|=** l:|=*' 'r:|[._-]=** r:|=** l:|=*'
#zstyle ':completion:*' max-errors 5 numeric
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
#zstyle ':completion:*' substitute 1
#zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/kaan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Syntax highlighting from AUR
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Complete with any word from visible part of the terminal
_crazy_last_words() {
    local expl
    local -a screencontents

    if [[ $OSTYPE == cygwin || $OSTYPE == linux* ]]; then
        printf "\033]777;terminal-contents;\007"
    fi

    screencontents=($(terminalcontents))

    # Split on quote, split on pipe symbol, split on whitespace, remove trailing '='
    screencontents=( ${${=${(s'|')${(s'"')screencontents}}}%=} )

    if [[ -z $words[CURRENT] ]]; then
        # With no filter we only want to match url:s
        screencontents=(${(M)screencontents:#(http|https|file)://[^ \"\']##})
        if (( $CURRENT == 1 )); then
            # If on start of line copy most recent match to clipboard
            (( ${#screencontents} > 0 )) && echo "$screencontents[-1]"
            return
        fi
    fi

    # Reverse the list. We want most recent matches to be offered first.
    screencontents=( ${(Oa)screencontents} )

    _wanted values expl 'words from the terminal' compadd -aQ screencontents
}

zle -C crazy-last-words menu-complete _generic
bindkey '^X^X' crazy-last-words

zstyle ':completion:crazy-last-words:*' completer _crazy_last_words
zstyle ':completion:crazy-last-words:*' ignore-line current
zstyle ':completion:crazy-last-words:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'
zstyle ':completion:crazy-last-words:*' sort false

# ... => ../..
rationalize-dot(){
 if [[ $LBUFFER = *.. ]]; then
  LBUFFER+=/..
 else
  LBUFFER+=.
 fi
}
zle -N rationalize-dot
bindkey . rationalize-dot

# Empy command means ls
auto-ls () {
    if [[ "$#BUFFER" -eq 0 ]]; then
        echo ""
        ls
        zle redisplay
    else
        zle .$WIDGET
    fi
}
#zle -N accept-line auto-ls
#zle -N other-widget auto-ls

# Enables editing of command in editor (similar to bash vi-mode)
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
source /usr/share/nvm/init-nvm.sh
