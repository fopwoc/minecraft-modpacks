mkdir -p ./build && cp ./base/{icon.png,instance.cfg} ./build
cp -r ./base/$1/* ./build
cd ./build && \
  packwiz init --mc-version $1 --name "Draft" --quilt-latest --author fopwoc --version 0.0.1  --modloader quilt && \
  packwiz modrinth export
