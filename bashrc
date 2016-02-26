# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Eternal bash history - begin (experimental)
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login

export HISTFILE=~/.bash_eternal_history

# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Eternal bash history - end

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\[\e[0;31m\][\e[0;34m\t\e[0;31m]{\[\e[1;30m\]\u\[\e[0;37m\]@\[\e[1;34m\]\h\[\e[0;31m\]}\[\e[0;31m\](\[\e[1;31m\]\w\[\e[0;31m\])\[\e[0;33m\]$(__git_ps1)\n\[\e[0;31m\]$ \[\e[m\]'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source __git_ps1 envornmet variable
# curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

if [ -f ~/.bash_git ]; then
    . ~/.bash_git
fi

## --- Alias Start ---

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ne='emacs -nw'
alias psmy='ps -fu $USER | sort | egrep -v "ps -fu|sort|grep"'
alias ll='ls -la'

alias portst='netstat -lnpat'
alias portsu='netstat -lnpau'

alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

alias wget='wget -c'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## copy with progress
alias cpProgress="rsync --progress -ravz"
alias viewmount="mount |column -t"

## turn screen off
alias screenoff="xset dpms force off"

## Tree no tree
## alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
## alias dirtree="ls -R | grep :*/ | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

## Git config
alias gl='git log --pretty=oneline --graph --decorate'
alias gla='git log --pretty=oneline --graph --decorate --all'

#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWSTASHSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWUPSTREAM=verbose
#export GIT_PS1_DESCRIBE_STYLE=branch


get_sha() {
    git rev-parse --short HEAD 2>/dev/null
}

## End Git config

## print the usege on the disk of fisrt agrument
function usage()
{
    du -ha --max-depth=1 $1 | sort -rh
}

function hfind()
{
    ack --type=h "$@"
    #find . -name \*.h |xargs -n1 grep -H --color=auto -n "$@"
}

function cppfind()
{
    ack --type=cpp "$@"
    #find . -name \*.cpp |xargs -n1 grep -H --color=auto -n "$@"
}

# ctags $(find . -regex '.*\.\(cpp\|h\)')
alias generateTags='ctags $(find . -regex ".*\.\(cpp\|h\)")'


## --- Alias End ---

# AMADEUS SPECIFIC

[[ -s "/home/vgeorgiev/.gvm/scripts/gvm" ]] && source "/home/vgeorgiev/.gvm/scripts/gvm"
alias m273='sshfs -o transform_symlinks vgeorgiev@ncegcolnx273:/ ~/273/'
alias mvg='sshfs -o transform_symlinks vgeorgiev@ncegcolnx273:/remote/users/vgeorgiev /home/vgeorgiev/remote/'
alias 2='ssh ncegcolnx273'
alias 1='ssh ncegcolnx278'
alias gcvgeorgiev='ssh -R 5000:dockerhub.rnd.amadeus.net:5000 -R 5001:dockerhub.rnd.amadeus.net:5001 -R 5002:dockerhub.rnd.amadeus.net:5002 -R 8080:rndwww.nce.amadeus.net:80 -R 1443:dockerhub.rnd.amadeus.net:443 -p 443 130.211.63.133'
# EXPERIMENTAL
# alias connections='sudo lsof -n -P -i +c 15'
# show directories only
# alias   dsdd="ls -FlA | grep :*/"
# show executables only
# alias   dsdx="ls -FlA | grep \*"
# show non-executables
# alias   dsdnx="ls -FlA | grep -v \*"
# order by date
# alias   dsdt="ls -FlAtr "
# alias dlr=”/usr/local/bin/mplayer -nocache -audiofile-cache 64 -prefer-ipv4 $(GET http://www.dradio.de/streaming/dkultur.m3u|head -1)”
# alias lst='ls -ltr'   # most recently updated files last
# awk tab delim  (escape '\' awk to disable aliased awk)
# tawk='\awk -F "\t" '
# case insensitive grep
# alias ig="grep --color -i "
# ls sort by time
# alias lt="ls -ltr "
# ls sort by byte size
# alias lS='ls -Slr'
# ps by process grep  (ie. psg chrome)
# alias psg='\ps -ef|grep --color '
# ps by user
# alias psu='\ps auxwwf '
# ps by user with grep (ie. psug budman)
# alias psug='psu|grep --color '
# find broken symlinks
# alias brokenlinks='\find . -xtype l -printf "%p -> %l\n"'

# URLS
# http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

unset SSH_ASKPASS
export MANPAGER=most

PS1='\[\e[0;31m\][\e[0;34m$?\e[0;31m][\e[0;34m\t\e[0;31m]{\[\e[1;30m\]\u\[\e[0;37m\]@\[\e[1;34m\]\h\[\e[0;31m\]}\[\e[0;31m\](\[\e[1;31m\]\w\[\e[0;31m\])\[\e[0;33m\]$(__git_ps1 " ($(get_sha) %s)")\n\[\e[0;31m\]$ \[\e[m\]'

