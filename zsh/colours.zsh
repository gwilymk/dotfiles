autoload colors ; colors

# set up the colours veriables so that they are easier to type
for COLOUR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval export PR_$COLOUR='%{$fg_no_bold[${(L)COLOUR}]%}'
    eval export PR_BOLD_$COLOUR='%{$fg_bold[${(L)COLOUR}]%}'
done

eval export RESET='%{$reset_color%}'

unset LSCOLORS

export CLICOLOR=1
export LS_COLORS='di=1;;40:ln=35;40:so=34;40:pi=36;40:ex=31;40:bd=36;44:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
