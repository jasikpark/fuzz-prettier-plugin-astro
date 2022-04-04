#!/bin/bash

mkdir -p 'artifacts'
mkdir -p 'tmp'

trap "exit" SIGHUP SIGINT SIGTERM

for i in {0..1000000}; do
    radamsa ../prettier-plugin-astro/test/fixtures/*/**.astro > tmp/input.astro
    ./test_input.sh tmp/input.astro
    if [ $? -ne 0 ]; then
        CRASHFILENAME=artifacts/crash-`date +%s`.astro
        echo "copied failing output to $CRASHFILENAME"
        cp tmp/input.astro "$CRASHFILENAME"
        exit
    fi
done
