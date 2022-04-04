#!/bin/sh

if [ $EXTERNAL_SCRIPTS ]
then
    cd /app && \
    node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
    npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))");
fi

node /app/bin/hubot -a $ADAPTER
