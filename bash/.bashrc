#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load aliases
[ -f ~/.alias ] && source ~/.alias

PS1='[\u@\h \W]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Oh-my-posh
eval "$(oh-my-posh init bash --config ~/.illusi0n.omp.json)"
