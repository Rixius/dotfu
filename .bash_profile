# Load my bashrc file, which loads any ENV's or Aliases.
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# Load my Input modifications, things not needed in a Shell Script.
if [ -f ~/src/dotfu/include/input.ba.sh ]; then
    . ~/src/dotfu/include/input.ba.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
