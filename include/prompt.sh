# ± if in github repo, or ≥ if otherwise Time in 24-hour format is on right.

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo "±" && return
    echo "≥"
}
precmd() {

    PROMPT="%n@%m:%~
$(prompt_char) "

}

