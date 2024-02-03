
export PATH=$PATH:/home/odasta/.local/bin
# export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/nv_vulkan_wrapper.json

# Source node & nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="firefox"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(/usr/bin/ssh-agent -s)"
/usr/bin/ssh-agent -s >> $HOME/.ssh/ssh-agent 2>> $HOME/.ssh/ssh-agent.err

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx 2>> $HOME/.startx.err >> $HOME/.startx.out
fi


