#!/bin/bash

architecture=""
case $(uname -m) in
    x86_64) architecture="amd64" ;;
    arm64) architecture="arm64" ;;
esac

WORKFLOW=tldr.${architecture}.alfredworkflow
status_code=$(curl -O -L --write-out '%{http_code}' --silent https://github.com/konoui/alfred-tldr/releases/latest/download/${WORKFLOW})

if [[ "$status_code" -ne 200 ]] ; then
    echo "error ${status_code}"
else
    open ${WORKFLOW}
fi


