#!/usr/bin/env sh
clearName() {
  git filter-branch -f --env-filter '
  export GIT_AUTHOR_EMAIL="john@doe.com"
  export GIT_AUTHOR_NAME="John Doe"
  export GIT_COMMITTER_EMAIL="john@doe.com"
  export GIT_COMMITTER_NAME="John Doe"
  ' -- --all
  rm -rf .git/refs/original/
}
clearMessages() {
  git filter-branch -f --msg-filter 'printf " "'  -- --all
}
clearName
clearMessages
git push --force --tags origin 'refs/heads/*'

