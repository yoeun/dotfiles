# OS X uses .bash_profile
# But we prefer to store our bash settings in .bashrc instead for cross platform reasons
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
