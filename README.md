# dotfiles

## Bootstrap

```bash
# allow sudo in terminal:
awk '/sudo_local/{print;print "auth sufficient pam_tid.so";next}1' /etc/pam.d/sudo | sudo tee /etc/pam.d/sudo > /dev/null

# setup local bin:
mkdir -p ~/.local/bin

# install prompt:
command -v starship >/dev/null 2>&1 || curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin

# install homebrew:
zsh -c 'uname | grep -q "Darwin" && (command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")'

# install fish:
zsh -c 'command -v fish >/dev/null 2>&1 || (uname | grep -q "Darwin" && brew install fish || sudo dnf install -y fish)'

# change shell:
zsh -c 'if [[ "$(uname)" == "Darwin" ]]; then fish_path=$(which fish); if [ -n "$fish_path" ] && grep -q "$fish_path" /etc/shells; then echo "Fish shell exists."; chsh -s "$fish_path"; else echo "Fish shell does not exist in /etc/shells. Adding it..."; echo "$fish_path" | sudo tee -a /etc/shells; echo "Switching to Fish shell..."; chsh -s "$fish_path"; fi; else echo "Not running on macOS."; fi'

# set computer name:
sudo scutil --set ComputerName "timers-mbp-m3max"
sudo scutil --set HostName "timers-mbp-m3max"
sudo scutil --set LocalHostName "timers-mbp-m3max"

cd; curl -#L https://github.com/timer/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md}
```
