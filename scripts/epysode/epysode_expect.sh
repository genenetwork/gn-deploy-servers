#! /bin/bash

# ---- for sheepdog
source $(dirname "$0")/sheepdog_env.sh

sheepdog_expect.rb --filter penguin2 $*
