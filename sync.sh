#!/bin/bash

set -e

echo "Job started: $(date)"

if [[ -n "$WEB_SOURCE" ]]; then
    # setup dir
    rm -rf "$DATA_PATH*"

    # download file from web source
    now=`date +%Y-%m-%dT%T`
    wget "$WEB_SOURCE" -O "$DATA_PATH$now.jpeg"
fi

/usr/local/bin/s3cmd sync $PARAMS "$DATA_PATH" "$S3_PATH"

echo "Job finished: $(date)"
