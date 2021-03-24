#!/bin/bash -eux

(
    git clean -xfd
    ./build.sh clr+libs+host+packs+mono -configuration release -arch arm64 -cross /p:UseCrossGen2=false
    ./build.sh libs+host+packs+mono -configuration release -arch arm64 -cross /p:UseCrossGen2=false
    ./build.sh clr+libs+host+packs+mono -configuration release
    ./build.sh libs+host+packs+mono -configuration release

    say runtime build completed
) || say runtime build failed
