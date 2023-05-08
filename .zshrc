# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/josue/micromamba";
__mamba_setup="$('/usr/bin/micromamba' shell hook --shell zsh --prefix '/home/josue/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/josue/micromamba/etc/profile.d/mamba.sh" ]; then
        . "/home/josue/micromamba/etc/profile.d/mamba.sh"
    else
        export PATH="/home/josue/micromamba/bin:$PATH"
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# opam configuration
[[ ! -r /home/josue/.opam/opam-init/init.zsh ]] || source /home/josue/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/SMT-Provers
export PATH=$PATH:~/Scripts
export PATH=$PATH:~/.emacs.d/bin


function pdfcompress(){
    gs -sDEVICE=pdfwrite -dCompatibility=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$2 $1
}

alias diff='diff --color'
alias rel='source ~/.zshrc'
alias e='emacs &'
alias enw='emacs -nw'

function gcom(){
    git commit -m $1
}

alias gadd='git add'
alias glog='git log'
alias gdiff='git diff'
alias gst='git status'
alias gignore='function _(){ echo "\n$1" >> .gitignore }; _'

export PATH="$PATH:/home/josue/.local/share/coursier/bin"

# function gignore(){
#     echo "\n$1" >> .gitignore
# }

alias ocamllsp='ocamllsp --fallback-read-dot-merlin'
alias deskmon='hyprctl keyword monitor "eDP-1, 1920x1080, 2560x0, 1"'

export PATH="$PATH:/home/josue/.config/emacs/bin"
export PATH="$PATH:$HOME/.config/rofi/scripts"

eval "$(dircolors ~/.dircolors)";
alias l=ls

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

