echo "Installing zsh"
sudo pacman -Sy --needed zsh

echo "Installing fzf"
rm -rf $HOME/.local/share/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.local/share/fzf
$HOME/.local/share/fzf/install --all --no-update-rc

echo "Installing forgit"
rm -rf $HOME/.local/share/forgit
git clone --depth 1 https://github.com/wfxr/forgit.git $HOME/.local/share/forgit

echo "Installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing zvm (Zig Version Manager)"
curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash

