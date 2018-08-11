################################################################################
##### Set bash prompt ##########################################################
# Below line changes the bash prompt to be colorized using ANSI escape codes.
# And rearranges the prompt to be <username@hostname:cwd $>
# Bash backslash escape sequences can be found at bash(1) man page's <PROMPTING> section
# Time string format for <\D> escape character is at strftime(3) man page
################################################################################
function _prompting() {
    _GIT_BRANCH_NAME="$(git branch --show-current 2> /dev/null)"
    if [ $? -ne 0 ]; then
        _GIT_BRANCH_NAME=''
    fi

    # Print colorized prompt using ANSI color code.
    # below prints: <date> <time> <user>@<host>:<current path> [git branch] $
    #export PS1="\D{%m/%d %H:%M:%S} \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \[\033[31;1m\]${_GIT_BRANCH_NAME}\[\033[m\]\n\$ "
    # below prints: <date> <time> <user>:<current path> [git branch] $
    export PS1="\D{%m/%d %H:%M:%S} \[\033[36m\]\u\[\033[m\]:\[\033[34;1m\]\w\[\033[m\] \[\033[31;1m\]${_GIT_BRANCH_NAME}\[\033[m\]\n\$ "
}
PROMPT_COMMAND=_prompting
# Below print last return value for every prompting
#export PS1="\$? > "


################################################################################
##### Set PATH #################################################################
################################################################################
export PATH=${HOME}/local/bin:${HOME}/.local/bin:${PATH}



################################################################################
##### Set locales ##############################################################
################################################################################
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


################################################################################
##### Set ls command alias #####################################################
# -h option makes sizes human-readable
# -F option throws a / after a directory, * after an executable, and @ after a symlink
# -a option includes entries whose names begin with dot(.)
# -i option prints inode number
# -l option enables long format list
# -t option sorts by modified time (most recently modified first)
# -S option sorts by size
# -r option reverse the order of the sort (default order is lexicographical)
################################################################################
if [[ $(command -v lsd) ]]; then
    LS_COMMAND="lsd"
else
    [[ $OSTYPE == *'darwin'* ]] \
        && LS_COMMAND="ls --color" \
        || LS_COMMAND="ls --color=auto"
fi
alias ls="${LS_COMMAND}"
if [[ $OSTYPE == *'darwin'* ]]; then
    alias ll='ls -lhF'
    alias lt='ls -lhtr'
    alias la='ls -alhF'
    alias lta='ls -alhtr'
else
    alias ll='ls -lhF'
    alias lt='ls -lhtr'
    alias la='ls -alhF'
    alias lta='ls -alhtr'
fi


################################################################################
##### Configurations for fzf ###################################################
################################################################################
export FZF_DEFAULT_OPTS='--height 50% --border'


################################################################################
##### Set aliases ##############################################################
################################################################################
#alias connmyec2='ssh -p <port> <my-username>@<myec2-host>'
[[ $(which bat) ]] && alias cat='bat' || alias cat='cat'
alias fcd='cd $(DIR=$(find . -type d -not -path "*/.git/*" -not -path "*/.venv/*" -not -path "*/.pycache/*" | fzf); [[ -z ${DIR} ]] && echo "." || echo "${DIR}")'
alias fps='ps -ef | fzf'
alias ssh='ssh -o StrictHostKeyChecking=no -t'
alias vi='vim'
alias fvim='vim $(find . -type f -not -path "*/.git/* -not -path "*/.venv/*/* -not -path "*/.pycache/*" | fzf)'
alias glog='git log --graph --abbrev-commit --decorate --oneline --all'
alias gfb='BRANCH=$(git branch --format="%(refname:short)" | fzf) && git checkout ${BRANCH}'


################################################################################
##### Auto Enabling SSH Agent ##################################################
################################################################################
if [ -f ${HOME}/.ssh-agent.sh ]; then
    . ~/.ssh-agent.sh
fi
if [ -z $SSH_AUTH_SOCK ] || [ ! -S $SSH_AUTH_SOCK ]; then
    # Run ssh-agent for 86400 seconds (24 hours)
    ssh-agent -t 86400 > ${HOME}/.ssh-agent.sh
    echo "No agent! ssh-agent started."
    source ${HOME}/.ssh-agent.sh
fi


################################################################################
##### Enable direnv hook into shell ############################################
################################################################################
eval "$(direnv hook bash)"


################################################################################
##### Enable nvm ###############################################################
################################################################################
if [ -d "${HOME}/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi


################################################################################
##### Miscellaneous ############################################################
################################################################################
export EDITOR=vim
export TERM=xterm
# 5 times of "CTRL+D" will be ignored, and next one actually quits bash shell.
export IGNOREEOF=5

function f() {
    local FIND_PATH=${1:-.}
    find ${FIND_PATH} -not -path "*/.git/*" -not -path "*/.venv/*" -not -path "*/.pycache/*"
}

function ff() {
    local FIND_PATH=${1:-.}
    find ${FIND_PATH} -not -path "*/.git/*" -not -path "*/.venv/*" -not -path "*/.pycache/*" | fzf
}

# Set GPG_TTY Environment Variable to sign using GPG when try git commit.
export GPG_TTY=$(tty)
