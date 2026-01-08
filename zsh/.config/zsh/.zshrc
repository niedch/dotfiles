source $HOME/.config/zsh/homes.sh

for f in $ZSH_HOME/*.sh; do
  [[ $f != *install.sh ]] && source $f
done

source <(fzf --zsh)

export PATH="$HOME/.bin:$PATH"

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

export JDTLS_JVM_ARGS="-javaagent:$HOME/.config/nvim/lib/lombok.jar"

