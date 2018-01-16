#-- Aliases --#
alias ls='ls --color=auto'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias grep='grep --color=auto'
alias gay='grc -es --colour=auto'

mkcd () { mkdir -p "$@" && cd "$@"; }

extract () {
if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2)  tar xjf $1     ;;
        *.tar.gz)   tar xzf $1     ;;
        *.bz2)      bunzip2 $1     ;;
        *.rar)      rar x $1       ;;
        *.gz)       gunzip $1      ;;
        *.tar)      tar xf $1      ;;
        *.tbz2)     tar xjf $1     ;;
        *.tgz)      tar xzf $1     ;;
        *.zip)      unzip $1       ;;
        *.Z)        uncompress $1  ;;
        *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
else
    echo "'$1' is not a valid file"
fi
}

#-- fing rainbows how do the work? --#
alias configure='grc ./configure'
alias diff='grc diff'
alias make='grc make'
alias gcc='grc gcc'
alias g++='grc g++'
alias cvs='grc cvs'
alias as='grc as'
alias ld='grc ld'
alias netstat='grc netstat'
alias ping='grc ping'
alias traceroute='grc traceroute'
alias tail='grc tail'
alias nmap='grc nmap'
alias ps='grc ps'
alias ifconfig='grc ifconfig'
alias dig='grc dig'
alias fdisk='grc fdisk'
alias iptables='grc iptables'
alias lsmod='grc lsmod'
alias lsof='grc lsof'
alias sysctl='grc sysctl'
alias systemctl='grc systemctl'
alias uptime='grc uptime'
alias vmstat='grc vmstat'
alias mount='grc mount'
alias mtr='grc mtr'
