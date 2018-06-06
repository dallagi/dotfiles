set -x

if [ ! -f /usr/local/bin/brew ]
then
  echo "Homebrew is not installed. Installing now..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew analytics off
brew tap homebrew/bundle
brew bundle --no-upgrade --file="$1"
