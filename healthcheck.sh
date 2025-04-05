#!/bin/bash

DURATION=$(</dev/stdin)
if (($DURATION <= 5500)); then
    exit 60
else
    curl --silent --fail audiobookshelf.embassy:13378/healthcheck &>/dev/null
    WEB_RES=$?
    if [ $WEB_RES != 0 ]; then
        echo "Audiobookshelf UI is unreachable, please wait" >&2
        exit 61
    fi
fi
