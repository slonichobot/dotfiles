export TCFRAME_HOME=~/Applications/tcframe
alias tcframe=$TCFRAME_HOME/scripts/tcframe

alias ll='ls -al';
alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"
alias mathg='math -run "<<JavaGraphics\`"'
SUBL=~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkcd() {
	mkdir -p $1 && cd $1"/";
}
alias c="g++ -Wall -g -pedantic -std=c++11 -O2 -fstack-protector -Wno-variadic-macros main.cpp"
# alias rt='c && find *.in | xargs -I @ sh -c "echo Test @; ./a.out < @;"; lg "rt"'
alias r="c && ./a.out; lg 'r'"
alias main="cp ~/C/0.cpp ./main.cpp; lg 'main'; vim main.cpp"
alias mcp="cat main.cpp | pbcopy; lg 'mcp'"
tpf() {
    if [[ ! -e %1.cpp ]]; then 
        cp ~/C/0.cpp $1.cpp
        touch 1.in
    fi
    vim -p $1.cpp 1.in
}

rt() {
    c && find *$1.in | xargs -I @ sh -c "echo Test @; ./a.out < @;"
}

rtt() {
    c && for a in *$1.in; do echo "Test $a"; ./a.out < $a | diff - ${a:0:-3}.out $2; done
}

cdc() {
    # move up if in subdir
    if [[ `pwd | sed 's/.*\///' | sed 's/[a-z]/1/'` == '1' ]]
    then cd ..; fi
    # create folder
    mkdir $1 2>/dev/null
    cd $1
    # main file
    main
    lg "created"
    vim main.cpp
}

lg() {
    A='0'
    if [[ `pwd | sed 's/.*\///' | sed 's/[a-z]/1/'` == '1' ]]; then A=`pwd|sed 's/.*\///'`; cd ..; fi
    if [ "$*" ];
        then 
            echo `date "+%s $A: "`"$*" >> logfile; else cat logfile | tail
    fi
    if [[ $A != '0' ]]; then cd $A; fi
}

cd.() {
	cd ..
	echo `pwd`
}

alias pbc='pbcopy'

gg() {
	g++ -Wall -g -Wextra -pedantic -std=c++11 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -DSLONICHOBOT=1 -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fstack-protector -Wno-variadic-macros $1 -o $1.out && ./$1.out
}

alias g5='/usr/local/Cellar/gcc/5.2.0/bin/g++-5'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subls='subl "$SUBL"'


ggt() {
	g++ -Wall -pedantic -ansi -g -std=c++11 -DSLONICHOBOT=1 $1 -o $1.out && time ./$1.out
}
gi() {
	g++ -Wall -pedantic -ansi -g -std=c++11 -DSLONICHOBOT=1 $1 -o $1.out
	for A in `ls | grep "$2*" | grep ".in"`;
	do
		echo "### TEST $A"
		./$1.out < $A > "ans/"$A".ans"
	done
}

gitadd() {
	git add ./*; sleep .2; git reset www/upload/* www/.htaccess
}
export PATH=$PATH":/Users/simon/bin"
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export GDFONTPATH=/Users/simon/Library/Fonts

# maven
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.5
export M2=$M2_HOME/bin

# JACA
export JAVA_HOME=`/usr/libexec/java_home`

# MacPorts Installer addition on 2011-02-18_at_11:29:25: adding an appropriate PATH variable for use with MacPorts.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:$M2:$JAVA_HOME"/bin"
# Finished adapting your PATH environment variable for use with MacPorts.
export DYLD_FALLBACK_LIBRARY_PATH="/usr/X11/lib:/usr/lib:/opt/local/lib"

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; 
killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# Screenshots
alias resetScreenshotPath='defaults write com.apple.screencapture location ~/Desktop/;killall SystemUIServer'
saveScreenshostsTo() {
    defaults write com.apple.screencapture location "$*";killall SystemUIServer
}

#alias mysql='sudo /usr/local/mysql/support-files/mysql.server'

# TERIMNAL colors
setTerm() { PROFILE=${1}; echo "tell app \"Terminal\" to set current settings of first window to settings set \"${PROFILE}\""|osascript; };
setTermLight() { setTerm basic;}
setTermDark() { setTerm drk;}
##
# Your previous /Users/simon/.bash_profile file was backed up as /Users/simon/.bash_profile.macports-saved_2015-03-09_at_17:37:20
##

# MacPorts Installer addition on 2015-03-09_at_17:37:20: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# Cordova:
export PATH=${PATH}":~/Library/Android/sdk/"
export ANDROID_HOME=~/Library/Android/sdk

# COMPOSER
alias composer="php /usr/bin/composer.phar"

# Go
export GOPATH="/Users/simon/.go"
export PATH=${PATH}":"${GOPATH}"/bin/"

# git autocomplete
# if [ -f `brew --prefix`/etc/bash_completion ]; then
#     . `brew --prefix`/etc/bash_completion
# fi
# source ~/bin/git-flow-completion.bash

# DNVM (.NET Version Manager)
#source /usr/local/Cellar/dnvm/1.0.0-dev/libexec/dnvm.sh
#source /usr/local/Cellar/dnvm/1.0.0-dev/libexec/dnvm.sh
#export NVM_DIR="/Users/simon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# VIM
export VIM="~/.vim"
export VIMRUNTIME="/usr/share/vim/vim74"

# Initialization for FDK command line tools.Tue Oct 27 09:21:49 2015
FDK_EXE="/Users/simon/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/simon/bin/FDK/Tools/osx"
export PATH
export FDK_EXE


# ________________________________________________

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=/Users/simon/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel9k" #"powerlevel9k" #"robbyrussell"
ZSH_THEME="crunch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncommentgnoster" the following line to change how often to auto-update (in days).
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

# User configuration

# POWERLEVEL CUSTOMIZATION
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)

export PATH="/Users/simon/.nvm/versions/node/v4.2.1/bin:/Users/simon/.dnx/runtimes/dnx-mono.1.0.0-beta7/bin:/Users/simon/.dnx/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/simon/bin:/opt/local/bin:/opt/local/sbin:/usr/local/apache-maven/apache-maven-3.2.5/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/bin:~/Library/Android/sdk/:/Users/simon/.go/bin/:/Users/simon/bin/FDK/Tools/osx"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#tmux
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#cd history
setopt AUTO_PUSHD
setopt PUSHD_MINUS
setopt CDABLE_VARS
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

#autojump
 [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

lazycommit() {
    git add -A
    git -c color.status=false status \
    | gsed -n -r -e '1,/Changes to be committed:/ d' \
            -e '1,1 d' \
            -e '/^Untracked files:/,$ d' \
            -e 's/^\s*//' \
            -e '/./p' \
    | git commit -F -
}


# transfer
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer 
