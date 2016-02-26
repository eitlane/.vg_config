#
# Environmet options
#
PYTHONPATH=/projects/seidelde/local/tools/lib/python
PATH=$PATH:~/bin:/projects/seidelde/local/build/bin:/projects/seidelde/local/distcc/bin:\
/opt/gcc/bin:/projects/seidelde/local/tools/bin:/projects/seidelde/local/Python-2.6/bin:\
/projects/seidelde/local/gdb/bin:/projects/seidelde/ConfigTools/ConfigTools:\
/projects/mwdeldev/TTSERVER/scripts

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib64:/softntools/opt/Python-2.6/lib

export SI_BASE_PORT=40000

#stty erase '^H'
#stty erase '^?'

export TERM=linux

# MAG
alias ipport="export SI_MASTERADMCLT_IP_PORT="`hostname -i | awk '{print $1}'`:"`expr $SI_BASE_PORT + 1`; export SI_MASTERAGENT_IP_PORT=`hostname -i | awk '{print $1}'`:$SI_BASE_PORT"
alias killsi="killall -u $USERNAME TTServer sei_master sei_admin sei_mux sei_srv sei_agent otf_fe otf_be otf_cs otf_hacs otf_lqs /opt/python-2.6-64/bin/python; sleep 0.2; psmy"
alias killotf='killall -u $USERNAME otf_be otf_cs otf_fe otf_hacs otf_lqs'
alias killmag='killall -u $USERNAME sei_master'
alias sia='/projects/seidelde/delivery/SI/PRD/bin/Linux2-6_64/MultiThread/Release/g++_3_4_2/sei_admin'

#
# Options de shell
#

#export PROMPT="%B%n@%m:%~>%b "
#prompt="[$(print '%{\e[1;33m%}%T%{\e[0m%}')]""$(print '%{\e[1;31m%}%n%{\e[0m%}@%{\e[1;32m%}%m%{\e[0m%}:%~>')"
#export PS1="%{$fg_bold[cyan]%}%T%{${reset_color}%} %{$fg_bold[red]%}%n%{${reset_color}%}%{$fg_bold[yellow]%}@%{${reset_color}%}%{$fg_bold[white]%}%m%{${reset_color}%}%{$fg_bold[yellow]%}:%{${reset_color}%} %{$fg_bold[green]%}%~%{${reset_color}%}%{$fg_bold[yellow]%} ) %{${reset_color}%}"
#unset RPS1
prompt="[$(print '%{\e[1;33m%}%T%{\e[0m%}')]$(print '%{{\e[1;31m%}%n%{\e[0m%}@%{\e[30;32m%}%m%{\e[0m%}}(%~)\n$ ')"

#
# Alias
#
alias ls="ls --color=auto -F"
alias lk="ll --color=auto -F | ~/rocolor.pl"
alias grep='\grep -I --color=always --mmap --exclude=\*.d --exclude=tag\* --exclude=\*callgrind\* --exclude-dir=".hg" --exclude-dir="CVS"'
alias xterm="xterm -bg black -fg white -sl 500 -sb -vb -cr red -hc red -fn 7x13euro -rightbar"

#stty erase '^H'
#stty erase '^?'

export TERM=linux

alias vi='vim'
alias sls='screen -ls'
alias srr='exec screen -RR'
alias sis='env | grep screen'
alias sfk='exec screen -D -RR'
alias ne='emacs'
alias ressi5='killsi; cd  /remote/users/vgeorgiev/develop/br_5-1/test/regression/etc/; ./regression start; cd '
#alias ressi6='killsi; cd  /remote/users/vgeorgiev/develop/br_6-0_MultiMAG/test/regression/etc/; ./regression start; cd '
alias gl='cd /gctmp/vgeorgiev/regression/workspace/log/master/'

PATH="/remote/users/vgeorgiev/bin":$PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/remote/users/vgeorgiev/lib"

# read bash.bashrc first for some features we dont want 
# to re-implement here
#source /etc/bash.bashrc

# zsh line editing
: ${ZSHEDIT:="emacs"}
: ${TERM:=linux}

if [[ "$ZSHEDIT" == "vi" ]] then
    bindkey    -v
