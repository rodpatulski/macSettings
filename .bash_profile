#export PS1="\e[1;32m\w> \e[m"

# Regular Colors
BLACK='\e[0;30m'        # Black
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[0;35m'       # Purple
CYAN='\e[0;36m'         # Cyan
WHITE='\e[0;37m'        # White

export PS1="\[$GREEN\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$BLUE\]\$(__git_ps1)\$\e[m"
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
#rednose plugin for running python nosetests with color highlighting
export NOSE_REDNOSE=1 

BREW_PREFIX=`brew --prefix`
export PATH=~/bin:$BREW_PREFIX/share/python:$BREW_PREFIX/bin/:$BREW_PREFIX/sbin:$PATH
export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages:$PYTHONPATH

export ANDROID_HOME="/Users/rpatulski/repos/android-sdk-macosx"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#if the git completion file exists, then load it in 
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
#fancy information about git repos in the prompt
source ~/.git-prompt.sh
alias ll='ls -la'
alias h='history'
alias gocode='cd ~/repos/compass-master'
alias goroot='cd $(git rev-parse --show-cdup)'
alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1'

devbox=172.17.41.20

# setup for virtualenvwrapper for python
export WORKON_HOME=$HOME/Envs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

#iterm2 shell intergation
source ~/.iterm2_shell_integration.`basename $SHELL`

function hhg(){
    h | grep -i $1
}

function llg(){
    ll | grep -i $1
}

function reload(){
    . ~/.bashrc
}

function conn(){
    ssh "rod"@$devbox
}

fn() {
  find . -name "$1" -print
}

function remote(){
    ssh "onpeak\\rppatulski"@$1
}

function nos(){
	nosetests $1 --verbose --rednose $2 --logging-filter=-selenium,-requests
}



test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NVM_DIR="/Users/rpatulski/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/opt/freetds@0.91/bin:$PATH"
export PATH="/usr/local/opt/freetds@0.91/bin:$PATH"
