PATH=$PATH:/Applications/android-sdk-macosx/platform-tools
PATH=$PATH:/usr/bin:/usr/sbin/:/usr/local/bin
PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/X11/bin
PATH=$PATH:/System/Library/Frameworks
PATH=$PATH:/usr/local/heroku/bin
PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
PATH=$PATH:$HOME/.rbenv/bin
PATH=$PATH:$HOME/bin
export PATH

export GOPATH=$HOME/Documents/golang
export GOROOT=`go env GOROOT`
PATH=$PATH:$GOROOT:$GOPATH/bin

export CDJ_DIR_MAP=(
    hw   ~/Projects/Hapyson/src/Hapyson_web
    jmp  ~/Projects/Hyomed/distributor/src/distributor-django/docker/development
    cvs  ~/cvs
    etc  /etc
    );

source ~/.aliases
