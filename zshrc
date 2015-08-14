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
