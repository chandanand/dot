function arcupdate
  git checkout master; and git pull origin master; and git checkout $argv; and git rebase master
end
