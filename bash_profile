# Path & Environment
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH:~/scr:~/bin"

export EDITOR=pico

# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

export PYTHONDONTWRITEBYTECODE=1

source ~/.tokens

# Color man page output
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

# Useful aliases
alias "ls=ls -G"
alias "l=ls -lGFh"
alias "..=cd .."
alias "grep=grep --colour"
alias "st=open -a 'Sublime Text.app'"
alias "django=python manage.py"
alias "pds=python -m smtpd -n -c DebuggingServer localhost:1025"
alias "activate=source .env/bin/activate"

# Firstclass
alias "fcwho=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcwho | sort"
alias "fclast=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fclast | grep -v Internet"
alias "fcperf=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcperf"
alias "fcputil=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/bin/fcputil"
alias "fcdu=ssh -p 2020 tom@apollo.pack.co.nz /home/tom/scr/fcdu"

# Misc
alias "wifi=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"

# Silly
alias "hardwork=cat /dev/random | hexdump -C | grep 'ca fe'"
alias "excuse=telnet bofh.engr.wisc.edu 666"
alias git-yolo='git commit -am "$(curl -s http://whatthecommit.com/index.txt)"'

alias "eztv=~/Documents/Github/eztv/eztv-show-status.py"

grm() {
	git rm $(git ls-files --deleted)
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

# Prompt
function _update_ps1() {
    PS1="$(~/Documents/Github/powerline-shell/powerline-shell.py --mode compatible $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Login message
uptime
lastperiodics
lastbackup 168  # Weekly SuperDuper Backup
lastbackblaze 3 # Backblaze Status - can take about 3 hours to find new files
