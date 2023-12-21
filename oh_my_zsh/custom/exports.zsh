
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


export TERMINAL="alacritty"
export NAME="Nemo D'ACREMONT"
export MAIL="nemo.dacremont@enseirb-matmeca.fr"
export PATH=$PATH:/home/odasta/.my_scripts

# SSH-Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

