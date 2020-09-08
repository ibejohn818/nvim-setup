#!/usr/bin/env bash
set -e
HWD=$(pwd)
YCM=$HWD/plugins/youcompleteme

echo "MAKE LIBS DIR"
rm -rf ~/ycm_build
cd ~
mkdir ycm_build
cd ycm_build

echo "CMAKE GENERATOR:"
echo $(pwd)
cmake -G "Unix Makefiles" . ${YCM}/third_party/ycmd/cpp 

echo "CMAKE BUILD:"
echo $(pwd)
cmake --build . --target ycm_core --config Release

echo "BUILD GO LANG"
# cd ${HWD}/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls
cd ${YCM}/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls 
go build

echo "BUILD TYPE/JAVA SCRIPT SERVER"
cd ${HWD}/plugins/youcompleteme/third_party/ycmd
npm install -g --prefix third_party/tsserver typescript

echo "BUILD PYTHON SERVER"
cd ${HWD}/plugins/youcompleteme
/opt/local/bin/python install.py --go-completer --ts-completer --clangd-completer

echo "DONE"

