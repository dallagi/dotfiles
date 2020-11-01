HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt autocd beep extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marco/.zshrc'

# Enable asdf
. $HOME/.asdf/asdf.sh
# append asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# set $JAVA_HOME from asdf
. ~/.asdf/plugins/java/set-java-home.zsh

autoload -Uz compinit
compinit

alias vim=nvim

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
