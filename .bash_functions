#Given a Facebook access_token, it prints out the owner's profile
#Usage: fb access_token
function fb(){
  COeMAND="curl https://graph.facebook.com/me?access_token=$1"
  $COMMAND | python -mjson.tool
}

#Renames a function
#Usage: save_function function_name new_function_name
function save_function() {
  local ORIG_FUNC=$(declare -f $1)
  local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
  echo "EVALL |$NEWNAME_FUNC|"
}

# save_function cd _old_cd
# function cd(){
# 	change_tab_color 153 153 153
# 	if _old_cd "$@"; then
# 		[[ -s "$PWD/.iterm" ]] && change_tab_color $(cat "$PWD/.iterm") ;
#         return 0;
#     else
#         return $?;
#     fi	
# }

function change_tab_color(){
	echo -e -n "\033]6;1;bg;red;brightness;$1\a"
	echo -e -n "\033]6;1;bg;green;brightness;$2\a"
	echo -e -n "\033]6;1;bg;blue;brightness;$3\a"
}

function oldit(){
  mv "$1" "$1.old"
}

#Moves any file to the DOTFILES_DIR creating a symlink and starts tracking it with git
#Usage: dotit file_name [destination_path]
function dotit(){
  original_dir=$(pwd)
  dotfiles_git_dir=$DOTFILES_DIR
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

function with_each_file(){
  find "$1" -type f -print0 | xargs -0 "${@:2}"
}

function get_pr(){
  git fetch origin pull/$1/head:$2
}

#Runs an interactive bash session on a Docker container
function dbash(){
  docker exec -ti $1 bash
}

#Runs an interactive bash session on a Kubernetes container
function kbash(){
  command="kubectl exec -ti $1 --namespace=$2 bash ${@:3}"
  echo $command
  $command
}

function kget() {
  command="kubectl get pods --namespace=$1 ${@:2}"
  echo $command
  $command
}

function tar_gz(){
  tar -zcf $1.tar.gz $1
}

function untar_gz(){
  filename_with_extension=$(basename $1)
  filename="${filename_with_extension%.tar.gz}"
  mkdir $filename
  tar -zxf $1 -C $filename
}

#Restarts the sound service when there're problems
function restart_sound() {
  sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`
}

function mixit_audio() {
  filename_with_extension=$(basename $1)
  filename="${filename_with_extension%.*}"
  #ffmpeg -i $1 -map_channel 0.0.0 "$filename-left.wav" -map_channel 0.0.1 "$filename-right.wav"
  ffmpeg -i $1 -map_channel 0.0.1 "$filename-mixed.mp3"
}

function mount_passport() {
  sudo /usr/local/bin/ntfs-3g /dev/disk2s1 /Volumes/NTFS -olocal -oallow_other
}

function gri() {
  git rebase -i $1~1
}

function localserver() {
  python -m http.server 7070
}

function every() {
  while :; do "${@:2}"; sleep $1; done
}
