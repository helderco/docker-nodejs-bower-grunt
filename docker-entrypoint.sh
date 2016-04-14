#!/bin/bash
set -e

# Change uid and gid of node user so it matches ownership of current dir
if [ -z ${UNMAP_NODE_UID+x} ]; then
    uid=$(stat -c '%u' "$PWD")
    gid=$(stat -c '%g' "$PWD")
    usermod -u $uid node 2> /dev/null && {
      groupmod -g $gid node 2> /dev/null || usermod -a -G $gid node
    }
fi

exec "$@"
