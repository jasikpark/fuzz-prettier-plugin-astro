required dependencies:

- [radamsa](https://gitlab.com/akihe/radamsa)
- yarn
- diff
- [delta](https://web.archive.org/web/20170805142100/delta.tigris.org/)

clone the `prettier-plugin-astro` repo next to this repo so that we can access fixtures in `../prettier-plugin-astro/tests/fixtures...`

make sure prettier and prettier-plugin-astro are up-to-date

run `./fuzz-prettier-plugin-astro.sh` until you get a crash

to reduce a test case:

```sh
./run_multi_delta.sh
```

and it'll make a backup of `tmp/input.astro` and then reduce the case

to test whether an input file has a bug, run `./test_input.sh $FILENAME`, ex `./test_input.sh tmp/input.astro`