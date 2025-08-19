# a separate .bashrc for fpkg's shell ('fpkg goto'), change it
# if you want :)

# colored $PS1 to make it pretty, see
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR
# for possible colors to use here
export PS1="\[\e[01;33m\](fpkg) \e[01;37m\]\W \e[01;34m\]\$\e[00m\] "

# aliases that might be good to have
alias ls='ls -Al --color=auto'
alias grep='grep --color=auto'
