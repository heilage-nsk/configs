# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="essembeh"



# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/local/bin:$HOME/.config/composer/vendor/bin
export _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on"
export EDITOR="vim"

export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="ru_RU.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"

export PUB_HOSTED_URL=http://pub-dev.wrke.in
export DART_SDK_PATH=/usr/local

alias fr="git forest --all --style=10 --topo-order --color=always --pretty=format:' %s %C(blue)%an %C(red)%h%C(reset)' | less -R"
alias s="git s"
alias reupload="git reupload"
alias f="git f"
alias rebase="git rebase"
alias checkout="git checkout"
alias gpush="git push origin"
alias commit="git commit"
alias branch="git branch"
alias tag="git tag"
alias status="git status"
alias show="git show"
alias add="git add"
alias grm="git rm"
alias grma="git commit --dry-run --short | grep '^ D '| awk '{print $2}' | xargs git rm"
alias reset="git reset"
alias dff="git diff -w -b -M"
alias crm="git checkout remotes/origin/master"
alias stash="git stash"
alias co="git checkout"
alias gpro="git pull --rebase origin"
alias mc="mc -S modarin256"
alias mcedit="mcedit -S modarin256"

# see .local/share/applications
alias phpstorm="gtk-launch jetbrains-phpstorm"
alias clion="gtk-launch jetbrains-clion"
alias webstorm="gtk-launch jetbrains-webstorm"

alias filter_shit="grep -v '/assets/' | grep -v 'favicon.ico' | grep -v '/vendor' | grep -v '/cookie' | grep -v '/fonts' | grep -v '/apple' | grep -v '/static'"

#eval "$(thefuck --alias)"

alias connect_workx="xpra --ssh=\"ssh -p2022 -C -c chacha20-poly1305@openssh.com\" attach ssh:oklimenko@192.168.88.205:12 --speaker=off"

export TERM=xterm-256color
# TMUX
if which tmux >/dev/null 2>&1; then
#if not inside a tmux session, and if no session is started, start a new session
     test -z "$TMUX" && tmux new-session
fi

npm set progress=false

unset GREP_OPTIONS

#source $HOME/.cargo/env

prompt_context(){}

# For use with oh-my-zsh muse theme only
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[012]}("
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[012]})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" ${FG[133]}✘ "
ZSH_THEME_GIT_PROMPT_CLEAN=" ${FG[118]}✔ "
ZSH_THEME_GIT_PROMPT_ADDED="${FG[082]}✚ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${FG[166]}✹ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="${FG[160]}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="${FG[220]}➜ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${FG[082]}═ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${FG[190]}✭ %{$reset_color%}"


#source "/home/oleg/projects/wasm/emsdk/emsdk_env.sh"
