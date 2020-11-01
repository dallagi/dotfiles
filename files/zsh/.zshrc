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

# Enable pure prompt
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure

# Set $JAVA_HOME from asdf
. ~/.asdf/plugins/java/set-java-home.zsh

# Load autojump (necessary only for debian-based linux distros)
if apt --version > /dev/null; then
    . /usr/share/autojump/autojump.sh
fi

autoload -Uz compinit
compinit

alias vim=nvim

eval "$(direnv hook zsh)"

