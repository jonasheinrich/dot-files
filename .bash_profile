export EDITOR=vim

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# bash prompt
PS1="\[\033[0;33m\]\w\[\033[m\]\[$MAGENTA\]\$(parse_git_branch)\[$WHITE\]\$ "

# autocomplete ssh hosts
complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
