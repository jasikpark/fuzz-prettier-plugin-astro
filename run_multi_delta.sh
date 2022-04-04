#!/bin/bash

multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.astro
multidelta -level=10 ./reduce_test_case_multidelta.sh tmp/input.astro