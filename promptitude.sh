#! /bin/bash

# Configure/customize your BASH prompt.
#
# Source this file into your BASH session (". promptitude.sh") and then
# run "promptitude --help" for more information.
#
# Default command-line options can be set using the environmental variable
# $PROMPTITUDE_DEFAULT_COMMAND.

function _promptitude_get_color_code() {
    if [[ -z $1 ]]
    then
        echo "color specification missing: '<foreground>[:background][:attribute]'"
        return -1
    fi
    local COLOR_CODE=""
    case $1 in
        clear)
            echo "\[\033[0m\]"
            return
            ;;
        black)
            COLOR_CODE=$COLOR_CODE"0;30"
            ;;
        darkred)
            COLOR_CODE=$COLOR_CODE"0;31"
            ;;
        darkgreen)
            COLOR_CODE=$COLOR_CODE"0;32"
            ;;
        brown)
            COLOR_CODE=$COLOR_CODE"0;33"
            ;;
        darkyellow)
            COLOR_CODE=$COLOR_CODE"0;33"
            ;;
        darkblue)
            COLOR_CODE=$COLOR_CODE"0;34"
            ;;
        darkmagenta)
            COLOR_CODE=$COLOR_CODE"0;35"
            ;;
        darkcyan)
            COLOR_CODE=$COLOR_CODE"0;36"
            ;;
        lightgray)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        lightgrey)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        grey)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        gray)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        lightgrey)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        darkgray)
            COLOR_CODE=$COLOR_CODE"1;30"
            ;;
        darkgrey)
            COLOR_CODE=$COLOR_CODE"1;30"
            ;;
        lightred)
            COLOR_CODE=$COLOR_CODE"1;31"
            ;;
        red)
            COLOR_CODE=$COLOR_CODE"1;31"
            ;;
        lightgreen)
            COLOR_CODE=$COLOR_CODE"1;32"
            ;;
        green)
            COLOR_CODE=$COLOR_CODE"1;32"
            ;;
        yellow)
            COLOR_CODE=$COLOR_CODE"1;33"
            ;;
        lightyellow)
            COLOR_CODE=$COLOR_CODE"1;33"
            ;;
        lightblue)
            COLOR_CODE=$COLOR_CODE"1;34"
            ;;
        blue)
            COLOR_CODE=$COLOR_CODE"1;34"
            ;;
        lightmagenta)
            COLOR_CODE=$COLOR_CODE"1;35"
            ;;
        lightcyan)
            COLOR_CODE=$COLOR_CODE"1;36"
            ;;
        cyan)
            COLOR_CODE=$COLOR_CODE"1;36"
            ;;
        white)
            COLOR_CODE=$COLOR_CODE"1;37"
            ;;
        *)
            echo "invalid foreground color: '$1'"
            return -1
            ;;
    esac
    if [[ -z $2 ]]
    then
        echo '\[\033['$COLOR_CODE'm\]'
        return
    fi
    case $2 in
        black)
            COLOR_CODE=$COLOR_CODE";40"
            ;;
        darkred)
            COLOR_CODE=$COLOR_CODE";41"
            ;;
        darkgreen)
            COLOR_CODE=$COLOR_CODE";42"
            ;;
        brown)
            COLOR_CODE=$COLOR_CODE";43"
            ;;
        darkyellow)
            COLOR_CODE=$COLOR_CODE";43"
            ;;
        darkblue)
            COLOR_CODE=$COLOR_CODE";44"
            ;;
        darkmagenta)
            COLOR_CODE=$COLOR_CODE";45"
            ;;
        darkcyan)
            COLOR_CODE=$COLOR_CODE";46"
            ;;
        lightgray)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        lightgrey)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        grey)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        gray)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        lightgrey)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        darkgray)
            COLOR_CODE=$COLOR_CODE";100"
            ;;
        darkgrey)
            COLOR_CODE=$COLOR_CODE";100"
            ;;
        lightred)
            COLOR_CODE=$COLOR_CODE";101"
            ;;
        red)
            COLOR_CODE=$COLOR_CODE";101"
            ;;
        lightgreen)
            COLOR_CODE=$COLOR_CODE";102"
            ;;
        green)
            COLOR_CODE=$COLOR_CODE";102"
            ;;
        yellow)
            COLOR_CODE=$COLOR_CODE";103"
            ;;
        lightyellow)
            COLOR_CODE=$COLOR_CODE";103"
            ;;
        lightblue)
            COLOR_CODE=$COLOR_CODE";104"
            ;;
        blue)
            COLOR_CODE=$COLOR_CODE";104"
            ;;
        lightmagenta)
            COLOR_CODE=$COLOR_CODE";105"
            ;;
        lightcyan)
            COLOR_CODE=$COLOR_CODE";106"
            ;;
        cyan)
            COLOR_CODE=$COLOR_CODE";106"
            ;;
        white)
            COLOR_CODE=$COLOR_CODE";107"
            ;;
        underline)
            COLOR_CODE="4;"$COLOR_CODE
            echo '\[\033['$COLOR_CODE'm\]'
            return
            ;;
        reverse)
            COLOR_CODE="7;"$COLOR_CODE
            echo '\[\033['$COLOR_CODE'm\]'
            return
            ;;
        *)
            echo "invalid background color: '$2'"
            return -1
            ;;
    esac
    if [[ -z $3 ]]
    then
        echo '\[\033['$COLOR_CODE'm\]'
        return
    fi
    case $3 in
        underline)
            COLOR_CODE="4;"$COLOR_CODE
            ;;
        reverse)
            COLOR_CODE="7;"$COLOR_CODE
            ;;
        *)
            echo "invalid attribute: '$3'"
            return -1
            ;;
    esac
    echo '\[\033['$COLOR_CODE'm\]'
}

