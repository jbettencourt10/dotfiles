#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

show_spotify_track() {
  if [[ $(tell_spotify "running") = "true" ]]
  then
    if [[ $(tell_spotify "player state") = "playing" ]]
    then
      echo "$(tell_spotify "name of current track")"
    fi
  fi
}
show_spotify_track$@
