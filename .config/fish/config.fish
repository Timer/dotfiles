# snooze motd
set -U fish_greeting "🐟"

# setup local bin
fish_add_path -m ~/.local/bin

# setup brew
/opt/homebrew/bin/brew shellenv | source

# init starship prompt
# sh -c "$(curl -fsSL https://starship.rs/install.sh)"
starship init fish | source

# load generic profile
cat ~/.profile | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