else
    bindkey    -e
    bindkey    "^[ "	magic-space
    bindkey    "^[!"	expand-history
fi

# Environment
HISTSIZE=1000
HISTFILE=${HOME}/.zsh_history
SAVEHIST=500

# Prompt on the right side. zsh feature
#RPROMPT="[%T]"

# Set/unset  shell options
setopt   globdots nocorrect pushdtohome autolist nopromptcr
setopt   nocorrectall autocd recexact longlistjobs
setopt   histignoredups pushdsilent appendhistory histexpiredupsfirst
setopt   autopushd pushdminus extendedglob rcquotes
unsetopt bgnice autoparamslash hup

# Setup some basic programmable completions.  To see more examples
# of these, check out /usr/doc/packages/zsh/compctl-examples.
# You you have a slow machine, you might want to comment the lines below
# with compctl in, and comment the below two lines out.
#
# compctl -g '*(-/)' cd pushd
# compctl -g '*(/)' rmdir dircmp
# compctl -j -P % -x 's[-] p[1]' -k signals -- kill
# compctl -j -P % fg bg wait jobs disown
# compctl -A shift
# compctl -caF type whence which
# compctl -F unfunction
# compctl -a unalias
# compctl -v unset typeset declare vared readonly export integer
# compctl -e disable
# compctl -d enable
#
# The default way is the usage of the zsh built-in completer
# Comment the two below lines out, if you are on a slow machine, and
# comment the above compctl lines in.

autoload -U compinit
compinit

# Completion so "cd ..<TAB>" -> "cd ../"
# zstyle ':completion:*' special-dirs ..

# Online help
unalias  run-help 2>/dev/null || true
autoload run-help

# Don't use zsh builtin which
alias which >/dev/null && unalias which

# Common standard keypad and cursor
bindkey    "^[[2~"		yank
bindkey    "^[[3~"		delete-char

