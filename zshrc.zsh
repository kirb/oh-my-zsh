# path yo
[[ -z "$THEOS" ]] && export THEOS=/opt/theos

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/bin:/bin:/usr/sbin:/sbin:$THEOS/bin:$HOME/.rvm/bin
export MANPATH=/usr/local/share/man:$MANPATH

# language
export LANG=en_AU.UTF-8 LC_CTYPE=en_AU.UTF-8

# tmux
[[ ! -z "$SSH_CLIENT" && -z "$TMUX" ]] && (tmux attach || tmux)

# ssh
ssh-add >/dev/null

# oh my zsh
ZSH_THEME=kirb-powerlevel
DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS=true
ENABLE_CORRECTION=true
DEFAULT_USER=kirb
plugins=(battery brew pod safe-paste tmux)

source $ZSH/oh-my-zsh.sh

# other sources
source ~/.iterm2_shell_integration.zsh

# exports
export PROJ=~/Documents/Projects
export THEOS_DEVICE_IP=local THEOS_DEVICE_PORT=2222
export SDKVERSION= SIMVERSION=

export EDITOR='subl -w'
[[ ! -z "$SSH_CLIENT" ]] && export EDITOR=nano

export PERL_MB_OPT="--install_base \"$HOME/.perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"
export GOPATH=/usr/local/lib/go

[[ -z "$IPHONEOS_ROOT" ]] && export IPHONEOS_ROOT=~/sdks/ios/iPhoneOS.sdk
[[ -z "$IPHONE_SIMULATOR_ROOT" ]] && export IPHONE_SIMULATOR_ROOT=~/sdks/sim/iPhoneSimulator.sdk
export SDK="$IPHONEOS_ROOT" SIM="$IPHONE_SIMULATOR_ROOT"


# aliases
alias ls='ls -Fblapht --color'
alias grep='grep --color -rin --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
alias nic='$THEOS/bin/nic.pl'
alias logify='$THEOS/bin/logify.pl'
alias logos='$THEOS/bin/logos.pl'
alias nicify='$THEOS/bin/nicify.pl'
alias denicify='$THEOS/bin/denicify.pl'
alias kilall=killall
alias kilalll=killall
alias killlal=killall
alias killal=killall
alias killalll=killall
alias sl=ls
alias ks=ls
alias lks=ls
alias kls=ls
alias l=ls
alias s=ls
alias dc=cd
alias c=cd
alias d=cd
alias wget='wget --content-disposition'
alias anno=nano
alias lss=less
alias les=less
alias filesize='stat -c %s'
alias tview='open /Applications/TeamViewer.app'
alias dog=cat
alias git=hub
compdef hub=git
alias ssh='nocorrect ssh'
alias pxm='open -b com.pixelmatorteam.pixelmator'
alias psd='open -b com.adobe.Photoshop'
alias xcode='open -b com.apple.dt.xcode'
alias vboxmanage=VBoxManage
alias vbox=VBoxManage
alias play=afplay
alias finder='open -R'
alias plistbuddy=/usr/libexec/PlistBuddy
alias plbuddy=/usr/libexec/PlistBuddy
alias got=git
alias gti=git
alias gt=git
alias g=git
alias xcselect=xcode-select
alias xcsel=xcode-select
alias dpkg-deb='dpkg-deb -Zlzma'
alias reload='. ~/.zshrc'
alias cr='open -b com.google.Chrome'
alias vlc='open -b org.videolan.vlc'
alias strings='strings -a'
alias hop='hopper -e'

# functions
setdevice() {
	if [[ "$1" == "" ]]; then
		echo "Usage: `basename "$0"` device"
		return 1
	fi

	[[ "$1" == "local" ]] && export THEOS_DEVICE_PORT=2222 || THEOS_DEVICE_PORT=22
	export THEOS_DEVICE_IP=$1

	echo "$THEOS_DEVICE_IP:$THEOS_DEVICE_PORT"
}

xcswitch() {
	xcpath=/Applications/Xcode$1.app
	sudo xcode-select -switch "${xcpath}/Contents/Developer"
	echo "Switched to $(xcsel -print-path)"
}

xcopen() {
	# holy shit this is terrible
	if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"; then
		echo "Opening workspace"
		open *.xcworkspace
	elif test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"; then
		echo "Opening project"
		open *.xcodeproj
	else
		echo "Nothing found"
	fi
}
