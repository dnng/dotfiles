# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
# Add timestamp to history
HIST_STAMPS="mm/dd/yyyy"

export JAVA_HOME=$(/usr/libexec/java_home)
export M2_HOME=/usr/local/maven-3.0.5
export MAVEN_OPTS=-Xmx1024m

plugins=(gitfast npm gradle mvn go colored-man-pages pip)
source $ZSH/oh-my-zsh.sh

# User configuration
set_path() {
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    export PATH=$PATH:/usr/local/sbin
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin
    export PATH=$PATH:/usr/local/share/dotnet
    export PATH="/usr/local/heroku/bin:$PATH"
    export MANPATH="/usr/local/man:$MANPATH"
}
set_path

export LANG=en_US.UTF-8
export EDITOR='vim'
alias ipython="ipython --nosep --colors=Linux"
alias ls='gls --color=auto --group-directories-first'
alias lo='ls -lAX --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ctags="`brew --prefix`/bin/ctags"

# Expand strings between braces
# See http://zsh.sourceforge.net/Doc/Release/Expansion.html#Brace-Expansion
setopt BRACE_CCL # Set brace expansion

# Exporting adb
if [ -d "/Users/dnoguchi/Library/Android/sdk/platform-tools" ] ; then
      export PATH="/Users/dnoguchi/Library/Android/sdk/platform-tools:$PATH"
fi

# Autocomplete functions for AWS CLI
source /usr/local/share/zsh/site-functions/_aws

# My way to set GOPATH (yes, I want multiple workspaces!)
set_gopath() {
    # First, set the GOPATH to the project directory
    export GOPATH=${PWD}:~/.go

    # Lastly, update the PATH
    set_path
    export PATH=$PATH:${GOPATH//://bin:}/bin
}

function set_title {
    echo -ne "\033]0;"$*"\007"
}

