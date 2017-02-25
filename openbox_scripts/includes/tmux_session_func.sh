
function list_session_names
{
	tmux list-sessions -F "#{session_name}"
}



function list_session_pids
{
	tmux list-sessions -F "#{session_id}"
}

function list_session_types
{
	false
}


function num_sessions
{
	list_session_names | wc -l
}


function screen_exec
{
	# $1 - Session Name
	# $2 - Command to execute

	if [[ "$#" -eq 2 ]]; then
		tmux new-session -s "$1" -n "$1" "$2"
	else
		echo "Incorrect arguments" 1>&2
	fi
}


function screen_send_char
{
	false
}


function screen_quit
{
	# $1 - Session Name

	if [[ "$#" -eq 1 ]]; then
		tmux kill-session -t "$1"
	else
		echo "Incorrect arguments" 1>&2
	fi
}


function get_line
{
	LINE_NUM=$1

	if [ -z "$LINE_NUM" ]; then
		LINE_NUM=1
	fi

	DATA=""
	while read input; do
		DATA="${DATA}${input}"$'\n'
	done

	echo "$DATA" | head -n $LINE_NUM | tail -n 1
}


function session_restart
{
	# $1 - Session Name

	if [[ "$#" -eq 1 ]]; then
		tmux kill-session -t "$1"
		sleep 1
		~/.cmds/tmux_servers_startup "$1"
	else
		echo "Incorrect arguments" 1>&2
	fi

}



