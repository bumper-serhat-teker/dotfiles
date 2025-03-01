# ----------------------------------------------------------------------------#
#
#                                       _
#                               _______| |__  _ __ ___
#                              |_  / __| '_ \| '__/ __|
#                             _ / /\__ \ | | | | | (__
#                            (_)___|___/_| |_|_|  \___|
#
# Author: Serhat Teker <me@serhatteker.com>
# Source: https://github.com/SerhatTeker/dotfiles
# License: https://github.com/SerhatTeker/dotfiles/LICENSE
#
# ----------------------------------------------------------------------------#

# SETUP {{{1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Personal customization for plugins
ZCUSTOMS="$ZDOTDIR/plugins/customs"

# oh-my-zsh {{{2

# Path to your oh-my-zsh installation.
# Don't use ZDOTDIR dir: makes everything complex
# export ZSH="${ZDOTDIR}/.oh-my-zsh"
export ZSH="${XDG_DATA_HOME}/zsh/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#zsh_cache_dir
# default but for explicit definition
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/oh-my-zsh"

# Use custom ZSH_COMPDUMP until #9090 merged
# https://github.com/ohmyzsh/ohmyzsh/pull/9090
export ZSH_COMPDUMP="${XDG_CACHE_HOME}/.zcompdump-${HOST/.*/}-${ZSH_VERSION}"
# }}}2
# }}}1

# THEME {{{1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple-custom"
# ZSH_THEME="gallois-custom"
# ZSH_THEME="agnoster"          # Powerline
#
# ZSH_THEME="robbyrussell"      # Default
# ZSH_THEME="gallois"
# ZSH_THEME="simple"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="avit"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Base16 Shell Themes {{{2
# Optional

BASE16_SHELL="${XDG_CONFIG_HOME}/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"
# }}}2
# }}}1

# SETTINGS-1 {{{1

# Defaults {{{

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# UPDATE

# TIP
# Manual Update
# $ omz update

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment auto-update without prompting
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# }}}

# prompt settings {{{

# INFO: define from alacritty
# _fix_cursor() {
#     # change cursor color
#     # alternative: xterm 214 or 220
#     echo -ne '\e]12;yellow\a'
# }
# precmd_functions+=(_fix_cursor)
# }}}

# Editor {{{2

# Preferred editor for local and remote sessions
if hash lvim 2>/dev/null; then
    export EDITOR="$(which lvim)"
elif hash nvim 2>/dev/null; then
    export EDITOR='nvim'
elif hash vim 2>/dev/null; then
    export EDITOR='vim'
fi
export SUDO_EDITOR="${EDITOR}"

# SSH different editor choice
# if [[ -n $SSH_CONNECTION ]]; then
# 	export EDITOR='vim'
# fi
# }}}2

# nvm node {{{

export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh" # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion
# }}}

# python venv {{{2

# chpwd is a zsh hook, which is executed after change directory
# More info: http://zsh.sourceforge.net/Doc/Release/Functions.html
# function chpwd() {
#   if [ -z "$VIRTUAL_ENV" ]; then
# 	# If a virtualenv with name of .venv, load it.
# 	if [ -d .venv/ ]; then
# 		source .venv/bin/activate
# 	fi
#   fi
# }
# }}}2
# }}}1

# PLUGINS {{{1

# Enabled Plugins {{{2

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vi-mode
    # dotenv    # Disabled
    cd-gitroot
    copypath
    copyfile
    docker
    docker-compose
    httpie
    kubectl
    macos
    python
    pass
    terraform
    ubuntu
    zsh-autosuggestions
    zsh-completions
    # Note that zsh-syntax-highlighting must be the last plugin sourced.
    zsh-syntax-highlighting
)

source ${ZSH}/oh-my-zsh.sh
# }}}2

# Config Plugins {{{2

# Dotenv {{{3

# Disable confirmation message
# "dotenv: source '.env' file in the directory?"
ZSH_DOTENV_PROMPT=false
# }}}3

# Zlong Alert {{{3

# __Disabled: it is so annoying__
# A plugin to alert you when a long-running command has finished
# source ~/dotfiles/zsh/plugins/zlong_alert.zsh

# zlong_duration=120
# zlong_ignore_cmds="vim nvim vi vs ssh libreoffice firefox chrome thunderbird 'python manage.py'"
# }}}3

# zsh-highlight {{{3
if [[ "${ZSH_CUSTOM_HIGHLIGHT}" == "TRUE" ]]; then
    [ -f ${ZCUSTOMS}/.syntax-highlight.zsh ] \
        && source ${ZCUSTOMS}/.syntax-highlight.zsh
fi
# }}}3

# agnoster {{{3

if [[ "${ZSH_THEME}" == "agnoster" ]]; then
    [ -f ${ZCUSTOMS}/.agnoster.zsh ] \
        && source ${ZCUSTOMS}/.agnoster.zsh
fi
# }}}3

# FZF {{{3

[ -f ${ZDOTDIR}/.fzf.zsh ] && source ${ZDOTDIR}/.fzf.zsh
# }}}3
# }}}2
# }}}1

# SETTINGS-2 {{{1

# Extra Auto complete {{{2

# autoload bashcompinit && bashcompinit
# autoload -U +X bashcompinit && bashcompinit
# autoload -Uz compinit && compinit

# aws
complete -C $(which aws_completer) aws

# terraform
# complete -C ~/.local/bin/terraform terraform
# }}}2

# History {{{2

# !!! Warning !!!
# History settings should be after `source $ZSH/oh-my-zsh.sh`
HISTFILE="${XDG_DATA_HOME}/zsh/.zsh_history"
HISTSIZE=1000000                # 1M
SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_ALL_DUPS     # ignore duplicated commands history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY         # record command start time
setopt SHARE_HISTORY            # share command history data

# History
# Don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
zshaddhistory() {  whence ${${(z)1}[1]} >/dev/null || return 2 }
# or return 1
# zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# }}}2

# Aliases, functions and others {{{2

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [ -f ${ZDOTDIR}/.aliases ]; then
    source ${ZDOTDIR}/.aliases
fi

# Functions definitions
if [ -f ${ZDOTDIR}/.functions ]; then
    source ${ZDOTDIR}/.functions
fi

# Senstive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
[ -f ${ZDOTDIR}/.private.zsh ] && source ${ZDOTDIR}/.private.zsh

# Personal specific extras
# Overrides defaults if there are any
[ -f ${ZDOTDIR}/.zsh.local ] && source ${ZDOTDIR}/.zsh.local
# }}}2

# Homebrew {{{

# NOTE: Keep it last
# Use homebrew bins instead of system-provided
# Warning: /usr/bin occurs before $HOME/.homebrew/bin in your PATH. This
# means that system-provided programs will be used instead of those
if [[ "${OSTYPE}" == "darwin"* ]]; then
    if [ -d "${HOME}/.homebrew/bin" ]; then
        # export PATH="${HOME}/.homebrew/bin"     # old way prepend
        path=("${HOME}/.homebrew/bin" $path)            # zsh way prepend
    fi
fi
# }}}

# Additional Envs {{{2
#
# Useful shorthand environment variables

# TODO: Use these vars and remove repetitive func/vars in other files, e.g. functions
#
# Week and year number
export WNUM=$(wnum)
export YNUM=$(ynum)
# Week day number
export WDAYNUM=$(wday)
# Unix times
export UNIX_MILISEC=$(timestamp)
# }}}2
# }}}1
