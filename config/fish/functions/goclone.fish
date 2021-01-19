function goclone
  set -l team $argv[1]
  set -l repo $argv[2]
  set -l golocation $HOME/gocode/src/code.uber.internal

  if test -d $golocation/$team/$repo
    echo "$team/$repo already exists"
    return 1
  end

  if test ! -e $golocation/$team
    mkdir $golocation/$team
  end
  git clone --recurse-submodules gitolite@code.uber.internal:$team/$repo $golocation/$team/$repo
end
