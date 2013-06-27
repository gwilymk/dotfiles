autoload colors ; colors

# set up the colours veriables so that they are easier to type
for COLOUR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval export PR_$COLOUR='%{$fg_no_bold[${(L)COLOUR}]%}'
    eval export PR_BOLD_$COLOUR='%{$fg_bold[${(L)COLOUR}]%}'
done

eval export RESET='%{$reset_color%}'
