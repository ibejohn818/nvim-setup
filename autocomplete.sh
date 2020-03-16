#!/usr/bin/env bash

PWD=pwd

echo "MAKE LIBS DIR"
cd ~
mkdir ycm_build
cd ycm_build

echo "CMAKE GENERATOR"
cmake -G "Unix Makefiles" . ${PWD}/plugins/youcompleteme/third_party/ycmd/cpp

echo "CMAKE BUILD"
cmake --build . --target ycm_core --config Release

echo "BUILD GO LANG"
cd ${PWD}/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls
go build

echo "BUILD TYPE/JAVA SCRIPT SERVER"
cd ${PWD}/third_party/ycmd
npm install -g --prefix third_party/tsserver typescript

echo "BUILD PYTHON SERVER"
cd ${PWD}/plugins/youcompleteme
python install.py --go-completer --ts-completer 

echo "DONE"

