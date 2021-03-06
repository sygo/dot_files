#Somewhat modified from the Aaron's original and awesome work --  

# My ZSH prompt theme to match the 88_madcows.theme for Irssi
# Author: Aaron Toponce
# License: Public Domain

function precmd {
    # let's get the current get branch that we are under
    # ripped from /etc/bash_completion.d/git from the git devs
    git_ps1 () {
        if which git > /dev/null; then
            local g="$(git rev-parse --git-dir 2>/dev/null)"
            if [ -n "$g" ]; then
                local r
                local b
                if [ -d "$g/rebase-apply" ]; then
                    if test -f "$g/rebase-apply/rebasing"; then
                        r="|REBASE"
                    elif test -f "$g/rebase-apply/applying"; then
                        r="|AM"
                    else
                        r="|AM/REBASE"
                    fi
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                elif [ -f "$g/rebase-merge/interactive" ]; then
                    r="|REBASE-i"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -d "$g/rebase-merge" ]; then
                    r="|REBASE-m"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -f "$g/MERGE_HEAD" ]; then
                    r="|MERGING"
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                else
                    if [ -f "$g/BISECT_LOG" ]; then
                        r="|BISECTING"
                    fi
                    if ! b="$(git symbolic-ref HEAD 2>/dev/null)"; then
                       if ! b="$(git describe --exact-match HEAD 2>/dev/null)"; then
                          b="$(cut -c1-7 "$g/HEAD")..."
                       fi
                    fi
                fi
                if [ -n "$1" ]; then
                     printf "$1" "${b##refs/heads/}$r"
                else
                     printf "%s" "${b##refs/heads/}$r"
                fi
            fi
        else
            printf ""
        fi
    }

    GITBRANCH=" $(git_ps1)"

    # The following 9 lines of code comes directly from Phil!'s ZSH prompt
    # http://aperiodic.net/phil/prompt/
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    local PROMPTSIZE=${#${(%):--- %D{%R.%S %a %b %d %Y}\! }}
    local PWDSIZE=${#${(%):-%~}}

    if [[ "$PROMPTSIZE + $PWDSIZE" -gt $TERMWIDTH ]]; then
	(( PR_PWDLEN = $TERMWIDTH - $PROMPTSIZE ))
    fi

    # set a simple variable to show when in screen
    if [[ -n "${WINDOW}" ]]; then
        SCREEN=" S:${WINDOW}"
    else
        SCREEN=""
    fi

    # check if jobs are executing
    if [[ $(jobs | wc -l) -gt 0 ]]; then
        JOBS=" J:%j"
    else
        JOBS=""
    fi

    # I want to know my battery percentage when running on battery power
    if which ibam &> /dev/null; then
        BATTSTATE="$(ibam --percentbattery)"
        BATTPRCNT="${BATTSTATE[(f)1][(w)-2]}"
        BATTTIME="${BATTSTATE[(f)2][(w)-1]}"
        PR_BATTERY=" B:${BATTPRCNT}%% (${BATTTIME})"
        if [[ "${BATTPRCNT}" -lt 15 ]]; then
            PR_BATTERY="${PR_BRIGHT_RED}${PR_BATTERY}"
        elif [[ "${BATTPRCNT}" -lt 50 ]]; then
            PR_BATTERY="${PR_BRIGHT_YELLOW}${PR_BATTERY}"
        elif [[ "${BATTPRCNT}" -lt 100 ]]; then
            PR_BATTERY="${PR_RESET}${PR_BATTERY}"
        else
            PR_BATTERY=""
        fi
    fi
}

setprompt () {
    # Need this, so the prompt will work
    setopt prompt_subst

    # let's load colors into our environment, then set them
    autoload colors zsh/terminfo

    if [[ "$terminfo[colors]" -gt 8 ]]; then
        colors
    fi

    for COLOR in RED GREEN YELLOW WHITE BLACK; do
        eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
        eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
    done

    PR_RESET="%{$reset_color%}"

    # Finally, let's set the prompt
    PROMPT='\
${PR_BRIGHT_BLACK}<${PR_RESET}${PR_RED}<${PR_BRIGHT_RED}<\
${PR_BRIGHT_BLACK} %n@%m${PR_RED}!${PR_BRIGHT_BLACK}${JOBS}%(?..E:%?)${PR_BRIGHT_RED}!${PR_BRIGHT_BLACK}%$PR_PWDLEN<...<%~%<< \
${PR_BATTERY}${GITBRANCH}\

${PR_BRIGHT_BLACK}>${PR_RESET}${PR_GREEN}>${PR_BRIGHT_GREEN}>\
${PR_RESET} '

    # Of course we need a matching continuation prompt
    PROMPT2='\
${PR_BRIGHT_BLACK}>${PR_RESET}${PR_GREEN}>${PR_BRIGHT_GREEN}>\
${PR_RESET} %_ ${PR_BRIGHT_BLACK}>${PR_RESET}${PR_GREEN}>\
${PR_BRIGHT_GREEN}>${PR_RESET} '
}

setprompt
