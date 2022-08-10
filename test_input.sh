#!/bin/bash

mkdir -p 'tmp'

yarn -s prettier --parser astro $1 2>/dev/null > tmp/formatted.astro
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit
fi
yarn -s prettier --parser astro tmp/formatted.astro 2>/dev/null > tmp/formatted_but_again.astro
SECOND_TRY=$?
if [ "$FIRST_TRY" -ne "$SECOND_TRY" ]; then
    echo "Difference found! different error codes: $FIRST_TRY v.s. $SECOND_TRY"
    exit 1
fi
diff tmp/formatted.astro tmp/formatted_but_again.astro
if [ $? -eq 1 ]; then
    echo "Difference found!"
    exit 1
fi
echo "No difference found"