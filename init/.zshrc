#!/bin/zsh

# -------------------------------------------------------------------------------------------------------------------------------------
# Oh-My-Zsh
# -------------------------------------------------------------------------------------------------------------------------------------
ZSH=$HOME/.zsh/lib/oh-my-zsh                          ## Path to your oh-my-zsh configuration.
plugins=(command-not-found compleat extract gem git git-flow history-substring-search lol perl ssh-agent sublime)
DISABLE_AUTO_UPDATE="true"                            ## Disable annoying weekly auto-update checks
COMPLETION_WAITING_DOTS="true"                        ## Red dots to be displayed while waiting for completion
source $ZSH/oh-my-zsh.sh                              ## Source it, duh.

# -------------------------------------------------------------------------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------------------------------------------------------------------------
source $HOME/.zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/lib/zsh-clipboard/zsh-clipboard.zsh

# Git Prompt -- https://github.com/jcorbin/zsh-git/blob/master/zshrc
source $HOME/.zsh/lib/zsh-prompt/prompt-setup-old
#source $HOME/.zsh/lib/zsh-liquidprompt/liquidprompt

# Tmux powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Midnight commander
export MC_SKIN=$HOME/.mc/lib/mc-solarized/solarized.ini
export MC_KEYMAP=$HOME/.mc/config/etc/mc.keymap

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# -------------------------------------------------------------------------------------------------------------------------------------
# Shell Configuration
# -------------------------------------------------------------------------------------------------------------------------------------
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# 256 bit colors (primarily for midnight commander)
# Find all possible options with `find /lib/terminfo /usr/share/terminfo -name "*256*"`
export TERM=xterm-256color
export XTERM=xterm-256color
export XDG_CONFIG_HOME=$HOME/.config

## Export basic editor
export EDITOR="subl -n"

# -------------------------------------------------------------------------------------------------------------------------------------
# Paths for zsh
# -------------------------------------------------------------------------------------------------------------------------------------
# Zsh Configuration
for configFile in $HOME/.zsh/config/*; do
  [ -r "$configFile" ] && source "$configFile"
done
unset configFile

# Path to binary files.
for evnBin in `cat $HOME/.gitslave | awk {'print $2'} | tr -d '"'`; do
	[[ -d $evnBin/bin ]] && PATH=${PATH}:${evnBin}/bin
done
unset evnBin

PATH=${PATH}:$(find $HOME/.zsh/libexec -type d | tr '\n' ':' | sed 's/:$//')
export PATH              ## Export it, duh.
typeset -U path          ## Only unique entries please.