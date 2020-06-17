# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Original .ashrc file is in /data2/Linuxxx
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S "
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    #PS1='\n\[\e[01;33m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;36m\]\h\[\e[0m\]\[\e[00;37m\] \t \[\e[0m\]\[\e[01;35m\]\w\[\e[0m\]\[\e[01;37m\] \[\e[0m\]$ '
    PS1='${debian_chroot:+($debian_chroot)}\033[1;36m\]\h\[\033[1;31m\] [\w]\[\033[00m\] >\[\033[1;32m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

		##########################################################################################################################
		##         														##
		##			SOME ADDITIONAL ALIAS FILE ADDED AFTER THIS PARAGRAPH						##
		##															##
		##															##
		##########################################################################################################################


LS_COLORS="di=1;4;33;34"

#Automatically do an ls after each cd
 cd ()
 {
 	if [ -n "$1" ]; then
 		builtin cd "$@" && ls
 	else
 		builtin cd ~ && ls
 	fi
 }

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias open="xdg-open "
alias upd="sudo apt update -y"
alias inst="sudo apt-get install -y"
alias install="sudo apt-get install -y"
alias upg="sudo apt upgrade -y"
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias la='ls -Alh' # show hidden files
alias utar='tar -xvf'
alias tex="texmaker &"
alias bsh="vim ~/.bashrc"
alias load="source ~/.bashrc"
alias d1="cd /data1"
alias d2="cd /data2"
alias search="aptitude search"
alias filesync="rsync -zvh"
alias foldersync="rsync -avzh"
alias vrc='vim ~/.vimrc'
alias p='python3'
alias c='clear'
alias xterm='xterm -fa 'Monospace' -fs 13 -sb -sl 600 &'
alias ds9='ds9 &'
alias iraf27='conda activate iraf27'
alias deactivate='conda deactivate'
alias t='terminator &'
alias bb='brave-browser &'
alias jn1='cd /data1 && jupyter-notebook &'
alias jn2='cd /data2 && jupyter-notebook &'
alias jn='cd / && jupyter-notebook &'




function define {
# espeak for the pronunciation audible output and phonetic alphabet string
echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"       
# dict - the client for the dictionary server
dict "$1"       
}
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi
####################################################################
#COLOR CODING FOR TEXT
#
#Directory: di
#File: fi	
#Symbolic Link: ln
#Named Pipe (FIFO): pi
#Socket: so
#Block Device: bd
#Character Device: cd
#Orphan Symbolic Link (points to a file that no longer exists): or
#Missing File (a missing file that an orphan symbolic link points to): mi
#Executable File (has the “x” permission): ex
#
#
#
####Foreground Text
#*Black: 30
#*Blue: 34
#*Cyan: 36
#*Green: 32
#*Purple: 35
#*Red: 31
#*White: 37
#*Yellow: 33
#
#
#
#
#
#
#
#
#
#
#*Black background: 40
#*Blue background: 44
#*Cyan background: 46
#*Green background: 42
#*Purple background: 45
#*Red background: 41
#*White background: 47
#*Yellow background: 43
#
#
#
#
#
#########Text Color Atributes
#*Normal Text: 0
#*Bold or Light Text: 1 (It depends on the terminal emulator.)
#*Dim Text: 2
#*Underlined Text: 4
#*Blinking Text: 5 (This does not work in most terminal emulators.)
#*Reversed Text: 7 (This inverts the foreground and background colors, so you’ll see black text on a white background if the current text is white text on a black background.)
#*Hidden Text: 8
#
#
#
#
#



		##########################################################################################################################
		##         														##
		##			SOME ADDITIONAL ALIAS FILE ADDED BEFORE THIS PARAGRAPH						##
		##															##
		##															##
		##########################################################################################################################



# Add iraf setup commands
if [ -e /home/rchand/.iraf/setup.sh ]; then
    source /home/rchand/.iraf/setup.sh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rchand/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rchand/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rchand/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rchand/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

