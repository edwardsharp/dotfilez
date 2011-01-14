# many parts ripped from: <a href="http://www.welearn.com.au/freebsd/">Sue's FreeBSD page</A> and the Bash HOWTO. 

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin; export PATH

BLOCKSIZE=K;	export BLOCKSIZE
EDITOR=vi;   	export EDITOR
PAGER='less -e';  	export PAGER

#auto logout after n seconds of inactivity
TMOUT=600

# Makes new files have permissions: rwxr-xr-x
umask 022
#after everything is installed, uncomment this and the mkdir alias below:
#umask 077

alias cp='cp -av'
alias kk='sendmail -d0.4 -bv root |less'
#alias mkdir='mkdir -m 600 --verbose'
alias l='ls -Fa --color=auto'
alias ll='ls -la --color=auto'
#sort by mod time:
alias lll='ls -Falot --color=auto'
#sort by size:
alias llll='ls -laS --color=auto'
#whatever:
alias lllll='ls -Fla --full-time -o -Q --color=auto'
#sort the extensions alphabetically; good for winfiles
alias llllll='ls -FlaXo --color=auto'


# history file control:

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTCONTROL=ignorespace


## Optional enhancement to "you have mail" notices displayed before the prompt
## The mail check behaviour can be changed from the defaults
## Default mailcheck is 60 seconds. For example, to check every 20 seconds:
# MAILCHECK=20
## You can check at the prompt for other people's mail arrival too.
# MAILPATH=/var/mail/chris:/var/mail/jan
#MAILPATH=/etc/mail/dasi
## In the next example, I have extra accounts chris and kim, and also
## want to be informed when jan receives mail. Use it as a model.
# MAILPATH=/var/mail/chris:/var/mail/jan"jan has mail":/var/mail/npitc:/var/mail/kim



###### Examples of different prompts ######

## Simple primary prompt settings:

## Try these one at a time to see what you prefer, 'man bash' for more info.
## Simple prompt
#PS1="\u@\h\$ "
## Simple prompt with directory
#PS1="\u@\h [\w] \$ "
## Simple prompt with time
#PS1="\t \u@\h\$ "
## Prompt with brief info
#PS1="\u `tty | sed 's/\/dev\///'` [\W] \$ "
## Longer prompt
#PS1="\u@\h `tty | sed 's/\/dev\///'` \w \$ "
## Longer prompt with time
#PS1="\t \u@\h `tty | sed 's/\/dev\///'` \w \$ "
## Coloured two-line prompt
#PS1="\[\033[36m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[32m\]\w/ \n\[\033[36m\] $\[\033[0m\] "
## These colors work better with light background (xterm)
#PS1="\[\033[34m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[35m\]\w/ \n\[\033[34m\] $\[\033[0m\] "



## Fancier way to set prompts:

## Check if running in an xterm and give a more suitable prompt
## (two alternative blocks given below)
## mesg y allows talk(1) requests, here only if not an xterm



## Gives informative prompt, puts user,host,path in xterm title
## Comment or uncomment all of the following lines ('case' to 'esac')
#case $TERM in
#     xterm*)
#        PS1="\[\033]0;\u@\h: \w\007\]bash\$ "
#       ;;
#  *)
#      PS1="\t \u@\h `tty | sed 's/\/dev\///'`\$ "
#       mesg y
#        ;;
#esac


## Colourful prompts
## Comment or uncomment all of the following lines ('case' to 'esac')
#case $TERM in
#      xterm*)
#          TERM=xterm-color; export TERM
#          PS1="\[\033[36m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[35m\]\w/ \n\[\033[36m\] $\[\033[0m\] "
#          ;;
#      *)
          PS1="\[\033[36m\] \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[1;31m\]\w/ \n\[\033[36m\]! \[\033[1;32m\] "
    #this adds a bg color; comment out the above
#      PS1="\[\033[35m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[32m\]\w/ \n\[\033[36m\] $\[\033[44;1;36m\] `setterm -bold on` "
#          mesg y
#          ;;
#esac



#xterm windowdressing
  function elite
  {

  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"

  case $TERM in
      xterm*)
          local TITLEBAR='\[\033]0;\u@\h:\w\007\]'
          ;;
      *)
          local TITLEBAR=""
          ;;
  esac

  local GRAD1=$(tty|cut -d/ -f3)
  PS1="$TITLEBAR\
  $GRAY-$CYAN-$LIGHT_CYAN(\
  $CYAN\u$GRAY@$CYAN\h\
  $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
  $CYAN\#$GRAY/$CYAN$GRAD1\
  $LIGHT_CYAN)$CYAN-$LIGHT_CYAN(\
  $CYAN\$(date +%H%M)$GRAY/$CYAN\$(date +%d-%b-%y)\
  $LIGHT_CYAN)$CYAN-$GRAY-\
  $LIGHT_GRAY\n\
  $GRAY-$CYAN-$LIGHT_CYAN(\
  $CYAN\$$GRAY:$CYAN\w\
  $LIGHT_CYAN)$CYAN-$GRAY-$LIGHT_GRAY "
  PS2="$LIGHT_CYAN-$CYAN-$GRAY-$LIGHT_GRAY "
  }