function _print_git_info {
    GIT_BRANCH=""
    GIT_HEAD=""
    GIT_STATE=""
    GIT_LEADER=""
    local STATUS
    STATUS=$(git status 2> /dev/null)
    if [[ -z $STATUS ]]
    then
        return
    fi
    GIT_LEADER=":"
    GIT_BRANCH="$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    GIT_HEAD="$(git rev-parse --short HEAD 2> /dev/null)"
    if [[ "$STATUS" == *'working directory clean'* ]]
    then
        GIT_STATE=""
    else
        GIT_STATE=":"
        if [[ "$STATUS" == *'Changes to be committed:'* ]]
        then
            GIT_STATE=$GIT_STATE'+I' # Index has files staged for commit
        fi
        if [[ "$STATUS" == *'Changed but not updated:'* || "$STATUS" == *'Changes not staged for commit'* ]]
        then
            GIT_STATE=$GIT_STATE"+M" # Working tree has files modified but unstaged
        fi
        if [[ "$STATUS" == *'Untracked files:'* ]]
        then
            GIT_STATE=$GIT_STATE'+U' # Working tree has untracked files
        fi
    fi
    echo "$GIT_BRANCH%%%%$GIT_HEAD%%%%$GIT_STATE"
}

function _print_git_state_flags() {
    local state_flags=""
    if [[ $(git diff-index --quiet --cached HEAD) ]]
    then
        state_flags="$state_flags+I"
    fi
    if [[ $(git diff-files --stat) ]]
    then
        state_flags="$state_flags+M"
    fi
    if [[ $(git ls-files --exclude-standard --others) ]]
    then
        state_flags="$state_flags+U"
    fi
    if [[ -n $state_flags ]]
    then
        echo "$state_flags"
    fi
}

