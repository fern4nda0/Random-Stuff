#!/usr/bin/bash

fn() {
  YEAR="1970"
  # echo "username: "
  # read -r USERNAME
  # echo "GitHub remote_url token: "
  # read -r URL

  # [ -z "$USERNAME" ] && { echo "Error: Username cannot be empty"; exit 1; }
  # [ -z "$URL" ] && exit 1  

  echo "program hello_world
  implicit none
  print *, \"Hello, World!\"
  end program hello_world    " \
    >hello_world.f90
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    { echo "Error: Not a git repo " ; exit 1; }
  fi
  git config user.name "0x000000" && git config user.email "0x000000@noreply.com"
  git add hello_world.f90
  GIT_AUTHOR_DATE="${YEAR}-01-01T16:00:00" \
  GIT_COMMITTER_DATE="${YEAR}-01-01T16:00:00" \
  git commit -m "hello_world!"
  # git remote add origin "${URL}"
  # git branch -M main
  # git push -u origin main -f
  git push 

  echo
  echo "Done"
} 
fn
unset -f fn
