# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Definitions
export EDITOR=pico

# Colours
black=$'\[\e[30m'
red=$'\e[31m'
green=$'\e[32m'
yellow=$'\e[33m'
blue=$'\e[34m'
magenta=$'\e[35m'
cyan=$'\e[36m'
white=$'\e[37m'

# Bold colours
BLACK=$'\e[1;30m'
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[1;34m'
MAGENTA=$'\e[1;35m'
CYAN=$'\e[1;36m'
WHITE=$'\e[1;37m'

#Bold white on black
WOB=$'\e[1;37;40m'

# No Color (reset)
nc=$'\e[0m'

export black red green yellow blue magenta cyan white
export BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE
export WOB nc

export myemail="tomhenderson@mac.com"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Path & Environment

PATH=$PATH:~/scr

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Useful aliases
alias "ls=ls -G"
alias "l=ls -lGFh"
alias "..=cd .."
alias "grep=grep --colour"
alias "st=open -a 'Sublime Text.app'"
alias "django=python manage.py"

# Firstclass
alias "fcwho=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcwho | sort"
alias "fclast=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fclast | grep -v Internet"
alias "fcperf=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcperf"
alias "fcputil=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/bin/fcputil"
alias "fcdu=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcdu"

# Misc
alias "wifi=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
alias "please=sudo !!"

# Silly
alias "hardwork=cat /dev/random | hexdump -C | grep 'ca fe'"
alias "excuse=telnet bofh.engr.wisc.edu 666"

# Git
newbranch()
{
	[[ $# > 0 ]] || return
	branch=$1
	git branch ${branch}
	git checkout ${branch}
	git status
	echo ${branch}
}

grm() {
	git rm $(git ls-files --deleted)
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Prompt

# PS1 - Default interaction prompt
PS1='\[$GREEN\][\u \[$YELLOW\]\w\[$GREEN\]\[$BLUE\] $(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[$GREEN\]]$ \[$nc\]'
# PS2 - Continuation prompt
PS2='\[$CYAN\]> \[$nc\]'

# can add \! to prompt to print command number

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Login message
uptime
lastperiodics
lastbackup 168  # Weekly SuperDuper Backup
lastbackblaze 3 # Backblaze Status - can take about 3 hours to find new files

