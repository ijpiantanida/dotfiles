#Given a Facebook access_token, it prints out the owner's profile
#Usage: fb access_token
function fb(){
  COMMAND="curl https://graph.facebook.com/me?access_token=$1"
  $COMMAND | python -mjson.tool
}

#Renames a function
#Usage: save_function function_name new_function_name
function save_function() {
    local ORIG_FUNC=$(declare -f $1)
    local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
    eval "$NEWNAME_FUNC"
}

save_function cd _old_cd
function cd(){
	change_tab_color 153 153 153
	if _old_cd "$@"; then
		[[ -s "$PWD/.iterm" ]] && change_tab_color $(cat "$PWD/.iterm") ;
        return 0;
    else
        return $?;
    fi	
}

function change_tab_color(){
	echo -e -n "\033]6;1;bg;red;brightness;$1\a"
	echo -e -n "\033]6;1;bg;green;brightness;$2\a"
	echo -e -n "\033]6;1;bg;blue;brightness;$3\a"
}

function oldit(){
  mv "$1" "$1.old"
}

function dotit(){
  original_dir=$(pwd)
  dotfiles_git_dir="/Users/ignacio/projects/dotfiles/"
  destination="$dotfiles_git_dir/$2"
  mkdir -p $destination
  full_path=$(pwd)/"$1"
  mv "$full_path" "$destination"
  ln -s "$destination/$1" "$full_path"
  cd $dotfiles_git_dir
  echo "ln -s \"$destination/$1\" \"$full_path\"" >> installer
  git add "$destination/$1"
  git add installer
  git commit -m "Added $1"

  cd $original_dir
}