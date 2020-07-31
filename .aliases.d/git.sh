# -----------------------------------------------------------------------------
# General Git aliases
# -----------------------------------------------------------------------------
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log'
alias gco='git checkout'
alias gs='git status -sb | sort -bf'

# -----------------------------------------------------------------------------
# Push a repository to the `backup` remote
# Provides an easy way to maintain a separate copy of a repository.
# -----------------------------------------------------------------------------
backup () {
  # Check if the 'backup' remote exists. If it doesn't, we're done
  git remote | grep 'backup' &> /dev/null
  if [[ $? -ne 0 ]]; then
    echo '----------------------------------------'
    echo ' `backup` remote not configured         '
    echo '........................................'
    echo ' Run `git remote add backup <repo>`     '
    echo '----------------------------------------'
    return 0
  fi

  # Retrieve the current git branch
  current_branch=$(git symbolic-ref --short HEAD)

  # Push the current branch to the `backup` remote
  echo '----------------------------------------'
  echo " Backing up ${current_branch} branch    "
  echo '........................................'

  git push backup ${current_branch}

  echo '........................................'
  echo " ${current_branch} branch backed-up     "
  echo '----------------------------------------'
}
