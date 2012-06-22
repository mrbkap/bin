#!/bin/bash

CURRENT=$(pwd)
while [ $CURRENT != '/' ]
do
    if [ -e .git ]; then
        if [ -x "$CURRENT/glue/gonk-ics/out/host/linux-x86/bin/adb" ]; then
            CURRENT="$CURRENT/glue/gonk-ics/out/host/linux-x86/bin/adb"
            break
        fi

        if [ -x "$CURRENT/glue/gonk/out/host/linux-x86/bin/adb" ]; then
            CURRENT="$CURRENT/glue/gonk/out/host/linux-x86/bin/adb"
            break
        fi

        if [ -x "$CURRENT/out/host/linux-x86/bin/adb" ]; then
            CURRENT="$CURRENT/out/host/linux-x86/bin/adb"
            break
        fi
    fi

    CURRENT=$(dirname $CURRENT)
done

if [ $CURRENT == '/' ]; then
    echo "Unable to find adb."
    exit 1
fi

$CURRENT $*
