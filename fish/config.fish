# Custom env
source ~/.config/fish/env.fish

# Virtualfish
eval (python -m virtualfish auto_activation compat_aliases)

# Direnv
eval (direnv hook fish)

# Do not shorten the PWD in prompt
set -g fish_prompt_pwd_dir_length 0

# Colorize man pages
set -g man_blink -o dc322f  # red
set -g man_bold -o 859901  # green
set -g man_standout -b 003541 93a1a1
set -g man_underline -u 93a1a1

# Aliases
source ~/.config/fish/aliases.fish

