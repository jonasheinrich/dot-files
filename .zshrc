zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
autoload -Uz vcs_info

precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{yellow}${PWD/#$HOME/~}%f ${vcs_info_msg_0_}$ '

# History settings
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
alias hist="history 1"


# Allow '#' to comment in command-line
setopt interactivecomments

