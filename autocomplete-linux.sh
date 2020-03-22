#!/usr/bin/env bash

nvdir=$(pwd)

echo "MAKE LIBS DIR"
cd ~
mkdir ycm_build
cd ycm_build

echo "CMAKE GENERATOR: ${nvdir}"
cmake -G "Unix Makefiles" . -DPYTHON_LIBRARY=/usr/local/lib/libpython3.8.so  -DPYTHON_INCLUDE_DIR=/usr/local/include/python3.8  ${nvdir}/plugins/youcompleteme/third_party/ycmd/cpp

echo "CMAKE BUILD: ${nvdir}"
cmake --build . --target ycm_core --config Release

echo "BUILD GO LANG"
cd ${nvdir}/plugins/youcompleteme/third_party/ycmd/third_party/go/src/golang.org/x/tools/cmd/gopls
go build

echo "BUILD TYPE/JAVA SCRIPT SERVER"
cd ${nvdir}/plugins/youcompleteme/third_party/ycmd
npm install -g --prefix third_party/tsserver typescript

echo "BUILD PYTHON SERVER"
cd ${nvdir}/plugins/youcompleteme
python3.8 install.py --go-completer --ts-completer 

echo "DONE"

