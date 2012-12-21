# ± if in github repo, or ≥ otherwise

# Load zsh additionals needed for prompt
autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats "(%s) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash
# Show remote ref and number of commits ahead-of or behind
function +vi-git-st() {
	local ahead behind remote
	local -a gitstatus

	# Are we on a remote-tracking branch?
	remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
		--symbolic-full-name 2>/dev/null)/refs\/remotes\/}
	if [[ -n ${remote} ]]; then
	  # for git prior to 1.7
		# ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
		ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
		(( $ahead )) && gitstatus+=( "${c3}+${ahead}${c2}" )

		# for git prior to 1.7
		# behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
		behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
		(( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )

		hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
	fi
}
# Show any stashed changes
function +vi-git-stash() {
	local -a stashes

	if [[ -s ${hook_com[base]}/.git/refs/stash ]]; then
		stashes=$(git stash list 2>/dev/null | wc -l)
		hook_com[misc]+=" (${stashes} stashed)"
	fi
}

function setprompt() {
	# Establish all variables that are used
	local reset white gray green red
	local -a infoline promptline lines

	reset="%{${reset_color}%}"
	white="%{$fg[white]%}"
	gray="%{$fg_bold[black]%}"
	green="%{$fg_bold[green]%}"
	red="%{$fg[red]%}"
	yellow="%{$fg[yellow]%}"

	# Setup the infoline
	[[ $EUID -eq 0 ]] && infoline+=( "${red}" ) || infoline+=( "${green}" )
	infoline+=( "%n" )
	infoline+=( "${reset}" )
	[[ -n $SSH_CLIENT ]] && infoline+=( "@%m" )
	infoline+=( ":%~" )

	# Setup the promptline
	promptline+=( "(" )
	if [[ $1 -eq 0 ]]; then
		promptline+=( "${green}" )
		promptline+=( "✓" )
	else
		promptline+=( "${red}" )
		promptline+=( "✗" )
	fi
	promptline+=( "${reset}" )
	promptline+=( ")" )
	if `git branch >/dev/null 2>&1`; then
		promptline+=( "±" )
	else
		promptline+=( "≥" )
	fi
	promptline+=( " " )

	# Setup the Lines
	lines+=( ${(j::)infoline} )
	[[ -n ${vcs_info_msg_0_} ]] && lines+=( "${gray}${vcs_info_msg_0_}${reset}" )
	lines+=( ${(j::)promptline} )

	# Finally set the prompt >.>
	PROMPT=${(F)lines}
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "±" && return
    echo "≥"
}
precmd() {
	# Some manipulation to get the accurate exit status of the last program
	local lastcall=$?
	vcs_info
	setprompt $lastcall
}

