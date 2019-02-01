# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
export HISTFILESIZE=5000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

source ~/.bash_prompt

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [[ -f "~/.ssh/config" ]]; then
  function _ssh_completion() {
    perl -ne 'print "$1 " if /^[Hh]ost (.+)$/' ~/.ssh/config
  }

  complete -W "$(_ssh_completion)" ssh
fi

# Override prompts if we're in a screen
#if [[ "$TERM" == screen* ]]; then
if [[ -v STY ]]; then
  . ~/.bashrc_screen
else
  if [[ "$SSH_CLIENT"  == "" ]]; then
    screen
    stty -ixon
    echo ""
  fi
fi

set -o vi

export EDITOR=vim
export PATH=~/bin:/usr/local/bin:/usr/local/bin:$PATH:/usr/local/sbin:/home/joe/bin/packer:~/node_modules/elm/binwrappers:~/node_modules/elm-format/bin

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
eval "$(rbenv init -)"

export OPENSCADPATH=~/code/scadlibs/MCAD/:~/code/scadlibs/missile/:~/code/scadlibs/alpha/:~/code/scadlibs/misc:~/code/scadlibs/Write:~/code/scadlibs/scad-utils:~/code/mechanical_parts/

# this tricks my binstubs into using docker compose
export VIM_USE_DOCKER='yes'


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

