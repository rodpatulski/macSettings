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

# environment variables
export PS1="\[$GREEN\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$BLUE\]\$(__git_ps1)\$\e[m"
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
#rednose plugin for running python nosetests with color highlighting
export NOSE_REDNOSE=1 

BREW_PREFIX=`brew --prefix`
export PATH=~/bin:$BREW_PREFIX/share/python:$BREW_PREFIX/bin/:$BREW_PREFIX/sbin:$PATH
export PYTHONPATH=$BREW_PREFIX/lib/python2.7/site-packages:$PYTHONPATH

export ANDROID_HOME="/Users/rpatulski/Library/Android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export NVM_DIR="/Users/rpatulski/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/freetds@0.91/bin:$PATH"
export PATH="/usr/local/opt/freetds@0.91/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
#for locally installed node packages
#export PATH="$PATH:./node_modules/.bin/"

#this was part of my old bash_profile but I think the 'brew' way below is better
#if the git completion file exists, then load it in 
#if [ -f ~/.git-completion.bash ]; then
#  . ~/.git-completion.bash
#fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#ALIASES

#quickly move up directories by typing 'cd...'
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."


#fancy information about git repos in the prompt
source ~/.git-prompt.sh
alias ll='ls -la'
alias h='history'
alias gocode='cd ~/repos/compass-master'
alias goace='cd ~/repos/personal/ionic/quiz_ionic'
alias gopersonal='cd ~/repos/personal'
alias goroot='cd $(git rev-parse --show-cdup)'
alias go='git checkout' 
alias get='git'
alias got='git'
alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1'
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }          # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }      # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }      # ffe:      Find file whose name ends with a given string
ffm () { /usr/bin/find . -name '*'"$@"'*' ; }   # ffe:      Find file whose name is in the middle of a given string


devbox=172.17.41.20

# setup for virtualenvwrapper for python
export WORKON_HOME=$HOME/Envs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh


function hhg(){
    h | grep -i $1
}

function llg(){
    if [ "$2" = "" ]; then
    	#greps the current directory for a string
        ll | grep -i $1
    else
    	# greps a particular directory listing for a string
        ll $1| grep -i $2
    fi
}

# greps local branches
function bbg(){
    git branch | grep -i $1
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


#iterm2 shell intergation
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
