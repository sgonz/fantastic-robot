

VBOX="/usr/bin/VBoxManage"

VBOX_LIST_HEADER_LEN=0


function vbox_stopped_vms
{
	VM_LIST="$(${VBOX} list vms | tail -n +${VBOX_LIST_HEADER_LEN} | sed 's/ *{[^}]*} */\\n/')"
	VM_LIST="${VM_LIST}$(${VBOX} list runningvms | tail -n +${VBOX_LIST_HEADER_LEN} | sed 's/ *{[^}]*} */\\n/')"
	
	echo -e ${VM_LIST} | sed 's/^[^"]*"\([^"]*\)"/\1/' | sort | uniq -u | grep -v "^ *$"
}



function vbox_running_vms
{
	VM_LIST="$(${VBOX} list runningvms | tail -n +${VBOX_LIST_HEADER_LEN} | sed 's/ *{[^}]*} */\\n/')"

	echo -e ${VM_LIST} | sed 's/^[^"]*"\([^"]*\)"/\1/' | sort | grep -v "^ *$"
}



