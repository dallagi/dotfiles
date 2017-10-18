set -gx PATH /usr/local/opt/python/libexec/bin $PATH

# npm stuff
set NPM_PACKAGES $HOME/.node_modules_global
set -gx PATH $PATH $NPM_PACKAGES/bin
set -g NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
