#!/bin/bash -eux

(
    ./build.sh clr+libs+host+packs+mono -configuration release
    ./build.sh libs+host+packs+mono -configuration release

    say runtime build completed
) || say runtime build failed
