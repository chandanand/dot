function pass -d "Get passwork from 1password"
  if not set -q OP_SESSION_my
    eval (op signin my)
  end
  
  op get item $argv |jq -r '.details.fields[] |select(.designation=="password").value' |pbcopy
end
