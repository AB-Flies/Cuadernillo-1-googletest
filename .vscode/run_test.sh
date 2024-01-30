#!/bin/bash

if [[ $1 == *"Test" ]]; then
  ./tests/executables/"$1"
else
  ./tests/executables/"$1"Test
fi
