fastfetch #--logo-type file --logo "$(ls ~/.config/fastfetch/ascii_logos | shuf -n 1 | xargs -I {} echo ~/.config/fastfetch/ascii_logos/{})"
# Guardar historial en archivo
HISTFILE=~/.zsh_history

# Número de comandos a guardar en memoria y archivo
HISTSIZE=10000
SAVEHIST=10000

# Opciones para mejorar el historial
setopt append_history             # Añadir en vez de sobrescribir
setopt inc_append_history         # Guardar comandos inmediatamente
setopt share_history              # Compartir entre múltiples sesiones
setopt hist_ignore_dups           # Ignorar duplicados consecutivos
setopt hist_reduce_blanks         # Eliminar espacios innecesarios

#confirmar que la ruta escrita este bien
autoload -Uz compinit
compinit

# Activar autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'


# Habili
bindkey '^[[H' beginning-of-line     # Inicio
bindkey '^[[F' end-of-line           # Fin

# Construir el prompt
PROMPT="%F{blue} %f   %F{green}  %n %f   %F{magenta}%~%f
%F{blue}❯%f "

export PATH=$PATH:/home/jeftly/.spicetify

alias chamba="sudo openvpn echoCTF.ovpn"
#alias proteus="WINEPREFIX=~/proteus-wine wine ~/proteus-wine/drive_c/Program\ Files\ \(x86\)/Labcenter\ Electronics/Proteus\ 7\ Professional/BIN/ARES.EXE"
alias matlab="LD_LIBRARY_PATH=/home/jeftly/Documents/usr/lib/ /usr/local/MATLAB/R2024b/bin/matlab"
alias cyber="sudo cp ~/ufw_ctf.rules /etc/ufw/user.rules && sudo ufw reload"
alias normal="sudo cp ~/ufw_secure.rules /etc/ufw/user.rules && sudo ufw reload"
