###
#
#  Stephen "Rixius" Middleton .File
#  License located at <https://github.com/Rixius/dotfu/blob/master/LICENSE.md>
#
###

# Method to run Dependencies
dotfu-import() {

    if [ -f $1 ]; then
        . $1
        return 0
    fi
    return 1

}


# Core Functionality
dotfu-import $HOME/src/dotfu/include/alias.sh
dotfu-import $HOME/src/dotfu/include/path.sh
dotfu-import $HOME/src/dotfu/include/prompt.ba.sh
dotfu-import $HOME/src/dotfu/include/options.ba.sh
dotfu-import $HOME/.rvm/scripts/rvm


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
