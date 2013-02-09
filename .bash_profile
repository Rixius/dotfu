# Load my bashrc file, which loads any ENV's or Aliases.
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# Load my Input modifications, things not needed in a Shell Script.
if [ -f ~/src/.fu/include/input.ba.sh ]; then
    . ~/src/.fu/include/input.ba.sh
fi
