# a separate bashrc for fpkg's shell ('fpkg goto'), change it
# if needed :)

# colored $PS1 to make it pretty, see
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR
# for possible colors to use here
export PS1="\[\e[1;33m\](fpkg) \e[1;37m\]\W \e[1;34m\]\$\e[m\] "

# aliases that might be good to have
alias ls='ls -Al --color=auto'
alias grep='grep --color=auto'