function promptitude() {

    # display indicators
    local SHOW_SHELL_LEVEL=true
    local SHOW_USERHOST=true
    local SHOW_DIRECTORY=1
    local SHOW_GIT=true
    local SHOW_BASIC=false

    # set up color codes
    local CLEAR=$(_promptitude_get_color_code clear)
    local STY_COLOR=""
    local SHLVL_COLOR=""
    local PROMPT_COLOR=""
    local USER_HOST_COLOR=""
    local DIR_COLOR=""
    local GIT_BRANCH_COLOR=""
    local GIT_HEAD_COLOR=""
    local GIT_STATE_COLOR=""

    # local STY_COLOR=$(_promptitude_get_color_code white darkgray)
    # local SHLVL_COLOR=$(_promptitude_get_color_code white darkgray)
    # local PROMPT_COLOR=$(_promptitude_get_color_code darkcyan)
    # local USER_HOST_COLOR=$(_promptitude_get_color_code black darkcyan)
    # local DIR_COLOR=$(_promptitude_get_color_code darkcyan)
    # local GIT_BRANCH_COLOR=$(_promptitude_get_color_code darkgreen)
    # local GIT_HEAD_COLOR=$(_promptitude_get_color_code darkgray)
    # local GIT_STATE_COLOR=$(_promptitude_get_color_code darkred)

    # if environmental variable PROMPTITUDE_DEFAULT_COMMAND
    # is given, add reset the positional arguments incorporating
    # it.
    if [ -n "$PROMPTITUDE_DEFAULT_COMMAND" ]
    then
        set $(echo "__NOOP__ $PROMPTITUDE_DEFAULT_COMMAND $@")
    fi

    while [ -n "$1" ]
    do
        case $1 in
        __NOOP__)
            shift
            ;;
        --show-shell-level)
            SHOW_SHELL_LEVEL=true
            shift
            ;;
        --no-shell-level)
            SHOW_SHELL_LEVEL=false
            shift
            ;;
        --show-user-host)
            SHOW_USERHOST=true
            shift
            ;;
        --no-user-host|--no-user)
            SHOW_USERHOST=false
            shift
            ;;
        --show-long-dir)
            SHOW_DIRECTORY=2
            shift
            ;;
        --show-short-dir)
            SHOW_DIRECTORY=1
            shift
            ;;
        --no-dir)
            SHOW_DIRECTORY=0
            shift
            ;;
        --show-git)
            SHOW_GIT=true
            shift
            ;;
        --no-git)
            SHOW_GIT=false
            shift
            ;;
        --basic|--none)
            SHOW_BASIC=true
            shift
            ;;
        --prompt-color)
            PROMPT_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $PROMPT_COLOR
                return -1
            fi
            shift 2
            ;;
        --user-host-color|--user-color)
            USER_HOST_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $USER_HOST_COLOR
                return -1
            fi
            shift 2
            ;;
        --dir-color)
            DIR_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $DIR_COLOR
                return -1
            fi
            shift 2
            ;;
        --branch-color|--vcs-branch-color|--git-branch-color)
            GIT_BRANCH_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $GIT_BRANCH_COLOR
                return -1
            fi
            shift 2
            ;;
        --head-color|--vcs-head-color|--git-head-color)
            GIT_HEAD_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $GIT_HEAD_COLOR
                return -1
            fi
            shift 2
            ;;
        --status-color|--vcs-status-color|--git-status-color)
            GIT_STATE_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $GIT_STATE_COLOR
                return -1
            fi
            shift 2
            ;;
        -h|--help)
            echo "promptitude [OPTIONS]"
            echo
            echo "Configure BASH prompt"
            echo " "
            echo "Information Options:"
            echo "  --no-shell-level          ... do not show shell nesting level"
            echo "  --show-shell-level        ... show shell nesting level"
            echo "  --no-user-host            ... do not show user and hostname"
            echo "  --show-user-host          ... show user and hostname"
            echo "  --no-dir                  ... do not show current directory"
            echo "  --show-short-dir          ... show current directory (short path)"
            echo "  --show-long-dir           ... show current directory (full path)"
            echo "  --no-git                  ... do not show git branch, head and status"
            echo "  --show-git                ... show git branch, head and status"
            echo "  --none                    ... minimal prompt (no info)"
            echo " "
            echo "Color Options (see '--help-colors' for how to specify colors):"
            echo "  --prompt-color <COLOR>    ... base prompt color"
            echo "  --user-host-color <COLOR> ... user and hostname color"
            echo "  --dir-color <COLOR>       ... directory color"
            echo "  --branch-color <COLOR>    ... branch name color"
            echo "  --head-color <COLOR>      ... current revision/commit ID color"
            echo "  --status-color <COLOR>    ... repository status color"
            echo "  --help-colors             ... more help on color specification"
            return
            ;;
        --help-colors)
            echo "Colors are specified with the following syntax: "
            echo " "
            echo "   <foreground COLOR>[:background COLOR][:ATTRIBUTE] "
            echo " "
            echo "Where COLOR can be one of: "
            echo " "
            echo "   - black           - grey"
            echo "   - darkred         - red"
            echo "   - darkgreen       - green"
            echo "   - darkyellow      - yellow"
            echo "   - darkblue        - blue"
            echo "   - darkmagenta     - magenta"
            echo "   - darkcyan        - cyan"
            echo "   - darkgrey        - white"
            echo " "
            echo "And ATTRIBUTE can be one of: "
            echo " "
            echo "   - underline       - reverse"
            echo " "
            echo "Examples: "
            echo
            echo "    --prompt-color blue                     [blue on normal background]"
            echo "    --user-host-color darkgreen:white       [dark green on white background]"
            echo "    --dir-color blue:underline              [underlined blue on normal background]"
            echo "    --branch-color cyan:black:underline     [underlined cyan on black background]"
            echo "    --status-color white:darkred            [white on dark red background]"
            echo "    --dir-color darkblue:white              [dark blue on white background]"
            echo
            echo "In use: "
            echo " "
            echo "    promptitude --prompt-color darkcyan \\"
            echo "                --user-host-color black:darkcyan \\"
            echo "                --dir-color darkcyan \\"
            echo "                --branch-color darkgreen \\"
            echo "                --head-color darkgray \\"
            echo "                --status-color darkred"
            return
            ;;
        *)
            if [[ -n $1 ]]
            then
                echo "Unrecognized option: '$1'"
                return -1
            fi
            break
            ;;
        esac
    done

    if [[ $SHOW_BASIC == true ]]
    then
        PS1="\$ "
        PS2='> '
        PS4='+ '
        return
    fi

    # special characters
    local SEP=":"

    # initialize
    local PROMPTSTR=""

    # indicate subshell
    if [[ $SHOW_SHELL_LEVEL == true ]]
    then
        local SHELL_NESTING_LEVEL=$(($SHLVL-1))
        if [[ -n $RUNNING_UNDER_VIM ]] # if running under Vi/Vim
        then
            local SHLVLTAG="$SHLVL_COLOR[vim:$SHELL_NESTING_LEVEL]$CLEAR"
        elif [[ -n "$STY" ]] # if screen session variable is defined
        then
            local SHLVLTAG="$STY_COLOR[SCR:${STY%%.*}]$CLEAR"
        elif [[ $SHLVL > 1 ]] # else if in any other subshell
        then
            local SHPARENT=$(ps -o command -p $PPID | tail -1)
            local SHLVLTAG="$SHLVL_COLOR[$SHPARENT:$SHELL_NESTING_LEVEL]$CLEAR"
        else # not in a subshell
            local SHLVLTAG=""
        fi
    fi

    # Set user@host.
    if [[ $SHOW_USERHOST == true ]]
    then
        if [[ $HOSTNAME != $PRIMARYHOST && $SUPERPROMPT_REMOTE_USERHOST_COLOR != "" ]]
        then
            # Hostname-based colors in prompt.
            USER_HOST_COLOR=$SUPERPROMPT_REMOTE_USERHOST_COLOR
        fi
        PROMPTSTR=$PROMPTSTR"$USER_HOST_COLOR\\u@\\h$CLEAR"
    fi

    # directory
    if [[ $SHOW_DIRECTORY > 0 ]]
    then
        if [[ -n $PROMPTSTR ]]
        then
            PROMPTSTR="$PROMPTSTR$PROMPT_COLOR:$CLEAR"
        fi
        PROMPTSTR=$PROMPTSTR"$PROMPT_COLOR"
        if [[ $SHOW_DIRECTORY == 1 ]]
        then
            PROMPTSTR=$PROMPTSTR"$DIR_COLOR\W$CLEAR"
        else
            PROMPTSTR=$PROMPTSTR"$DIR_COLOR\$(pwd -P)$CLEAR"
        fi
    fi

    # Git
    if [[ $SHOW_GIT == true && $(which git 2> /dev/null) ]]
    then
        # PROMPTSTR="$PROMPTSTR\$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/$PROMPT_COLOR$SEP$GIT_BRANCH_COLOR\1/')\$(git rev-parse --short HEAD 2> /dev/null | sed -e 's/^/$PROMPT_COLOR$SEP$GIT_HEAD_COLOR/')\$(_print_git_state_flags 2> /dev/null | sed -e 's/^/$PROMPT_COLOR$SEP$GIT_STATE_COLOR/')$CLEAR"
        # PROMPTSTR="${PROMPTSTR}\$(_print_git_info | sed -e 's/^\(.*\)%%%%\(.*\)%%%%\(.*\)$/$PROMPT_COLOR$SEP$GIT_BRANCH_COLOR\1$PROMPT_COLOR$SEP$GIT_HEAD_COLOR\2$PROMPT_COLOR$SEP$GIT_STATE_COLOR\3/')"
        # PROMPTSTR="${PROMPTSTR}\$(_print_git_info | sed -e 's/^\(.*\)%%%%\(.*\)%%%%\(.*\)$/$PROMPT_COLOR$SEP$GIT_BRANCH_COLOR\1$PROMPT_COLOR$SEP$GIT_HEAD_COLOR\2$GIT_STATE_COLOR\3/')"
        PROMPTSTR="${PROMPTSTR}\$(_print_git_info | sed -e 's/^\(.*\)%%%%\(.*\)%%%%\(:\)*\(.*\)$/$PROMPT_COLOR$SEP$GIT_BRANCH_COLOR\1$PROMPT_COLOR$SEP$GIT_HEAD_COLOR\2$PROMPT_COLOR\3$GIT_STATE_COLOR\4/')"
    fi

    # final
    if [[ -z $PROMPTSTR ]]
    then
        PROMPTSTR="\$ "
    else
        PROMPTSTR="\n$CLEAR$SHLVLTAG${PROMPT_COLOR}[$CLEAR$PROMPTSTR$PROMPT_COLOR]$WRAP$WHICHPYTHON$PROMPT_COLOR\$$CLEAR "
    fi

    # Set.
    PS1=$PROMPTSTR
    PS2='> '
    PS4='+ '
}


