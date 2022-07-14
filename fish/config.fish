if status is-interactive
    # Commands to run in interactive sessions can go here
end

## Variables
set fish_greeting
set TERM "xterm-256color"

## Aliases
alias jv=java
alias py=python3
alias python=python3
alias neo=neofetch
alias v=nvim
alias vim=nvim
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
alias hyprland='Hyprland'


## Functions
function update
    bash ~/Tools/update_system.sh
end

function gpufreq
  bash ~/Tools/gpufreq.sh $argv
end

function nexprompt
    ## Define colors
    set -l shellStat $status
    set redBold (set_color --bold red)
    set yellowBold (set_color --bold yellow)
    set greenBold (set_color --bold green)
    set blueBold (set_color --bold blue)
    set purpleBold (set_color --bold purple)
    set reset (set_color white)

    ## Determine shell status
    if test $shellStat = 0
        set statprompt "$redBold>$yellowBold>$greenBold>"
    else
        set statprompt "$redBold>$redBold>$redBold>"
    end

    echo "$statprompt "
end

function fish_prompt
    nexprompt
end