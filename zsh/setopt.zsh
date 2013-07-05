# no beeping!
setopt no_beep

# allow changing to a directory without typing cd
setopt auto_cd

# allow multiple sessions to alter the history file
setopt append_history
# add a timestamp
setopt extended_history
# when trimming history, remove old duplicates first
setopt hist_expire_dups_first
# when searching history, don't display duplicates
setopt hist_find_no_dups
# ignore commands starting with a space
setopt hist_ignore_space
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# when completing from the middle of the word, go to the end
setopt always_to_end
# show a menu
setopt auto_menu
# allow completion in the middle of the word
setopt complete_in_word
# needed for auto_menu
unsetopt menu_complete

# enable spelling corrections
setopt correct
# and for arguments
setopt correctall

# perform implicit 'tees' or 'cats' when multiple redirects are used
setopt multios
