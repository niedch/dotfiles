#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$PATH:$HOME/.sdkman/candidates/java/current/bin"
export PATH="$PATH:$HOME/.sdkman/candidates/maven/current/bin"

