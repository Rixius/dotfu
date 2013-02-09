###
#
#  Stephen "Rixius" Middleton .File
#  License located at <https://github.com/Rixius/.fu/blob/master/LICENSE.md>
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
dotfu-import $HOME/src/.fu/include/path.sh

