alias cp='cp -av'
alias kk='sendmail -d0.4 -bv root |less'
#alias mkdir='mkdir -m 600 --verbose'
alias l='ls -FaG'
alias ll='ls -lartG'
#sort by mod time:
alias lll='ls -FalotG'
#sort by size:
alias llll='ls -laSG'
#whatever:
alias lllll='ls -FlaG --full-time -o -Q'
#sort the extensions alphabetically; good for winfiles
alias llllll='ls -FlaXoG'


# history file control:

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTCONTROL=ignorespace