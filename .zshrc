# ZSH Config
# For Linux and MacOS

################################################################
#### ZSH Options

setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY


################################################################
#### ZSH Prompt

#PS1=$'%F{red}>%F{yellow}>%F{green}>%f '
#PS1=$'[%F{blue}%n%f@%F{magenta}%m%f] %~\n%F{red}>%F{yellow}>%F{green}>%f '
PS1=$'[%F{blue}%~%f] %F{red}>%F{yellow}>%F{green}>%f '

################################################################
#### Path exports

#if [[ "$(uname -s)" == "Darwin" ]]; then
#	export PATH="/opt/homebrew/bin:$PATH"
#	export PATH="/opt/homebrew/opt/jupyterlab/bin:$PATH"
#elif [ "$(uname -s)" == "Linux" ]]; then
#   echo""
#fi


################################################################
#### Functions

# Linux: Open file with XDG set default program
if [[ "$(uname -s)" == "Linux" ]]; then
  open () {
    xdg-open "$1" 2>/dev/null
  }
fi


# File Extractor
extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Open the web source of the git repo
gitopen()
{
  open $(git remote get-url origin)
}

# Download thumbnail of YouTube video
ythumb() {
  if [ -z "$1" ]; then
    echo "Usage: ythumb VIDEO_ID"
    return 1
  fi

  VIDEO_ID="$1"
  URL="https://img.youtube.com/vi/${VIDEO_ID}/maxresdefault.jpg"

  # Check if wget is installed
  if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install wget first."
    return 1
  fi

  # Download the thumbnail
  wget -O "${VIDEO_ID}_thumbnail.jpg" "$URL"

  if [ $? -eq 0 ]; then
    echo "Thumbnail downloaded as ${VIDEO_ID}_thumbnail.jpg"
  else
    echo "Failed to download thumbnail. Please check the VIDEO_ID."
  fi
}


################################################################
#### General aliases

alias cp="cp -i"
alias rm="rm -i"
alias cl="clear"
alias testdisk="sudo testdisk"
alias shell="which $SHELL"


################################################################
#### Color aliases for common commands

alias ls='ls --color=auto'
alias lsa='ls -lah --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


################################################################
#### Fun aliases

alias neo="neofetch"
alias fetch="neofetch"
alias bonsai="cbonsai"


#############################e###################################
#### Dev aliases

# Python
alias pip="pip3"
alias python="python3"

# NPM/JS
alias npmrun="npm run dev -- --open"

# Text Editors
alias vim="nvim"
alias vi="vim"


################################################################
#### Linux only aliases

if [[ "$(uname -s)" == "Linux" ]]; then

	# Linux C/C++ compilers
	alias c="gcc"
	alias c++="g++"

	# VSCode for Linux
	alias vscode="flatpak run com.visualstudio.code"
	alias vs="vscode"

	# Linux: Window Control Buttons
	alias wcb_full="gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'"
	alias wcb_part="gsettings set org.gnome.desktop.wm.preferences button-layout ':maximize,close'"
	alias wcb_close="gsettings set org.gnome.desktop.wm.preferences button-layout ':close'"
	alias wcb_none="gsettings set org.gnome.desktop.wm.preferences button-layout ':'"

	# Update and upgrade flatpak
	alias dnfup="sudo dnf update && sudo dnf upgrade"

	# Update and upgrade snap

	# Update and upgrade arch, debian, fedora(rpm, yum and dnf), amazon linux
	
	# Update brew (Linux)
	alias brewup="brew update && brew upgrade"


################################################################
#### macOS only aliases

elif [[ "$(uname -s)" == "Darwin" ]]; then

	# macOS C/C++ compilers
	alias c="clang"
	alias c++="clang++"

	# VSCode for MacOS
	alias vscode="open -a /Applications/Visual\ Studio\ Code.app"
	alias vs="vscode"

	# Update brew (macOS)
	alias brewup="brew update && brew upgrade && brew upgrade --cask --greedy"

	# macOS screenshot commands
	alias screencap_default_jpg="defaults write com.apple.screencapture type jpg"
	alias screencap_default_png="defaults write com.apple.screencapture type png"

	# macOS dock commands
	alias dock_default="defaults delete com.apple.dock autohide-delay; defaults delete com.apple.dock autohide-time-modifier; killall Dock"
	alias dock_fast="defaults write com.apple.dock autohide-delay -int 0; defaults write com.apple.dock autohide-time-modifier -float 0.3 ;killall Dock"
	alias dock_vfast="defaults write com.apple.dock autohide-delay -int 0; defaults write com.apple.dock autohide-time-modifier -float 0.15 ;killall Dock"
	alias dock_instant="defaults write com.apple.dock autohide-delay -int 0; defaults write com.apple.dock autohide-time-modifier -int 0 ;killall Dock"
fi
