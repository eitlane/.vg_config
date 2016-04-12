#!/bin/bash
## --- Alias Start ---

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ne='emacs -nw'
alias psmy='ps -fu $USER | sort | egrep -v "ps -fu|sort|grep"'
alias ll='ls -la'

alias gdb='gdb -silent'

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

# ctags $(find . -regex '.*\.\(cpp\|h\)')
alias generateTags='ctags $(find . -regex ".*\.\(cpp\|h\)")'

alias STS='/bin/STS &>/dev/null &'

## --- Alias End ---
