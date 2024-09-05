#File: ~/.config/git/git-prompt.sh
# Custom prompt settings
PROMPT_DIRTRIM=4                         # Shorten deep paths in the prompt
PS1='\[\033]0;\W | Git Bash v\v \007\]' # set window title
PS1="$PS1"'\n'                           # new line
#PS1="$PS1"'\[\033[30;45m\] [\A] '        # black text, magenta, 24h time
#PS1="$PS1"'\[\033[30;42m\] \u '          # black text, green, user
PS1="$PS1"'\[\033[1;32m\]\u'          
PS1="$PS1"'\[\033[1;32m\]@\h:'          # black text, green, @host
PS1="$PS1"'\[\033[1;34m\]\w'          # black text, yellow, working director
if test -z "$WINELOADERNOEXEC"
then
    GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
    COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
    COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
    COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
    if test -f "$COMPLETION_PATH/git-prompt.sh"
    then
        . "$COMPLETION_PATH/git-completion.bash"
        . "$COMPLETION_PATH/git-prompt.sh"
        PS1="$PS1"'\[\033[1;36m\]'  # white text, cyan
        PS1="$PS1"'`__git_ps1`'      # bash function
    fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
#PS1="$PS1"'\n'                 # new line
PS1="$PS1"'$ '                 # prompt: always $

# Git status options
# Shows * or + for unstaged and staged changes, respectively.
export GIT_PS1_SHOWSTASHSTATE=false

# shows $ if there are any stashes.
export GIT_PS1_SHOWDIRTYSTATE=true

# Shows % if there are any untracked files.
export GIT_PS1_SHOWUNTRACKEDFILES=false

# shows <, >, <>, or = when your branch is behind, ahead, diverged from,
# or in sync with the upstream branch, respectively.
export GIT_PS1_SHOWUPSTREAM="auto"
