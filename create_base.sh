#!/bin/bash
# $1 - minecraft version
# $2 - quilt version
# $3 - modpack name
# $4 - modpack version

mkdir -p ./build && cp ./base/{icon.png,instance.cfg} ./build
rsync -avu ./base/$1/* ./build --exclude regex

for file in ./base/$1/regex/*; do
  sed "s/MODPACK_NAME/$3 $4/g" $file > ./build/config/yosbr/config/$(basename $file)
done

cd ./build && \
  packwiz init --mc-version $1 --name $3 --modloader quilt --quilt-version $2 --author fopwoc --version $4 && \
  packwiz modrinth export
