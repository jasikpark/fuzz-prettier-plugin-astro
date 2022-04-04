#!/bin/bash

echo "backing up to tmp/input.astro.bak"
cp tmp/input.astro tmp/input.astro.bak
delta -in_place -test=reduce_test_case_multidelta.sh -suffix=.astro tmp/input.astro