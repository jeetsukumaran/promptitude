# promptitude

A shell prompt with an attitude: enhanced (BASH) shell prompt with VCS (Git) branch and status information. 

Sha-dazzle up or Sha-dazzle down your prompt, dynamically!

Add color, Git status, shell-level, Python environment info, etc., as needed and when needed.

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
