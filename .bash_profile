PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.bash_env" ]] && source "$HOME/.bash_env"
source "$HOME/.bash_alias"
[[ -s "$HOME/.git-completion.bash" ]] && source ~/.git-completion.bash
[[ -s "$HOME/.ssh-completion.bash" ]] && source ~/.ssh-completion.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function _git_prompt3(){
	if git rev-parse 2> /dev/null; then
		if ! git diff-index --quiet HEAD --; then
    		local changes="*"
		fi
		echo "($(git rev-parse --abbrev-ref HEAD)${changes})"
	fi
}

PS1='\[\e]0;\u@\h: \w\a\]\[\033[34m\][\w]\[\033[0m\]\[\033[32m\]$(_git_prompt3)\[\033[0m\] | $(date +%H:%M:%S)\n@\h\$ '

export DOTFILES_DIR="/Users/ignacio/projects/dotfiles/"

#history setup
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

export PATH="/usr/local/sbin:$PATH"
export PATH="~/.config/yarn/global/node_modules/.bin:$PATH"
export N_PREFIX=/Users/ignacio/.n/
export PATH="$N_PREFIX/bin:$PATH"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export ANDROID_HOME="/Users/ignacio/Library/Android/sdk"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/27.0.3
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/openssl/include"
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_TOOL_OPTIONS=-Dcom.amazonaws.sdk.ec2MetadataServiceEndpointOverride=localhost

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#Grubhub
export PATH=${PATH}:/Users/ignacio/projects/grubhub/dockhub

[[ -s "$HOME/.bash_functions" ]] && source ~/.bash_functions

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ignacio/tools/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ignacio/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ignacio/tools/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ignacio/tools/google-cloud-sdk/completion.bash.inc'; fi

  # heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/ignacio/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

eval "$(direnv hook bash)"
