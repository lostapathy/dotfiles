# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth
export HISTFILESIZE=50000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

source ~/.bash_prompt

if [ -f ~/.aliases ]; then
  source ~/.aliases
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

# Personal bash completions
. ~/.bash_completion

if [[ -f "~/.ssh/config" ]]; then
  function _ssh_completion() {
    perl -ne 'print "$1 " if /^[Hh]ost (.+)$/' ~/.ssh/config
  }

  complete -W "$(_ssh_completion)" ssh
fi

# Override prompts if we're in a screen
#if [[ "$TERM" == screen* ]]; then
if [[ -v STY || -v TMUX ]]; then
  . ~/.bashrc_screen
else
  if [[ "$SSH_CLIENT"  == "" ]]; then
    screen
    stty -ixon
    echo ""
  fi
fi

set -o vi

export MANPATH=:~/code/dotfiles/lib/man
export EDITOR=vim
export PATH=~/bin:/usr/local/bin:/usr/local/bin:$PATH:/usr/local/sbin
export TS_MAXFINISHED=5 # limit how many finished tasks ts/tsp shows
export TS_SAVELIST=$HOME/ts.savelist

export OPENSCADPATH=~/code/scadlibs/MCAD/:~/code/scadlibs/missile/:~/code/scadlibs/alpha/:~/code/scadlibs/misc:~/code/scadlibs/Write:~/code/scadlibs/scad-utils:~/code/mechanical_parts/

# this tricks my binstubs into using docker compose
export VIM_USE_DOCKER='yes'

function man {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[45;93m' \
  LESS_TERMCAP_se=$'\e[0m' \
  command man $* || MANPATH=`find ~/.asdf/ -type d -name man -printf %p:` command man $*
}

function repeat() {
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}

function drg() {
  rg $@ ~/Dropbox/vimwiki/ ~/Dropbox/Documents/task-notes/ ~/code/notes.lostapathy.com/ ~/code/docs.lostapathy.com/
}

function cheat() {
  curl -s https://cht.sh/$1
}

function m() {
  rake test TEST=$@
}

function pushz() {
  pushd $(z -e $@)
}

if [ -f $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi

if [ -f $HOME/.asdf/completions/asdf.bash ]; then
  . $HOME/.asdf/completions/asdf.bash
fi

if [ -f $HOME/.asdf/installs/fzf/0.25.0/shell/key-bindings.bash ]; then
  . $HOME/.asdf/installs/fzf/0.25.0/shell/key-bindings.bash
fi

. $HOME/code/dotfiles/lib/z.sh

# Tell rg where it's config lives
export RIPGREP_CONFIG_PATH=~/.ripgreprc
