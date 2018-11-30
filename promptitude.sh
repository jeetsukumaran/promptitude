#! /bin/bash

# Promptitude
# -----------
#
# Configure/customize your BASH prompt.
#
# Source this file into your BASH session (". promptitude.sh") and then
# run:
#
#   $ promptitude --help
#
# for more information.
#
# Example usage:
#
#   $ promptitude --no-user-host \
#      --prompt-color darkcyan  \
#      --user-host-color black:darkcyan \
#      --venv-color black:green  \
#      --dir-color darkcyan \
#      --branch-color darkgreen \
#      --head-color darkgray  \
#      --status-color darkred \
#
#
# Default command-line options can be set using the environmental variable
# $PROMPTITUDE_DEFAULT_COMMAND.
#
# For example, the following line your "~/.bashrc":
#
#       export PROMPTITUDE_DEFAULT_COMMAND="--no-user-host --prompt-color darkcyan --user-host-color black:darkcyan --venv-color black:green --dir-color darkcyan --branch-color darkgreen --head-color darkgray --status-color darkred"
#
# will pass the listed options to the promptitude command the next time it is
# invoked.
#
# Copyright (c) 2011, Jeet Sukumaran. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     Redistributions of source code must retain the above copyright notice,
#     this list of conditions and the following disclaimer.  Redistributions in
#     binary form must reproduce the above copyright notice, this list of
#     conditions and the following disclaimer in the documentation and/or other
#     materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

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
        red)
            COLOR_CODE=$COLOR_CODE"0;31"
            ;;
        green)
            COLOR_CODE=$COLOR_CODE"0;32"
            ;;
        brown)
            COLOR_CODE=$COLOR_CODE"0;33"
            ;;
        orange)
            COLOR_CODE=$COLOR_CODE"0;33"
            ;;
        blue)
            COLOR_CODE=$COLOR_CODE"0;34"
            ;;
        purple)
            COLOR_CODE=$COLOR_CODE"0;35"
            ;;
        magenta)
            COLOR_CODE=$COLOR_CODE"0;35"
            ;;
        cyan)
            COLOR_CODE=$COLOR_CODE"0;36"
            ;;
        grey)
            COLOR_CODE=$COLOR_CODE"0;37"
            ;;
        darkgrey)
            COLOR_CODE=$COLOR_CODE"0;90"
            ;;
        lightred)
            COLOR_CODE=$COLOR_CODE"0;91"
            ;;
        lightgreen)
            COLOR_CODE=$COLOR_CODE"0;92"
            ;;
        yellow)
            COLOR_CODE=$COLOR_CODE"0;93"
            ;;
        lightblue)
            COLOR_CODE=$COLOR_CODE"0;94"
            ;;
        lightpurple)
            COLOR_CODE=$COLOR_CODE"0;95"
            ;;
        lightmagenta)
            COLOR_CODE=$COLOR_CODE"0;95"
            ;;
        turquoise)
            COLOR_CODE=$COLOR_CODE"0;96"
            ;;
        lightcyan)
            COLOR_CODE=$COLOR_CODE"0;96"
            ;;
        boldblack)
            COLOR_CODE=$COLOR_CODE"1;30"
            ;;
        boldred)
            COLOR_CODE=$COLOR_CODE"1;31"
            ;;
        boldgreen)
            COLOR_CODE=$COLOR_CODE"1;32"
            ;;
        boldbrown)
            COLOR_CODE=$COLOR_CODE"1;33"
            ;;
        boldorange)
            COLOR_CODE=$COLOR_CODE"1;33"
            ;;
        boldblue)
            COLOR_CODE=$COLOR_CODE"1;34"
            ;;
        boldpurple)
            COLOR_CODE=$COLOR_CODE"1;35"
            ;;
        boldmagenta)
            COLOR_CODE=$COLOR_CODE"1;35"
            ;;
        boldcyan)
            COLOR_CODE=$COLOR_CODE"1;36"
            ;;
        boldgrey)
            COLOR_CODE=$COLOR_CODE"1;37"
            ;;
        bolddarkgrey)
            COLOR_CODE=$COLOR_CODE"1;90"
            ;;
        boldlightred)
            COLOR_CODE=$COLOR_CODE"1;91"
            ;;
        boldlightgreen)
            COLOR_CODE=$COLOR_CODE"1;92"
            ;;
        boldyellow)
            COLOR_CODE=$COLOR_CODE"1;93"
            ;;
        boldlightblue)
            COLOR_CODE=$COLOR_CODE"1;94"
            ;;
        boldlightpurple)
            COLOR_CODE=$COLOR_CODE"1;95"
            ;;
        boldlightmagenta)
            COLOR_CODE=$COLOR_CODE"1;95"
            ;;
        boldturquoise)
            COLOR_CODE=$COLOR_CODE"1;96"
            ;;
        boldlightcyan)
            COLOR_CODE=$COLOR_CODE"1;96"
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
        red)
            COLOR_CODE=$COLOR_CODE";41"
            ;;
        green)
            COLOR_CODE=$COLOR_CODE";42"
            ;;
        brown)
            COLOR_CODE=$COLOR_CODE";43"
            ;;
        orange)
            COLOR_CODE=$COLOR_CODE";43"
            ;;
        blue)
            COLOR_CODE=$COLOR_CODE";44"
            ;;
        purple)
            COLOR_CODE=$COLOR_CODE";45"
            ;;
        magenta)
            COLOR_CODE=$COLOR_CODE";45"
            ;;
        cyan)
            COLOR_CODE=$COLOR_CODE";46"
            ;;
        grey)
            COLOR_CODE=$COLOR_CODE";47"
            ;;
        darkgrey)
            COLOR_CODE=$COLOR_CODE";100"
            ;;
        lightred)
            COLOR_CODE=$COLOR_CODE";101"
            ;;
        lightgreen)
            COLOR_CODE=$COLOR_CODE";102"
            ;;
        yellow)
            COLOR_CODE=$COLOR_CODE";103"
            ;;
        lightblue)
            COLOR_CODE=$COLOR_CODE";104"
            ;;
        lightblue)
            COLOR_CODE=$COLOR_CODE";104"
            ;;
        lightpurple)
            COLOR_CODE=$COLOR_CODE";105"
            ;;
        lightmagenta)
            COLOR_CODE=$COLOR_CODE";105"
            ;;
        turquoise)
            COLOR_CODE=$COLOR_CODE";106"
            ;;
        lightcyan)
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

