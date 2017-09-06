# .bashrc

# ======================
# Init environment
# ======================
# Check for an Interactive Session
[ -z "PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Set colors for bash (pretty!!)
if [ -f ~/.bash_colors ]; then
  . ~/.bash_colors
fi

# If support 256 color terminal then DO IT...
/usr/bin/dircolors --p|grep -E xterm-256color > /dev/null
if [ $? -eq 0 ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

case $(uname -s) in
Linux|SunOS)
  eval `dircolors ~/.trapd00r_colors`
  ;;
esac

PS1='[\[\033[00;32m\]\u@\h\[\033[00;31m\]:$(date +%H%M) \[\033[00;35m\]\W\[\033[00m\]]\$'


# =====================
# Shell Variables
# =====================
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts
export EDITOR=vim
export GREP_COLOR="1;32"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=5000
export HISTFILESIZE=2000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:bg:fg:ll:h"
export PAGER=less
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'


# =====================
# Config Options
# =====================
shopt -s histappend     # Append to history rather than overwrite
shopt -s cdspell        # Correct spelling in cd command
shopt -s checkwinsize
shopt -s cdable_vars
shopt -s checkhash
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.


# =====================
# Functions
# =====================
# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
  local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
  echo $((10#$SYSLOAD))       # Convert to decimal.
}


# ====================
# Aliases
# ====================
alias df='sudo df -h'
alias ls='sudo ls -pFHh --color=auto'
alias ll='sudo ls -lsh'
alias la='sudo ls -A'
alias lt='sudo ls -ltrhs'
alias l='sudo ls -CFlhs'
alias ps='sudo ps o user,pid,psr,%cpu,%mem,args axf --cols 120'
alias grep='sudo grep --color=auto'
alias rsync='rsync -ravz --progress'
alias yum='sudo yum -y'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias which='type -a'
alias ..='cd ..'
alias du='sudo du -kh'    # Makes a more readable output.
alias df='sudo df -kTh'
alias more='sudo less'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias vi='vim'
alias ansible-syntax='ansible-playbook --syntax-check'
