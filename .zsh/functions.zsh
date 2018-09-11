#! /bin/zsh
# Define functions

# Shortcut to connect to SSH with user agent forwarding
function server () {
	/usr/bin/ssh -A $@
}

# Shortcut to access Docker logs
function dl() {
	CONTAINER=$(docker ps -a --no-trunc | grep "$1\$" | awk '{print $1}' | head -n 1)
	docker logs -f --tail=100 $CONTAINER
}

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

dockerexec() {
	ID=$(docker inspect --format '{{.Status.ContainerStatus.ContainerID}}' $(docker service ps -q "$1" | head -1))
	docker exec -t -i "$ID" bash
}


__dockerexec() {
	_arguments "1: :($(docker service ls -q --format '{{.Name}}'))"
}

compdef __dkse dkse

# vim: ft=zsh

