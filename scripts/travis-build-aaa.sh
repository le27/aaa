#!/usr/bin/env bash

# If a command fails, exit this script with an error code
set -e

################################################################################
# Compile Digraphs and install Digraphs lib
if [ "$SUITE" != "lint" ]; then
  echo -e "\nCompiling the Aaa package..."
  cd $HOME/gap/pkg/aaa
fi
