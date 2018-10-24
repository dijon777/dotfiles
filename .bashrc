PATH=$PATH:/Applications/android-sdk-macosx/platform-tools
PATH=$PATH:/usr/bin:/usr/sbin/:/usr/local/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/X11/bin
PATH=$PATH:/System/Library/Frameworks
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:/usr/local/pear/bin
PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
PATH=$PATH:$HOME/.rbenv/bin
PATH=$PATH:$HOME/bin
export PATH

if type go > /dev/null 2>&1; then
    export GOPATH=$HOME/Documents/golang
    export GOROOT=`go env GOROOT`
    PATH=$PATH:$GOROOT:$GOPATH/bin
fi

export CDJ_DIR_MAP=(
    hw   ~/Projects/Hapyson/src/Hapyson_web
    jmp  ~/Projects/Hyomed/distributor/src/distributor-django/docker/development
    lrs  ~/Projects/Hyomed/e-lrs/src/elrs-django/docker/development
    epl  ~/Documents/golang/src/github.com/winespace/e-plus-learning
    sixp ~/Projects/Ncvc/sixp/src/sixp-django/docker/development
    dist ~/Projects/Hyomed/distributor/src/distributor-django/docker/development
    food ~/Projects/Kyoto-u/foodmodel/src/lifestyle-php/docker/dev
    cvs  ~/cvs
    etc  /etc
    );

source $HOME/.aliases
