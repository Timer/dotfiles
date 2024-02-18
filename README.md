# dotfiles

## Bootstrap

```bash
mkdir -p ~/.local/bin
command -v starship >/dev/null 2>&1 || curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin

# install homebrew:
zsh -c 'uname | grep -q "Darwin" && (command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")'

# install fish:
zsh -c 'command -v fish >/dev/null 2>&1 || (uname | grep -q "Darwin" && brew install fish || sudo dnf install -y fish)'

# change shell:
zsh -c 'if [[ "$(uname)" == "Darwin" ]]; then fish_path=$(which fish); if [ -n "$fish_path" ] && grep -q "$fish_path" /etc/shells; then echo "Fish shell exists."; chsh -s "$fish_path"; else echo "Fish shell does not exist in /etc/shells. Adding it..."; echo "$fish_path" | sudo tee -a /etc/shells; echo "Switching to Fish shell..."; chsh -s "$fish_path"; fi; else echo "Not running on macOS."; fi'

cd; curl -#L https://github.com/timer/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md}
```
