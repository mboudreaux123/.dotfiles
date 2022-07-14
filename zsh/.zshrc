###############################################################
#### Environmental Variables
export ZSH="/home/michael/.config/.oh-my-zsh"
PATH=~/bin:$PATH

###############################################################
#### Load Oh My Zsh and settings
ZSH_THEME="passion"
ENABLE_CORRECTION="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

###############################################################
#### Settings
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

###############################################################
#### Aliases
alias jv=java
alias py=python3
alias python=python3
alias neo=neofetch
alias v=vim
alias edit=vim
alias ls='ls --color=auto'
alias lsa='ls -lah --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cp='cp -i'
alias cd..='cd ..'
alias ..='cd ..'
alias rm='rm -i'
alias doas='doas --'
alias clpkg='sudo pacman -R $(pacman -Qdtq)'
alias die='shutdown now'
alias gksu=pkexec
alias gksudo=pkexec
alias yay=paru
alias y=yes
alias extract=ex
alias up=update
alias upgrade=update
alias font='fc-cache -f -v'
alias grap='gsettings reset org.gnome.shell app-picker-layout'
alias nobuttons='gsettings set org.gnome.desktop.wm.preferences button-layout :'
alias closebutton='gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:close'
alias winbuttons='gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close'
alias macbuttons='gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:appmenu'

###############################################################
#### Prompt
#PROMPT='%F{red}>%F{yellow}>%F{green}> %f'

###############################################################
#### Functions

## File Extractor
ex()
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

## Full System Update
update()
{
    bash ~/Tools/update_system.sh
} 

gpufreq()
{
  bash ~/Tools/gpufreq.sh $@
}
