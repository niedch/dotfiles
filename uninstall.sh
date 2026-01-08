#!/bin/bash

for dir in */; do
  if [[ $dir != .* ]]; then
    stow -D $dir -t $HOME
  fi 
done
