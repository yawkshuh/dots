# ls
alias ll='ls -lah'

# replace cat with bat (batcat if on debian)
if [ -f "/etc/debian_version" ]; then
	alias cat='batcat --paging=never'
else
	alias cat='bat --paging=never'
fi


# mkdir
alias mkdir='mkdir -p'

# Git
alias gs='git status'
alias gl='git log --oneline --graph --decorate --all'
alias gaa='git add -A'
alias gc='git commit'
