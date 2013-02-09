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

        set_promtp_colors()
        {
            if (( $? ))
            then
                prompt_beg=${bg_red}${fg_yellow}
                prompt_end=${normal}
            else
                prompt_beg=${bg_blue}${fg_yellow}
                prompt_end=${normal}
            fi
        }

PROMPT_COMMAND=set_promtp_colors

###############################################################################
# global definitions go here. We may change some of them due to OS specific
# needs.
###############################################################################
# the prompt should look like this: [hh@inferno /usr/local]$
PS1="[\u@\h \W]\\$ "
PS2='> '
export PS1 PS2
