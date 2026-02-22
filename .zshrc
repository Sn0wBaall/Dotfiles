# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
fastfetch
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Cargar Powerlevel10k theme
source /home/user/powerlevel10k/powerlevel10k.zsh-theme

##--- ZSH PLUGINS ---##

# zsh-autosuggestions Plugin
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting Plugin
if [ -f /usr/share/zsh/plugins//zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh-sudo Plugin
if [ -f /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh ];then
  source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
fi

# Cargar configuración de Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Habilitar el sistema de autocompletado de Zsh --- #

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# --- Funciones personalizadas --- #
# Función para guardar IP y nombre de máquina
function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > /home/user/.config/bin/target
}

# Función para borrar la configuración de IP y nombre de máquina
function cleartarget(){
    echo '' > /home/user/.config/bin/target
}

# Función para extraer puertos de un archivo
function extractPorts(){
    endColour="\033[0m\e[0m"
    redColour="\e[0;31m"
    blueColour="\e[0;34m"
    yellowColour="\e[0;33m"
    purpleColour="\e[0;35m"
    turquoiseColour="\e[0;36m"
    grayColour="\e[0;37m"
    BgreenColour="\e[1;32m"
    BendColour="\033[0m\e[0m"
    BredColour="\e[1;31m"
    BblueColour="\e[1;34m"
    ByellowColour="\e[1;33m"
    BpurpleColour="\e[1;35m"
    BturquoiseColour="\e[1;36m"
    BgrayColour="\e[1;37m"

    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n${ByellowColour}[*]${endColour}${grayColour} Extracting information...${endColour}\n" > extractPorts.tmp
    echo -e "\t${BgreenColour}[*]${endColour}${grayColour} IP Address:${endColour}${purpleColour} $ip_address${endColour}"  >> extractPorts.tmp
    echo -e "\t${BgreenColour}[*]${endColour}${grayColour} Open ports:${endColour}${purpleColour} $ports${endColour}\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "${BturquoiseColour}[*]${endColour}${grayColour} Ports copied to clipboard${endColour}\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
}

# Función para crear directorios de trabajo
function mkt(){
    mkdir {nmap,content,exploits,scripts,fuzzing}
}

## --- Configuración del Historial --- ##
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

## --- Aliases Personalizados --- ##
# Alias para `bat`


    pulldown-cmark-mdcat 2.7.1 was yanked

    mdcat 2.7.1 requires exactly that version (=2.7.1)

    Cargo refuses to build with yanked versions

    Result → dependency resolution failure
alias cat='bat --theme Coldark-Dark'
alias catn='bat --theme Coldark-Dark --style=plain'
alias catnp='bat --theme Coldark-Dark --style=plain --paging=never'

# Alias para `ls` usando `lsd`
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

alias grep='grep --color=auto'

export PATH="$PATH:/opt/nvim/bin"

export GTK_THEME=Tokyonight-Dark
export XDG_CURRENT_DESKTOP=bspwm
export QT_STYLE_OVERRIDE=Fusion
export QT_QPA_PLATFORMTHEME=gtk3
export TERMINAL=kitty
