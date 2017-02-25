

function openbox_pipemenu_item
{
	if [[ -z "$1" ]]; then
		LABEL="LABEL"
	else
		LABEL=$1
	fi

	if [[ -z "$2" ]]; then
		COMMAND="false"
	else
		COMMAND=$2
	fi

	echo "  <item label=\"${LABEL}\">"
	echo "    <action name=\"Execute\">"
	echo "      <execute>${COMMAND}</execute>"
	echo "    </action>"
    echo "  </item>"
}


function openbox_separator
{
	if [[ "$#" -eq 1 ]]; then
		echo "<separator label=\"$1\"/>"
	else
		echo "<separator/>"
	fi
}


function openbox_pipemenu_header
{
	echo "<openbox_pipe_menu>"
}


function openbox_pipemenu_footer
{
	echo "</openbox_pipe_menu>"
}


function openbox_menu_header
{
	if [[ -z "$1" ]]; then
		MENU="MENU_${RANDOM}"
	else
		MENU=$1
	fi

	echo "<menu id=\"${MENU}-list\" label=\"${MENU}\">"
}


function openbox_menu_footer
{
	echo "</menu>"
}


# Reads stdin and escapes any special XML characters
function escape_xml
{
	cat |	sed 's/&/\&amp;/g'		|		# Escape the ampersand character
			sed 's/"/\&quot;/g'		|		# Escape the quote character
			sed "s/'/\&apos;/g"		|		# Escape the apostrophe character
			sed "s/</\&lt;/g"		|		# Escape the less than character
			sed "s/>/\&gt;/g"				# Escape the greater than character

}


