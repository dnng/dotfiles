# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"                 # Uncomment to use case-sensitive completion.
# DISABLE_AUTO_UPDATE="true"            # Uncomment to disable bi-weekly auto-update checks.
# export UPDATE_ZSH_DAYS=13             # Uncomment to change how often to auto-update (in days).
# DISABLE_LS_COLORS="true"              # Uncomment to disable colors in ls.
# DISABLE_AUTO_TITLE="true"             # Uncomment to disable auto-setting terminal title.
# ENABLE_CORRECTION="true"              # Uncomment to enable command auto-correction.
# COMPLETION_WAITING_DOTS="true"        # Uncomment to display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY="true"    # Uncomment the following line if you
                                        # want to disable marking untracked
                                        # files under VCS as dirty. This makes
                                        # repository status check for large
                                        # repositories much, much faster.
HIST_STAMPS="mm/dd/yyyy"                # Uncomment the following line if you
                                        # want to change the command execution
                                        # time stamp shown in the history
                                        # command output. The optional three
                                        # formats:
                                        # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"


export GOPATH=$HOME/.go
export GOBIN=${GOPATH}/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.8` #JAVA_HOME
export M2_HOME=/usr/local/maven-3.0.5
export MAVEN_OPTS=-Xmx1024m

# ZSH_CUSTOM=/path/to/new-custom-folder # Would you like to use another custom folder than $ZSH/custom?
plugins=(git osx npm node aws gradle mvn go colored-man-pages command-not-found cp extract vundle node pip)
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/share/dotnet
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8 # You may need to manually set your language environment

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# export ARCHFLAGS="-arch x86_64" # Compilation flags
export SSH_KEY_PATH="~/.ssh/cmusvcloudcomputing.pem" # ssh

alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias ipython="ipython --nosep --colors=Linux"
alias ls='gls --color=auto --group-directories-first'
alias lo='ls -lAX --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

setopt BRACE_CCL # Set brace expansion
export MACOSX_DEPLOYMENT_TARGET=10.10 # remove this kern.osversion

# Exporting adb
if [ -d "/Users/dnoguchi/Library/Android/sdk/platform-tools" ] ; then
      export PATH="/Users/dnoguchi/Library/Android/sdk/platform-tools:$PATH"
fi

export CLOUD="Google Drive/CMU/Fall 2015/Cloud Computing/"
source /usr/local/share/zsh/site-functions/_aws # Autocomplete functions for AWS CLI

