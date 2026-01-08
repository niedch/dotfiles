source $HOME/.config/zsh/.zshrc

source <(fzf --zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cn669600/glcoud/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cn669600/glcoud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cn669600/glcoud/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cn669600/glcoud/google-cloud-sdk/completion.zsh.inc'; fi

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
