#! /bin/zsh
# Define functions

# Tail with custom colors (DEBUG, INFO, ERROR and WARN)
function ctail() {
	tail "$@" | awk -f "$HOME/.local/highlight.awk"
}

# Extract given file
function ax () {
	if [ $# -eq 0 ]              ; then echo 'Gimme a file to unpack !' ; return ; fi
	if [ !  -x  /usr/bin/atool ] ; then echo 'Need "agi atool"'         ; return ; fi
	if [ !  -x  /bin/mktemp ]    ; then echo 'Need "mktemp"'            ; return ; fi

	TMP=`mktemp /tmp/aunpack.XXXXXXXXXX`
	atool -x --save-outdir=$TMP "$@"
	DIR="`cat $TMP`"
	[ "$DIR" != "" -a -d "$DIR" ] && cd "$DIR"
	rm -rf $TMP
}

# Edit file from fzf registry
function v() {
	local file
	file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

# Shortcut to access Docker logs
dl() {
	if [ "$1" = "service" ]; then
		docker service logs -f --tail 100 $2
		return
	fi;

	docker logs -f --tail 100 $2
}

compdef __dockershell dl

# Shortcut to log in container/service
dockershell() {
	if [ "$1" = "service" ]; then
		ID=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $(docker service ps -q "$2" | head -1))
	else
		ID=$2
	fi;

	docker exec -t -i -e PS1="$ID:\w# " "$ID" bash --noprofile --norc
}

__dockershell() {
	local state

	_arguments \
		"1: :->kind" \
		"*: :->containers" \

	case $state in
		(kind) compadd "$@" service container ;;
		(*)
			if [ "$words[2]" = "service" ]; then
				_arguments "*:services:($((docker info 2> /dev/null | grep -i 'swarm: active') && docker service ls -q --format '{{.Name}}'))"
			else
				_arguments "*:containers:($(docker ps -q --format '{{.Names}}'))"
			fi;
		;;
	esac
}

compdef __dockershell dockershell

# Shortcut to connect to SSH with user agent forwarding
server () {
	/usr/bin/ssh -A $1
}

__server () {
	_arguments \
		"1: :($(cat ~/.ssh/config | grep -Ei '^host' | grep -v '*' | sed 's/host \(.*\)/\1/i'))"
}

compdef __server server

# Display execution time
function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
	timer_show=$(($SECONDS - $timer))
	export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}"
	unset timer
  fi
}

function homestead() {
    ( cd /home/data/homestead && vagrant $* )
}

# vim: ft=zsh
