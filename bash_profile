# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Bash profile settings
# 
# Last edit 2011-02-21
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Definitions
export EDITOR=pico
FIREBIRD_HOME=/Library/Frameworks/Firebird.framework/Resources

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

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Path
#
# /opt/local/bin        Installed by macports
# /opt/local/sbin       Installed by macports
# /usr/local/mysql/bin  MySQL
# $FIREBIRD_HOME/bin    Firebird (isql)
# /Developer/Tools      Developer tools
# ~/bin, ~/scr          Custom scripts & binaries
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$FIREBIRD_HOME/bin:/Developer/Tools:~/bin:~/scr

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Python Path
#
# /Users/tom/lib/python Custom python libs

export PYTHONPATH='/Users/tom/lib/python/'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Useful aliases
alias "ls=ls -G"
alias "l=ls -lAGFh"
alias "..=cd .."
alias "grep=grep --colour"
alias "st=open -a 'Sublime Text 2.app'"
alias "django=python manage.py"

# Firstclass
alias "fcwho=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcwho | sort"
alias "fclast=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fclast | grep -v Internet"
alias "fcperf=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcperf"
alias "fcputil=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/bin/fcputil"
alias "fcdu=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcdu"

# Applications
alias "synergy-start=synergys --config ~/.synergy.conf"
alias "synergy-stop=killall synergys"
alias "sickbeard=/Users/tom/Applications/sickbeard/Sickbeard.py"

# Misc
alias "wifi=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"

# Silly
alias "hardwork=cat /dev/random | hexdump -C | grep 'ca fe'"
alias "excuse=telnet bofh.engr.wisc.edu 666"

# Git
newbranch()
{
	[[ $# > 0 ]] || return
	branch=$1
	#git branch ${branch}
	#git checkout ${branch}
	#git status
	echo ${branch}
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Prompt

# PS1 - Default interaction prompt
PS1='\[$GREEN\][\u \[$YELLOW\]\w\[$GREEN\]]$ \[$nc\]'
# PS2 - Continuation prompt
PS2='\[$CYAN\]> \[$nc\]'

# can add \! to prompt to print command number

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Login message
uptime
lastperiodics
lastbackup 168  # Weekly SuperDuper Backup
lastbackblaze 3 # Backblaze Status - can take about 3 hours to find new files


##
# Your previous /Users/tom/.bash_profile file was backed up as /Users/tom/.bash_profile.macports-saved_2013-03-27_at_09:07:50
##

# MacPorts Installer addition on 2013-03-27_at_09:07:50: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

