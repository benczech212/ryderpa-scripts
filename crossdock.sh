#!/bin/sh

# Cross Dock Routing
# WMS -> WES
# Provide ship sorter destination for Container
echo "TEST"
if [ $# -ne 4 ]
then
  echo ""
  echo "Cross Dock Routing"
  echo ""
  echo "usage: $0 <sequence number> <container id> <destination>"
  echo ""
  echo ""
  exit
fi

host=127.0.0.1
port=11111

seq="$1"
container="$2"
destination="$3"

msg="02038|11|${container}|${destination}"
echo "Mock WMS Cross Dock Routing:"
echo "$msg"

client -m "$MSG" --host $host --port $port -proto seq --seqval $seq
