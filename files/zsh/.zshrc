HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd beep extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# # Set $JAVA_HOME from asdf
# . ~/.asdf/plugins/java/set-java-home.zsh

autoload -Uz compinit
compinit

# Load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ec=emacsclient
alias doom=~/.config/emacs/bin/doom
alias vim=nvim

eval "$(direnv hook zsh)"

eval "$(zoxide init zsh)"

source $HOME/.cargo/env

# When inside Emacs, move to project root
# (by default DOOM Emacs opens the terminal in the buffer dir)
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  if [ -n "$PROOT" ]; then
    cd "$PROOT"
  fi
fi

# Enable starship as prompt
eval "$(starship init zsh)"

export EDITOR=nvim

# Install erlang with documentation
export KERL_BUILD_DOCS=yes

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Personal bins
export PATH=$PATH:$HOME/.bin

alias dc='docker compose'
alias dcr='dc run -d --rm --service-ports'

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.local/bin:$PATH"

export SAM_CLI_TELEMETRY=0

eval "$(~/.local/bin/mise activate zsh --shims)"
