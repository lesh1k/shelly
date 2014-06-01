set -e

if [ ! -n "$SHELLY" ]; then
  SHELLY=~/.shelly
fi

if [ -d "$SHELLY" ]; then
  echo "\033[0;33mShelly is already installed.\033[0m You'll need to remove $SHELLY if you want to install"
  exit
fi

echo "\033[0;34mCloning Shelly...\033[0m"
hash git >/dev/null 2>&1 && /usr/bin/env git clone https://github.com/lexxxas/shelly.git $SHELLY || {
  echo "git not installed"
  exit
}

echo "\033[0;34mSetting up...\033[0m"
echo "\033[0;34mPreparing aliases.\033[0m"
if [ -f ~/.bashrc ]; then
    echo "$(cat "$SHELLY"bashrc-addition.sh)" >> ~/.bashrc
else 
    echo "Could not find ~/.bashrc"
    exit
fi

echo "\033[0;34mPreparing auto-completion.\033[0m"
if [ -d /etc/bash_completion.d/ ]; then
    sudo cp -r auto-complete/. /etc/bash_completion.d/

    echo "Loading newly added auto-completion files..."
    #Load/source new completion files
    FILES=auto-complete/*
    FILES=$(echo "$SHELLY$FILES")
    for f in $FILES
    do
        . /etc/bash_completion.d/${f##*/}
    done
else
    echo "Could not find /etc/bash_completion.d/"
    echo "Auto-complete setup failed!"
fi

echo "\033[0;34mAliases first load.\033[0m"
. ~/.bashrc
echo "\033[0;34mDone!\033[0m"