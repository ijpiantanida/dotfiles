[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.bash_env" ]] && source "$HOME/.bash_env"
source "$HOME/.bash_alias"
source "$HOME/.bash_functions"
source ~/.git-completion.bash
source ~/.ssh-completion.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function _git_prompt(){
	if git rev-parse 2> /dev/null; then
		if ! git diff-index --quiet HEAD --; then
    		local changes="*"
		fi
		echo "($(git rev-parse --abbrev-ref HEAD)${changes})"
	fi
}

PS1='\[\e]0;\u@\h: \w\a\]\[\033[34m\][\w]\[\033[0m\]\[\033[32m\]$(_git_prompt)\[\033[0m\] | $(date +%H:%M:%S)\n@\h\$ '

ssh-add ~/.ssh/id_scalarium_user_ignaciopiantanida 2> /dev/null

export DOTFILES_DIR="/Users/ignacio/projects/dotfiles/"

export RUBYMOTION_ANDROID_SDK=/Users/ignacio/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=/Users/ignacio/.rubymotion-android/ndk
export ANDROID_HOME=$RUBYMOTION_ANDROID_SDK

export PATH="$RUBYMOTION_ANDROID_SDK/tools:$RUBYMOTION_ANDROID_SDK/platform-tools:$PATH"

#history setup
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/var/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/usr/local/var/google-cloud-sdk/completion.bash.inc'
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export PATH="$HOME/.node/bin:$PATH"

eval "$(hub alias -s)"

export SELENIUM_CHROME_DRIVER=/usr/lib/chromedriver