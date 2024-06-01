# ls
alias ls='ls --color=auto'
alias ll='ls -lah'

# mkdir
alias mkdir='mkdir -p'

# Git
alias gs='git status'
alias gl='git --no-pager log --oneline --graph --decorate --all -15'
alias gll='git log --oneline --graph --decorate --all' # Use --no-pager here as well?
alias gaa='git add -A'
alias gc='git commit'

# Replace Vim with Neovim
if [ -x "$(command -v nvim)" ]; then
  alias vim='nvim'
fi

if [ -x "$(command -v neovide)" ]; then
    alias nv='neovide --fork'
fi

alias v='vim'

# Replace cat with bat (batcat if on debian)
if [ -f "/etc/debian_version" ]; then
	alias cat='batcat --paging=never'
else
	alias cat='bat --paging=never'
fi
