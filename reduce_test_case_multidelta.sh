#!/bin/bash


# use delta (https://web.archive.org/web/20170730171602/http://delta.tigris.org/using_delta.html)
# to minimize the test case using the output of `test_input.sh`

mkdir -p 'tmp'
TMP_DIR="$HOME/Github/fuzz-prettier-plugin-astro/tmp"
PRETTIER="$HOME/Github/fuzz-prettier-plugin-astro/node_modules/.bin/prettier"

"$PRETTIER" --parser astro $TMP_DIR/input.astro 2>/dev/null > "$TMP_DIR/formatted.astro"
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit 1
fi
"$PRETTIER" --parser astro "$TMP_DIR/formatted.astro" 2>/dev/null > "$TMP_DIR/formatted_but_again.astro"
SECOND_TRY=$?
diff "$TMP_DIR/formatted.astro" "$TMP_DIR/formatted_but_again.astro"
if [ $? -eq 1 ]; then
    echo "Difference found!"
    exit 0
fi
exit 1