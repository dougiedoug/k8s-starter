#!/bin/bash
cmd='/bin/sh'
if [[ $# > 1 ]]; then
    echo $*
    cmd=$*
fi

docker run -p 5678:5678 -e DB_TYPE=$DB_TYPE -e DB_HOST=$DB_HOST --rm -it cloudeyes/sample-service $cmd
