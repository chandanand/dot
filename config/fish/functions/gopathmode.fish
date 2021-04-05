function gopathmode --description "Reset the monorepo direnv to the desired mode"
  set -l numArgs (count $argv)
  if test $numArgs -lt 1
    if test "$MONOREPO_GOPATH_MODE" = 1
      echo "MONOREPO_GOPATH_MODE is on."
    else
      echo "MONOREPO_GOPATH_MODE is off."
    end
    return
  end

  if test \( $numArgs -gt 1 \) -o \( $argv != "on" -a $argv != "off" \)
    echo -e "gopathmode [ on | off ]\n\t shows or sets MONOREPO_GOPATH_MODE"
    return
  end

  if test "$MONOREPO_GOPATH_MODE" = 1 -a $argv = "on"
    set -gx MONOREPO_GOPATH_MODE 1
    set -l repo (git config --get remote.origin.url)
    if test -n (strings match "go-code" $repo)
      direnv reload
    end
  else if test -n "$MONOREPO_GOPATH_MODE" -a $argv = "off"
    set -e MONOREPO_GOPATH_MODE
    set -l repo (git config --get remote.origin.url)
    if test -n (strings match "go-code" $repo)
      direnv reload
    end
  end
end
