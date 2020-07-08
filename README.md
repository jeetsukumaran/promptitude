
# Promptitude

A shell prompt with an attitude: enhanced (BASH) shell prompt with VCS (Git) branch and status information.

Sha-dazzle up or Sha-dazzle down your prompt, dynamically!

Add color, Git status, shell-level, Python environment info, etc., as needed and when needed.

## Installation

### Quick Reference

Source the file `promptitude.sh` in your `~/.bashrc` and execute the ``promptitude`` function with appropriate arguments.

### Step-By-Step

1.  Clone this repository somewhere fairly stable on your system.

~~~
$ mkdir -p ~/.local/opt
$ cd ~/local/opt
$ git clone https://github.com/jeetsukumaran/promptitude.git
~~~

2.  Edit your ``~/.bashrc`` file and add the following lines at the end of the file:

~~~
source ~/local/opt/promptitude/promptitude.sh
export PROMPTITUDE_DEFAULT_COMMAND="
    --prompt-color turquoise \
    --no-user-host
    --user-host-color black:grey \
    --venv-color black:cyan \
    --dir-color turquoise \
    --branch-color boldgreen \
    --head-color grey \
    --status-color boldlightred"
promptitude
~~~

3.  And that's it. You should have an awesome prompt with attitude for all your subsequent shell sessions. You can pass the ``promptitude`` command alternative arguments/options to customize the prompt, as per the options below.


## All Options

~~~
promptitude [OPTIONS]

Configure BASH prompt

Information Options:
  --no-prefix-newline       ... do not add a newline before prompt
  --prefix-newline          ... add a newline before prompt
  --no-postfix-newline      ... do not add a newline after prompt
  --postfix-newline         ... add a newline after prompt
  --no-shell-level          ... do not show shell nesting level
  --show-shell-level        ... show shell nesting level
  --no-user-host            ... do not show user and hostname
  --show-user-host          ... show user and hostname
  --no-dir                  ... do not show current directory
  --show-short-dir          ... show current directory (short path)
  --show-long-dir           ... show current directory (full path)
  --no-venv                 ... do not show Python virtual environment status
  --show-short-venv         ... show path to Python virtual environment (short path)
  --show-long-venv          ... show path to Python virtual environment (long path)
  --no-git                  ... do not show git branch, head and status
  --show-git                ... show git branch, head and status
  --none                    ... minimal prompt (no info)

Color Options (see '--help-colors' for how to specify colors):
  --prompt-color <COLOR>    ... base prompt color
  --user-host-color <COLOR> ... user and hostname color
  --dir-color <COLOR>       ... directory color
  --venv-color <COLOR>      ... Python virtual environment color
  --branch-color <COLOR>    ... branch name color
  --head-color <COLOR>      ... current revision/commit ID color
  --status-color <COLOR>    ... repository status color
  --help-colors             ... more help on color specification
~~~

## Example Usage

(Note that the colors are not shown in this document; but like that extra-cheese on your online pizza order, it is going to be there when it shows up at your door!)
~~~
$ promptitude --no-user-host \
      --prompt-color cyan  \
      --user-host-color black:cyan \
      --venv-color black:green  \
      --dir-color cyan \
      --branch-color green \
      --head-color gray  \
      --status-color red \

[Syrupy:master:911f6d8]$ promptitude --no-git

[Syrupy]$ promptitude --show-git

[Syrupy:master:911f6d8]$ promptitude --show-long-dir --show-user-host --postfix-newline

[jeet@mongoose:/Users/jeet/Documents/Projects/Utilities/Syrupy:master:911f6d8]
$
~~~

## Setup a Default Prompt

Default command-line options can be set using the environmental variable `$PROMPTITUDE_DEFAULT_COMMAND`.

For example, the following line your "~/.bashrc":
~~~
export PROMPTITUDE_DEFAULT_COMMAND="--no-user-host --prompt-color cyan --user-host-color black:cyan --venv-color black:green --dir-color cyan --branch-color green --head-color gray --status-color red"
~~~

will pass the listed options to the promptitude command the next time it is
invoked.

