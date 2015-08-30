#!/bin/bash
# Do not let this script run more than once
is_running=$(ps -ef | grep duplicity  | grep python | wc -l)
if [ $is_running -gt 0 ]; then
    echo "script already running"
        exit 1
fi

# Get containers environment variables stored in /root/env
while read line; do
    declare "$line"
done < /root/env

# Do the backup
duplicity $PARAMS --exclude "**" $SRC $DEST

# Do the clean up
duplicity $PARAMS_CLEAN $DEST
