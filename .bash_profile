
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source "$HOME/.bash_alias"
source "$HOME/.bash_functions"
source ~/.git-completion.bash
source ~/.ssh-completion.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[34m\][\w]\[\033[0m\]\n@\h\$ "
ssh-add ~/.ssh/id_scalarium_user_ignaciopiantanida 2> /dev/null

export DOTFILES_DIR="/Users/ignacio/projects/dotfiles/"