function _print_virtualenv_long_info() {
    local venv=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[venv:$venv]"
}

function _print_virtualenv_short_info() {
    local venv=""
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[venv:$venv]"
}

function promptitude() {

    # display indicators
    local PREFIX_NEWLINE=true
    local POSTFIX_NEWLINE=false
    local SHOW_SHELL_LEVEL=true
    local SHOW_VENV=1
    local SHOW_USERHOST=true
    local SHOW_DIRECTORY=1
    local SHOW_GIT=true
    local SHOW_BASIC=false
    local PREFIX_LABEL=""

    # set up color codes
    local CLEAR=$(_promptitude_get_color_code clear)
    local STY_COLOR=""
    local VENV_COLOR=""
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
        --prefix-newline)
            prefix_NEWLINE=true
            shift
            ;;
        --no-prefix-newline)
            PREFIX_NEWLINE=false
            shift
            ;;
        --postfix-newline)
            POSTFIX_NEWLINE=true
            shift
            ;;
        --no-postfix-newline)
            POSTFIX_NEWLINE=false
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
        --show-long-venv)
            SHOW_VENV=2
            shift
            ;;
        --prefix-label)
            shift
            PREFIX_LABEL=$1
            shift
            ;;
        --no-prefix-label)
            PREFIX_LABEL=""
            shift
            ;;
        --show-short-venv)
            SHOW_VENV=1
            shift
            ;;
        --no-venv)
            SHOW_VENV=0
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
        --venv-color)
            VENV_COLOR=$(_promptitude_get_color_code $(echo $2 | awk -F: '{print $1" "$2" "$3}'))
            if [[ $? != 0 ]]
            then
                echo $VENV_COLOR
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
            echo "  --no-prefix-newline       ... do not add a newline before prompt"
            echo "  --prefix-newline          ... add a newline before prompt"
            echo "  --no-postfix-newline      ... do not add a newline after prompt"
            echo "  --postfix-newline         ... add a newline after prompt"
            echo "  --no-shell-level          ... do not show shell nesting level"
            echo "  --show-shell-level        ... show shell nesting level"
            echo "  --no-user-host            ... do not show user and hostname"
            echo "  --show-user-host          ... show user and hostname"
            echo "  --no-dir                  ... do not show current directory"
            echo "  --show-short-dir          ... show current directory (short path)"
            echo "  --show-long-dir           ... show current directory (full path)"
            echo "  --no-venv                 ... do not show Python virtual environment status"
            echo "  --show-short-venv         ... show path to Python virtual environment (short path)"
            echo "  --show-long-venv          ... show path to Python virtual environment (long path)"
            echo "  --no-git                  ... do not show git branch, head and status"
            echo "  --show-git                ... show git branch, head and status"
            echo "  --none                    ... minimal prompt (no info)"
            echo " "
            echo "Color Options (see '--help-colors' for how to specify colors):"
            echo "  --prompt-color <COLOR>    ... base prompt color"
            echo "  --user-host-color <COLOR> ... user and hostname color"
            echo "  --dir-color <COLOR>       ... directory color"
            echo "  --venv-color <COLOR>      ... Python virtual environment color"
            echo "  --branch-color <COLOR>    ... branch name color"
            echo "  --head-color <COLOR>      ... current revision/commit ID color"
            echo "  --status-color <COLOR>    ... repository status color"
            echo "  --help-colors             ... more help on color specification"
            return
            ;;
        --help-colors)
            echo "Colors are specified with the following syntax: "
            echo " "
            echo "   <foreground FGCOLOR>[:background BGCOLOR][:ATTRIBUTE] "
            echo " "
            echo "Where FGCOLOR can be one of: "
            echo " "
            echo "   - black            - boldblack"
            echo "   - red              - boldred"
            echo "   - green            - boldgreen"
            echo "   - orange           - boldorange"
            echo "   - blue             - boldblue"
            echo "   - purple           - boldpurpl"
            echo "   - cyan             - boldcyan"
            echo "   - grey             - boldgrey"
            echo "   - darkgrey         - bolddarkgrey"
            echo "   - lightred         - boldlightred"
            echo "   - lightgreen       - boldlightgreen"
            echo "   - yellow           - boldyellow"
            echo "   - lightblue        - boldlightblue"
            echo "   - lightpurple      - boldlightpurple"
            echo "   - turquoise        - boldturquoise"
            echo "   - white"
            echo " "
            echo "And BGCOLOR can be one of: "
            echo " "
            echo "   - black            - darkgrey"
            echo "   - red              - lightred"
            echo "   - green            - lightgreen"
            echo "   - orange           - yellow"
            echo "   - blue             - lightblue"
            echo "   - purple           - lightpurple"
            echo "   - cyan             - turquoise"
            echo "   - grey             - white"
            echo " "
            echo "And ATTRIBUTE can be one of: "
            echo " "
            echo "   - underline       - reverse"
            echo " "
            echo "Examples: "
            echo
            echo "    --prompt-color blue                     [blue on normal background]"
            echo "    --user-host-color green:white           [dark green on white background]"
            echo "    --dir-color blue:underline              [underlined blue on normal background]"
            echo "    --branch-color cyan:black:underline     [underlined cyan on black background]"
            echo "    --status-color white:red                [white on dark red background]"
            echo "    --dir-color blue:white                  [dark blue on white background]"
            echo
            echo "In use: "
            echo " "
            echo "    promptitude --prompt-color cyan \\"
            echo "                --user-host-color black:cyan \\"
            echo "                --dir-color cyan \\"
            echo "                --venv-color black:green \\"
            echo "                --branch-color green \\"
            echo "                --head-color gray \\"
            echo "                --status-color red"
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
            if [[ $SHPARENT == ?vim* ]]
            then
                # only minimally report the shell level if inside a gvim/mvim split
                local SHLVLTAG="$SHLVL_COLOR*$CLEAR"
            else
                local SHLVLTAG="$SHLVL_COLOR[$SHPARENT:$SHELL_NESTING_LEVEL]$CLEAR"
            fi
        else # not in a subshell
            local SHLVLTAG=""
        fi
    fi

    # indicate virtual environment
    if [[ $SHOW_VENV == 2 ]]
    then
        local VENVTAG="$VENV_COLOR\$(_print_virtualenv_long_info)$CLEAR"
        export VIRTUAL_ENV_DISABLE_PROMPT=1
    elif  [[ $SHOW_VENV == 1 ]]
    then
        local VENVTAG="$VENV_COLOR\$(_print_virtualenv_short_info)$CLEAR"
        export VIRTUAL_ENV_DISABLE_PROMPT=1
    else
        export VIRTUAL_ENV_DISABLE_PROMPT=0
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

    # add a newline
    if [[ $PREFIX_NEWLINE == true ]]
    then
        local PREFIX_NEWLINE="\n"
    else
        local PREFIX_NEWLINE=""
    fi

    # add a newline
    if [[ $POSTFIX_NEWLINE == true ]]
    then
        local POSTFIX_NEWLINE="\n"
    else
        local POSTFIX_NEWLINE=""
    fi

    # final
    if [[ -z $PROMPTSTR ]]
    then
        PROMPTSTR="${PREFIX_NEWLINE}${POSTFIX_NEWLINE}\$ "
    else
        PROMPTSTR="${PREFIX_NEWLINE}$CLEAR$SHLVLTAG$PREFIX_LABEL$VENVTAG${PROMPT_COLOR}[$CLEAR$PROMPTSTR$PROMPT_COLOR]${WRAP}${WHICHPYTHON}${CLEAR}${POSTFIX_NEWLINE}${PROMPT_COLOR}\$${CLEAR} "
    fi

    # Set.
    PS1=$PROMPTSTR
    PS2='> '
    PS4='+ '
}


