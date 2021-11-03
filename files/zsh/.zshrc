HISTFILE=~/.histfile
HISTSIZE=100000
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

# Smarter git checkout
gch() {
 git checkout "$(git branch --all | fzf| tr -d '[:space:]')"
}

# Set $JAVA_HOME from asdf
. ~/.asdf/plugins/java/set-java-home.zsh

# Load autojump (necessary only for debian-based linux distros)
if apt --version &> /dev/null; then
    . /usr/share/autojump/autojump.sh
fi
# Load autojump for zsh on macos, for autojump installed via brew
if [[ "$(uname)" == "Darwin" ]]; then
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
fi

autoload -Uz compinit
compinit

alias doom=~/.emacs.d/bin/doom
alias vim=nvim

eval "$(direnv hook zsh)"

# When inside Emacs, move to project root
# (by default DOOM Emacs opens the terminal in the buffer dir)
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  if [ -n "$PROOT" ]; then
    cd "$PROOT"
  fi
fi

export EDITOR=vim

# Android dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Install erlang with documentation
export KERL_BUILD_DOCS=yes

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Python bins (ie. poetry)
export PATH=$PATH:/Users/marco/Library/Python/3.9/bin

alias dcr='docker-compose run -d --rm --service-ports'

export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export SAM_CLI_TELEMETRY=0
