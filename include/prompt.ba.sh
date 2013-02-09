
# Colors
export fg_black="[30m"
export fg_red="[31m"
export fg_green="[32m"
export fg_yellow="[33m"
export fg_blue="[34m"
export fg_magenta="[35m"
export fg_cyan="[36m"
export fg_white="[37m"
export bg_black="[40m"
export bg_red="[41m"
export bg_green="[42m"
export bg_yellow="[43m"
export bg_blue="[44m"
export bg_magenta="[45m"
export bg_cyan="[46m"
export bg_white="[47m"
export normal="[0m"

set_prompt()
{
	# Establish all variables that are used
    infoline=()
    promptline=()
    lines=()

	# Setup the infoline
    [[ $EUID -eq 0 ]] \
        && infoline+=( "${fg_red}" ) \
        || infoline+=( "${fg_green}" )
    infoline+=( "\u" )
    infoline+=( "${normal}" )
    [[ -n $SSH_CLIENT ]] \
        && infoline+=( "@\h" )
    infoline+=( ":\w" )

	# Setup the promptline
	promptline+=( "(" )
	if [[ $1 -eq 0 ]]; then
		promptline+=( "${fg_green}" )
		promptline+=( "✓" )
	else
		promptline+=( "${fg_red}" )
		promptline+=( "✗" )
	fi
	promptline+=( "${normal}" )
	promptline+=( ")" )
	if `git branch >/dev/null 2>&1`; then
		promptline+=( "±" )
	else
		promptline+=( "≥" )
	fi
	promptline+=( " " )

	# Setup the Lines
    lines+=( "$( IFS=$''; echo "${infoline[*]}" )" )
    lines+=( "$( IFS=$''; echo "${promptline[*]}" )" )
	#[[ -n ${vcs_info_msg_0_} ]] && lines+=( "${c[gray]}${vcs_info_msg_0_}${c[reset]}" )

	# Finally set the prompt >.>
    PS1=$( IFS=$'\n'; echo "${lines[*]}" )
}
pre_cmd()
{
	# Some manipulation to get the accurate exit status of the last program
	local lastcall=$?
	set_prompt $lastcall
}

PROMPT_COMMAND=pre_cmd
PS1="> "
PS2='> '
export PS1 PS2 PROMPT_COMMAND
