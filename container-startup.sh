#!/bin/bash

mkdir -p /config
cd /opt/kairosdb/bin

if [ -f /config/kairosdb.properties ]; then
  cp /config/kairosdb.properties ../conf/kairosdb.properties
fi

./kairosdb.sh $@
