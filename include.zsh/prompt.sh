# ± if in github repo, or ≥ otherwise

# Load zsh additionals needed for prompt
autoload -U colors && colors
autoload -Uz vcs_info

# Local Variables for Prompt
local -A c

c+=( 'reset' "%{${reset_color}%}" )
c+=( 'white' "%{$fg[white]%}" )
c+=( 'gray' "%{$fg_bold[black]%}" )
c+=( 'green' "%{$fg_bold[green]%}" )
c+=( 'red' "%{$fg[red]%}" )
c+=( 'yellow' "%{$fg[yellow]%}" )


function setprompt() {
	# Establish all variables that are used
	local -a infoline promptline lines

	# Setup the infoline
	[[ $EUID -eq 0 ]] && infoline+=( "${c[red]}" ) || infoline+=( "${c[green]}" )
	infoline+=( "%n" )
	infoline+=( "${c[reset]}" )
	[[ -n $SSH_CLIENT ]] && infoline+=( "@%m" )
	infoline+=( ":%~" )

	# Setup the promptline
	promptline+=( "(" )
	if [[ $1 -eq 0 ]]; then
		promptline+=( "${c[green]}" )
		promptline+=( "✓" )
	else
		promptline+=( "${c[red]}" )
		promptline+=( "✗" )
	fi
	promptline+=( "${c[reset]}" )
	promptline+=( ")" )
	if `git branch >/dev/null 2>&1`; then
		promptline+=( "±" )
	else
		promptline+=( "≥" )
	fi
	promptline+=( " " )

	# Setup the Lines
	lines+=( ${(j::)infoline} )
	[[ -n ${vcs_info_msg_0_} ]] && lines+=( "${c[gray]}${vcs_info_msg_0_}${c[reset]}" )
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

# Overall VCS_Info Settings
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:(git*|svn*|hg*):*' get-revision true
zstyle ':vcs_info:(git*|svn*|hg*):*' check-for-changes true
zstyle ':vcs_info:(git*|svn*|hg*):*' stagedstr "${c[green]}S${c[gray]}"
zstyle ':vcs_info:(git*|svn*|hg*):*' unstagedstr "${c[red]}U${c[gray]}"
zstyle ':vcs_info:(git*|svn*|hg*)' formats "(%s) %12.12i %c%u %b%m"
zstyle ':vcs_info:(git*|svn*|hg*)' actionformats "(%s|%a) %12.12i %c%u %b%m"

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
