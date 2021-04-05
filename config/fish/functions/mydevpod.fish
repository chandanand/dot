function mydevpod
  set -l shell /bin/bash
  set -l devpod_name canand.devpod-us-or
  SHELL=$shell ssh $devpod_name -t fish
end
