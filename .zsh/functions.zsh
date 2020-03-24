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

function dps () {
	docker ps -a --format 'table {{ .ID }}\t{{ .Names }}\t{{ .Status }}'
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

	CMD=$3

	if [ -z $CMD]; then
		# try using bash by default : if not found, fallback on sh
		CMD="command -v bash > /dev/null 2>&1 && bash --noprofile || sh"
	fi

	docker exec -t -i -e PS1="$ID:\w# " "$ID" sh -c $CMD
}

dockerwatch() {
	if [ "$1" = "service" ]; then
		ID=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $(docker service ps -q "$2" | head -1))
	else
		ID=$2
	fi;

	COMMAND=$@[3,-1]

	if [ -z $CMD ]; then
		# try using bash by default : if not found, fallback on sh
		COMMAND="uptime"
	fi

	watch -d "docker exec -t -i -e PS1=\"$ID:\w# \" \"$ID\" sh -c \"$COMMAND\""
}

compdef __dockershell dockerwatch

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

function homestead() {
    ( cd /home/data/homestead && vagrant $* )
}

function gown() {
	git ls-files --others --exclude-standard | xargs sudo chown $USER:$USER
}

function certdates() {
	echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -dates
}

# vim: ft=zsh
