#!/bin/bash
# $1 - minecraft version
# $2 - quilt version
# $3 - modpack name
# $4 - modpack version
set -e

[ -e "./build" ] && rm -rf "./build"

mkdir "./build" && cp ./base/{icon.png,instance.cfg} "./build" && \
  rsync -avu "./base/$1/" "./build" --exclude regex

for file in ./base/$1/regex/*; do
  sed "s/MODPACK_NAME/$3 $1-$4/g" "$file" > "./build/config/yosbr/config/$(basename "$file")"
done

cd "./build" && \
  packwiz init -y  \
    --mc-version "$1" \
    --name "$(echo "$3" | tr -d '\\')" \
    --modloader quilt \
    --quilt-version "$2" \
    --author fopwoc \
    --version "$1-$4" && \
  packwiz modrinth export -y

([ -e "../artifacts" ] || mkdir -p "../artifacts") && \
  mv ./*.mrpack ../artifacts
