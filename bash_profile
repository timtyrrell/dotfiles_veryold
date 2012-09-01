export EDITOR=mvim
export NODE_PATH="/usr/local/lib/node/"
export PATH="/usr/local/bin:/Users/ttyrrell/.gem/ruby/1.8/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

alias gitx="gitx --all"
alias gst='git status'
alias gca='git commit -a'
alias gco='git checkout $1'
alias gdi='git diff'
alias vim='mvim -v'

set keymap vi

export PS1='\[\e[34;34m\]$(parse_git_branch)\[\e[39;39m\]\W\[\e[39m\] $ '
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
