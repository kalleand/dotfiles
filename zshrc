HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify promptsubst
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

alias vim="nvim"

alias lock="customi3lock.sh"

# Default to rich console for gradle
alias gradle="gradle --console rich"

## This circumvents xargs screwing with stdin
alias xargs-vim="xargs bash -c '</dev/tty vim "\$\@"' ignoreme"

#Firefox addon sdk enabling alias.
alias addon-sdk="cd /opt/addon-sdk && source bin/activate; cd -"

#alias basefarm-vpn="sudo openconnect -u areasson https://ssl-vpn.sth.basefarm.net/ssl"
alias basefarm-vpn="sudo openconnect -u areasson --servercert sha256:ff428dd4e5923c7d3149e893c31acc428ace4cb3ba82d6cace3dff3bf8e69db8 --no-dtls https://ssl-vpn.sth.basefarm.net/ssl"
alias buildSrs="./gradlew clean build && R_HOME=/lib/R java -Djava.library.path=\"/lib/R/library/rJava/jri\" -Dsrs.resources.folder=\"/home/kaan/r2m/inera/srs/src/main/resources\" -jar build/libs/*.war --spring.profiles.active=runtime,it,bootstrap"

zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.(o|out|pdf|jpg|so|png|class|toc|log|)'
zstyle ':completion:*' list-colors "di=34;1:ln=33;1:so=35;1:pi=33;1:ex=32;1:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
zstyle ':completion:*' menu select

export EDITOR=vim
export BROWSER=firefox
export JAVA_HOME=/usr/lib/jvm/default
export TERM='xterm-256color'

PATH=~/other/:~/other/locking:~/other/idea-IU-173.3727.127/bin:$PATH

# Add ruby gems to path
PATH=~/.gem/ruby/2.2.0/bin:$PATH

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

    printf "\033]777;terminal-contents;\007"

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

zmodload zsh/datetime

float etime_b_timestamp=$EPOCHREALTIME
float etime_e_timestamp=$EPOCHREALTIME
integer last_cmd=0
integer last_seen=0
integer display_time=0

etime_begin() {
    etime_b_timestamp=$EPOCHREALTIME
    last_cmd=$last_cmd+1
}

etime_end() {
    if (( last_cmd > last_seen )); then
        last_seen=last_cmd
        display_time=1
    else
        display_time=0
    fi
    etime_e_timestamp=$EPOCHREALTIME
}

add-zsh-hook preexec etime_begin
add-zsh-hook precmd etime_end

etime_time() {
    if (( display_time == 0 )); then
        return
    fi
    integer hours minutes
    float rtime=$(( etime_e_timestamp - etime_b_timestamp ))

    hours=$(( rtime / 3600 ))
    rtime=$(( rtime - hours * 3600 ))

    minutes=$(( rtime / 60 ))
    rtime=$(( rtime - minutes * 60 ))

    if (( hours == 0 && minutes == 0 && rtime < 0.2 )); then
        printf ""
    elif (( hours > 0 )); then
        printf "%d:%02d:%02.0f" $hours $minutes $rtime
    else
        printf "%02d:%02.1f" $minutes $rtime
    fi
}

autoload -Uz colors && colors
PROMPT="
  %n at %~
%(?..[%?])> "
RPROMPT="\$(etime_time)"

# Enables editing of command in editor (similar to bash vi-mode)
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
#source /usr/share/nvm/init-nvm.sh

# Give alias to directories
# Use: "cd ~jobb"
hash -d jobb=/home/kaan/r2m/inera/
hash -d work=/home/kaan/r2m/inera/

source ~/other/rg/rgf

RG_EXCLUDES=(build target node node_modules bower_components \
                   '.idea' '.settings' '.git' '.svn' '.gradle' '*min.js' '*min.css' '*js.map' '*css.map')

alias rG='noglob rgf -f ${=${(j: -f :)RG_EXCLUDES}}'
alias rg='rG -i'

