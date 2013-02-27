# Add yourself some shortcuts to projects you often work on
# alias vim='mvim -v'
alias gdiff='git diff --color-words'
alias sha='git rev-parse HEAD | pbcopy'

export EDITOR='vim'
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

#for tmux powerline
export PLATFORM='mac'

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# speedup auto-complete
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 git rvm osx ruby bundler brew)
#plugins=(rails git rvm zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
HISTSIZE=50000
SAVEHIST=50000

# ignore duplicate history entries
setopt histignoredups

# Customize to your needs...
export PATH=/usr/local/Cellar/ctags/5.8/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:usr/local/Cellar

export MAVEN_OPTS='-Xms256m -Xmx1224m -XX:+CMSClassUnloadingEnabled -XX:PermSize=64M -XX:MaxPermSize=256M -Dfile.encoding=UTF-8'

#add our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# speedup git auto-complete
compdef -d git

#vim binding
bindkey -v
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M viins '^r' history-incremental-search-backward

# The time the shell waits, in hundredths of seconds, for another key
# to be pressed when reading bound multi-character sequences.
#
# Set to shortest possible delay is 1/100 second.
# This allows escape sequences like cursor/arrow keys to work,
# while eliminating the delay exiting vi insert mode.
KEYTIMEOUT=1

# Ruby speepup

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000
# export RUBY_HEAP_MIN_SLOTS=40000
export RUBY_FREE_MIN=500000
# export CFLAGS="-march=native -O3 -pipe -fomit-frame-pointer"

mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}

#tmuxinator
[[ -s "$HOME/.tmuxinator/scripts/tmuxinator" ]] && source "$HOME/.tmuxinator/scripts/tmuxinator"
#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
unsetopt correct_all
