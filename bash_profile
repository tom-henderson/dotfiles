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

# No Color (reset)
nc=$'\e[0m'

export black red green yellow blue magenta cyan white
export BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE
export WOB nc

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Path & Environment

PATH=$PATH:~/scr:~/bin

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
alias "pds=python -m smtpd -n -c DebuggingServer localhost:1025"

alias "sw-deploy=ssh django '/opt/shaky-wholesale/codeship-deploy.sh'"

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
alias git-yolo='git commit -am "$(curl -s http://whatthecommit.com/index.txt)"'

eztv()
{
    ~/Documents/Github/eztv/eztv-show-status.py
}

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

grevert() {
    git stash save --keep-index
    git stash drop
}

gitlines() {
    git ls-files | xargs -n1 git blame | perl -n -e '/\s\((.*?)\s[0-9]{4}/ && print "$1\n"' | sort -f | uniq -c
}

new-django-project() {
    [[ $# > 0 ]] || return
    project=$1
    mkvirtualenv ${project}
    pip install django
    django-admin startproject --template=https://github.com/tom-henderson/django-template/archive/master.zip --extension=py,rst,html ${project}
    cd ${project}
    git init
    git add .
    git commit -m "Initial commit."
    cd ${project}
    python manage.py migrate
    python manage.py runserver
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Prompt


git_info()
{
    GIT="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
    if [[ ${GIT} != "" ]]; then
        GIT="[${GIT}]"
    fi
}

setup_prompt()
{
    readonly FG_RED="$(tput setaf 1)"
    readonly FG_ORANGE="$(tput setaf 9)"
    readonly FG_YELLOW="$(tput setaf 3)"
    readonly FG_GREEN="$(tput setaf 2)"
    readonly FG_BLUE="$(tput setaf 4)"
    readonly FG_CYAN="$(tput setaf 6)"
    readonly FG_MAGENTA="$(tput setaf 5)"
    readonly FG_VIOLET="$(tput setaf 13)"

    readonly RESET="$(tput sgr0)"

    SYMBOL=$1

    # Not sure why this isn't working.
    # Something must be resetting $? before it runs
    if [ $? -eq 0 ]; then
        PROMPT_COLOUR=${FG_GREEN}
    else
        PROMPT_COLOUR=${FG_RED}
    fi

    # PS1 - Default prompt
     PS1="${FG_GREEN}[\u ${FG_YELLOW}\w${FG_GREEN}]"
    PS1+="${FG_BLUE}$(git_info)"     # Git
    PS1+="\n"
    PS1+="${PROMPT_COLOUR}${SYMBOL}" # Prompt symbol
    PS1+="${RESET} "                 # Reset colours
}

setup_prompt "⚡"
unset setup_prompt

# Something above isn't working>>>
PS1='\[$GREEN\][\u \[$YELLOW\]\w\[$GREEN\]\[$BLUE\] $(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[$GREEN\]]$ \[$nc\]'

# can add \! to prompt to print command number

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Login message
uptime
lastperiodics
lastbackup 168  # Weekly SuperDuper Backup
lastbackblaze 3 # Backblaze Status - can take about 3 hours to find new files

export GROFF_NO_SGR=1
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m'   \
    LESS_TERMCAP_md=$'\E[01;38;5;74m'  \
    LESS_TERMCAP_me=$'\E[0m'           \
    LESS_TERMCAP_se=$'\E[0m'           \
    LESS_TERMCAP_so=$'\E[38;5;246m'    \
    LESS_TERMCAP_ue=$'\E[0m'           \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}
