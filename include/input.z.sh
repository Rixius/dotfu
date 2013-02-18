
# Make a new bindkey keymap,
# and base it off of viins and main
bindkey -N riximap viins
bindkey -A riximap main

# Toggle between insert and command mode
bindkey "^Q" vi-cmd-mode

bindkey "^K" history-search-backward
bindkey "^J" history-search-forward

bindkey "^h" backward-char
bindkey "^l" forward-char
bindkey "^H" backward-char
bindkey "^L" forward-char

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
