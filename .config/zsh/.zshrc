#-----------------------------------------------------------------------------------------------------------------------------#
#           .___
#  ____   __| _/  Sarbagya Nepal (Coded-Dolphin)
#_/ ___\ / __ |   https://www.youtube.com/coded-dolphin
#\  \___/ /_/ |   https://gitlab.com/coded-dolphin
# \___  >____ |   
#     \/     \/   My zsh config nothing much to see here pretty standard stuff 
#-----------------------------------------------------------------------------------------------------------------------------#

#Vim binding for zsh
#bindkey -v

#Custom Prompt
PROMPT='%F{blue} %F{red}| %F{blue}%1~%f %F{red} '

#Git Right Side Prompt:
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#Case Insensitive Tab Completion: 
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#Defult apps?
export TERMINAL='st'
export BROWSER='firefox'
export EDITOR='nvim'

#Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#Alias
alias v='nvim'
alias la='exa -la --color=always --group-directories-first --icons'
alias ls='exa -a --color=always --group-directories-first --icons'
alias l='exa --color=always --group-directories-first --icons'
alias :q='exit'
alias :wq='exit'
alias m='mocp'
alias fm='ranger'

#history file
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

#Start
fm6000 -dog -c blue
# neofetch

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
