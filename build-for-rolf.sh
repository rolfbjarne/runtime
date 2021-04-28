#!/bin/bash -eux

time (
    set -x
    set -e
    git clean -xfd
    use_installed_dotnet_cli=false arch -x86_64 ./build.sh clr+libs+host+packs+mono -configuration release -arch arm64 -cross /p:UseCrossGen2=false
    use_installed_dotnet_cli=false arch -x86_64 ./build.sh libs+host+packs+mono -configuration release -arch arm64 -cross /p:UseCrossGen2=false
    use_installed_dotnet_cli=false arch -x86_64 ./build.sh clr+libs+host+packs+mono -configuration release -arch x86_64 -cross /p:UseCrossGen2=false
    use_installed_dotnet_cli=false arch -x86_64 ./build.sh libs+host+packs+mono -configuration release -arch x86_64 -cross /p:UseCrossGen2=false

    say runtime build completed
) || say runtime build failed
