#!/bin/sh

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sfv $(cd $(dirname $0) && pwd)/${f} ~/${f}
done
