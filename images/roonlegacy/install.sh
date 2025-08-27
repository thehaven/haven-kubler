#!/bin/bash
mkdir /app && cd /app
if test ! -d RoonServer; then
	echo "Extracting Roon Server from: $ROON_SERVER_PKG"
        tar xjf $ROON_SERVER_PKG
        rm -f $ROON_SERVER_PKG
fi
echo "Starting RoonServer:"
/app/RoonServer/start.sh
