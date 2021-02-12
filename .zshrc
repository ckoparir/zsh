# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:/usr/include/**:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh
export EDITOR="vim"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
#
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	git
	colored-man
	colorize
	github
	jira
	vagrant
	virtualenv
	pip
	python
	brew
	osx
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Terminal definition for i3wm
export TERM=xterm
export TERMINAL=$TERM

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# gtags library path globally
export GTAGSLIBPATH=$HOME/.gtags/

# Linux and system specific library path
export LD_LIBRARY_PATH="/usr/lib/modules/5.9.14-arch1-1/build/include"
export PATH="$LD_LIBRARY_PATH:$PATH"
export PRJ="/home/$USER/Documents/Projects"

export PKG_CONFIG_PATH="/usr/lib64/pkgconfig"
export PATH="/home/$USER/.emacs.d/bin:$PATH"
export PATH="/home/$USER/.local/bin:$PATH"
export XDG_DATA_HOME="/home/$USER/.local/share/vim-lsp-settings/servers"

# Android and Java development envoironment 
export ANDROID_SDK="$HOME/Android/Sdk"
export ANDROID_NDK="$ANDROID_SDK/ndk/21.1.6352462"
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_NDK_HOME=$ANDROID_NDK
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$ANDROID_NDK:$PATH"
export PATH="$ANDROID_SDK/platform-tools:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

# Global npm package installations (without sudo)
export PATH="$HOME/.npm-global/bin:$PATH"

# Add golang to the path
export PATH="$HOME/.local/share/applications/go/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias em="emacs -nw"
alias mefi="sudo diskutil mount /dev/disk0s1"
alias vi="vim"
alias mem_check="valgrind -s"

function prof_check() {
    sh -c ${1};
    if [[ -f gmon.out ]] 
    then
        echo ${1} " is profiling...";
        gprof -b ${1} gmon.out;
    else
        echo "gmon.out not found!";
    fi
}

function perf_check() {
    perf record ${1};
    perf report | more;
}

export NVM_DIR="/Users/caglar/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