# History completion on pgup and pgdown
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[5~" history-beginning-search-backward-end
bindkey "^[[6~" history-beginning-search-forward-end

if [[ "$TERM" == "xterm" ]] then
    bindkey    "^[2;5~"		yank
    bindkey    "^[3;5~"		delete-char
    bindkey    "^[5;5~"		up-history
    bindkey    "^[6;5~"		down-history
fi
bindkey    "^[[C"		forward-char
bindkey    "^[[D"		backward-char
bindkey    "^[[A"		up-history
bindkey    "^[[B"		down-history

# Avoid network problems
#   ... \177 (ASCII-DEL) and \010 (ASCII-BS)
#       do `backward-delete-char'
# Note: `delete-char' is maped to \033[3~
#       Therefore xterm's responce on pressing
#       key Delete or KP-Delete should be
#       \033[3~ ... NOT \177
bindkey    "^?"		backward-delete-char
bindkey    "^H"		backward-delete-char

# Home and End
if [[ "$TERM" == "xterm" ]] then
    # Normal keypad and cursor of xterm
    bindkey    "^[[1~"	history-search-backward
    bindkey    "^[[4~"	set-mark-command
    bindkey    "^[[H"	beginning-of-line
    bindkey    "^[[F"	end-of-line
    # Home and End of application keypad and cursor of xterm
    bindkey    "^[OH"	beginning-of-line
    bindkey    "^[OF"	end-of-line
    bindkey    "^[O5H"	beginning-of-line
    bindkey    "^[O5F"	end-of-line
else
if [[ "$TERM" == "kvt" ]] then
    bindkey    "^[[1~"	history-search-backward
    bindkey    "^[[4~"	set-mark-command
    bindkey    "^[OH"	beginning-of-line
    bindkey    "^[OF"	end-of-line
else
    # TERM=linux or console
    bindkey    "^[[1~"	beginning-of-line
    bindkey    "^[[4~"	end-of-line
fi
fi

# Application keypad and cursor of xterm
if [[ "$TERM" == "xterm" ]] then
    bindkey    "^[OD"	backward-char
    bindkey    "^[OC"	forward-char
    bindkey    "^[OA"	up-history
    bindkey    "^[OB"	down-history
    # DEC keyboard KP_F1 - KP_F4
    bindkey -s "^[OP"	"^["
    bindkey    "^[OQ"	undo
    bindkey    "^[OR"	undefined-key  
    bindkey    "^[OS"	kill-line
fi
if [[ "$TERM" == "gnome" ]] then
    # or gnome terminal F1 - F4
    bindkey -s "^[OP"	"^["
    bindkey    "^[OQ"	undo
    bindkey    "^[OR"	undefined-key  
    bindkey    "^[OS"	kill-line
fi
# Function keys F1 - F12
if [[ "$TERM" == "linux" ]] then
    # On console the first five function keys
    bindkey    "^[[[A"	undefined-key
    bindkey    "^[[[B"	undefined-key
    bindkey    "^[[[C"	undefined-key
    bindkey    "^[[[D"	undefined-key
    bindkey    "^[[[E"	undefined-key
else
    # The first five standard function keys
    bindkey    "^[[11~"	undefined-key
    bindkey    "^[[12~"	undefined-key
    bindkey    "^[[13~"	undefined-key
    bindkey    "^[[14~"	undefined-key
    bindkey    "^[[15~"	undefined-key
fi
bindkey    "^[[17~"		undefined-key
bindkey    "^[[18~"		undefined-key
bindkey    "^[[19~"		undefined-key
bindkey    "^[[20~"		undefined-key
bindkey    "^[[21~"		undefined-key
# Note: F11, F12 are identical with Shift_F1 and Shift_F2
bindkey    "^[[23~"		undefined-key
bindkey    "^[[24~"		undefined-key

# Shift Function keys F1  - F12
#      identical with F11 - F22
#
# bindkey   "^[[23~"	undefined-key
# bindkey   "^[[24~"	undefined-key
bindkey    "^[[25~"		undefined-key
bindkey    "^[[26~"		undefined-key
# DEC keyboard: F15=^[[28~ is Help
bindkey    "^[[28~"		undefined-key
# DEC keyboard: F16=^[[29~ is Menu
bindkey    "^[[29~"		undefined-key
bindkey    "^[[31~"		undefined-key
bindkey    "^[[32~"		undefined-key
bindkey    "^[[33~"		undefined-key
bindkey    "^[[34~"		undefined-key
if [[ "$TERM" == "xterm" ]] then
    # Not common
    bindkey    "^[[35~"	undefined-key
    bindkey    "^[[36~"	undefined-key
fi

if [[ "$TERM" == "xterm" ]] then
    # Application keypad and cursor of xterm
    # with NumLock ON
    #
    # Operators
    bindkey -s "^[Oo"	"/"
    bindkey -s "^[Oj"	"*"
    bindkey -s "^[Om"	"-"
    bindkey -s "^[Ok"	"+"
    bindkey -s "^[Ol"	","
    bindkey -s "^[OM"	"\n"
    bindkey -s "^[On"	"."
    # Numbers
    bindkey -s "^[Op"	"0"
    bindkey -s "^[Oq"	"1"
    bindkey -s "^[Or"	"2"
    bindkey -s "^[Os"	"3"
    bindkey -s "^[Ot"	"4"
    bindkey -s "^[Ou"	"5"
    bindkey -s "^[Ov"	"6"
    bindkey -s "^[Ow"	"7"
    bindkey -s "^[Ox"	"8"
    bindkey -s "^[Oy"	"9"
fi

#  EMACS line editing
if [[ "$ZSHEDIT" == "emacs" ]] then 
    # ... xterm application cursor
    if [[ "$TERM" == "xterm" ]] then
	bindkey    "^[^[OD"	backward-word
	bindkey    "^[^[OC"	forward-word
	bindkey    "^[^[OA"	up-history
	bindkey    "^[^[OB"	down-history
	bindkey    "^^[OD"	backward-char
	bindkey    "^^[OC"	forward-char
	bindkey    "^^[OA"	up-history
	bindkey    "^^[OB"	down-history
    fi
    # Standard cursor
    bindkey    "^[^[[D"	backward-word
    bindkey    "^[^[[C"	forward-word
    bindkey    "^[^[[A"	up-history
    bindkey    "^[^[[B"	down-history
    bindkey    "^^[[D"	backward-char
    bindkey    "^^[[C"	forward-char
    bindkey    "^^[[A"	up-history
    bindkey    "^^[[B"	down-history
fi