declare -a lastoutput

# Offer alternatives from the result of the previous command. Depending on what the command currently on the
# command line is, there's three alternatives:
# 1) If the command is one of the editing commands ("ee", "ii" or "vv"), and the current position is the
#    third word, then offer line numbers from the output of the latest invocation of rg/rG (stored in the
#    global array "lastoutput"), matching the file name currently in the second position. I.e., if rg found
#    a match in "file1" on lines 23 and 30, and the command line is currently "ii file1", then hitting alt-e
#    suggests 23 or 30.
# 2) If the last command was rg/rG (and we're at position 2), then alternatives are offered from the list of
#    matching files.
# 3) If the last command was NOT rg/rG, the last command is re-run, and the output from this command is
#    offered as completion.
#
# The alternatives can be further filtered by writing some file-name fragment before pressing alt-e. In this case, 
# only the alternatives matching what's given as a filter is offered. The match can be anywhere within the
# file name, and matches case-insensitively.
_previous-result() {
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    local -a hlist
    local lastcommand="$(fc -l -n -1)" # Find out what the last command was.

    if [[ $words[1] =~ "^(ee|ii|vv)$" ]] && (( CURRENT >= 3 )); then
        hlist=(${${(M)lastoutput:##$words[2]*}//(#b)*:([0-9]##):*/${match[1]}}) # Matching line numbers.
    elif [[ $lastcommand =~ "^(rg|rG|rgf) .*$" ]]; then
        hlist=(${(u)${lastoutput%%:*}}) # Keep file names, make unique.
    else
        hlist=("${(@f)$(eval "$lastcommand")//$'\e'\[[0-9;]#[mK]/}") # Run last command again. Remove color.
    fi

    compadd -n -V previous_result -M 'l:|=* m:{[:lower:]}={[:upper:]}' -- $hlist
}

# Cycle forward in list of matches.
zle -C previous-comp menu-complete _previous-result
bindkey '\ee' previous-comp

# Cycle backward in list of matches.
zle -C rev-previous-comp reverse-menu-complete _previous-result
bindkey '\eE' rev-previous-comp

zstyle ':completion:*previous-comp:*:*' menu no

# Edit given file with vim.
vv() {
    local filename line
    if [[ $1 =~ : ]]; then
        local -a args=(${(s':')1})
        filename="$args[1]"
        line=$args[2]
    else
        filename="$1"
        line=${2:-0}
    fi
    vim +$line "$filename"
}
# Edit given file in idea
ii() {
    local filename line
    if [[ $1 =~ : ]]; then
        local -a args=(${(s':')1})
        filename="$args[1]"
        line=$args[2]
    else
        filename="$1"
        line=${2:-0}
    fi
    (/home/kaan/other/idea/bin/idea.sh --line $line "$filename" &> /dev/null &)
    [[ $OSTYPE == darwin* ]] && activateApp "IntelliJ IDEA.app" 2>/dev/null
    return 0
}
PATH="/home/kaan/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kaan/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kaan/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kaan/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kaan/perl5"; export PERL_MM_OPT;

ffjar() {
    find . -iname "*.jar" | parallel --tag zipinfo -1 {} 2>/dev/null | \
    ag --color --color-match 31 --nomultiline "$1(?=[^\t]*$)" | \
    awk '{ printf("\x1B[35m%s\x1B[00m:%s\n", $1, $2) }'
}

# Complete with most recently touched file or directory
zstyle ':completion:my-most-recent-*:*' match-original both
zstyle ':completion:my-most-recent-*:*' completer menu files _match
zstyle ':completion:my-most-recent-*:*' file-sort modification
zstyle ':completion:my-most-recent-*:*' hidden all

# Most recent file
zstyle ':completion:my-most-recent-file:*' file-patterns '*(.):normal\ files'
zle -C my-most-recent-file menu-complete _generic
bindkey '^O' my-most-recent-file
