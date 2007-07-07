#!/bin/sh

make -f client.mk checkout
if [ $? -ne 0 ]; then
    echo "checkout failed"
    exit 1
fi

hg addremove
if [ $? -ne 0 ]; then
    echo "addremove failed"
    exit 1
fi

hg commit -m"CVS Sync"
if [ $? -ne 0 ]; then
    echo "committing failed"
    exit 1
fi

hg tag cvs-head
if [ $? -ne 0 ]; then
    echo "tagging failed"
    exit 1
fi

