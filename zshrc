DIR=/home/gwilym/.dotfiles/zsh

source $DIR/colours.zsh
source $DIR/setopt.zsh
source $DIR/exports.zsh
source $DIR/prompt.zsh
source $DIR/completion.zsh
source $DIR/alias.zsh
source $DIR/syntax-hl/zsh-syntax-highlighting.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /home/gwilym/.rvm/scripts/rvm
