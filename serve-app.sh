#!/bin/bash -e

# This script is executed whenever the docker container is (re)started.

#===============================================================================
# debuging
set -x

#===============================================================================

# now serve the app (uses bokeh server in the background)
panel serve test-app \
    --port 5006                 \
    --log-level debug           \
    --allow-websocket-origin "*" \
    --prefix "$BOKEH_PREFIX" \
    --use-xheaders

#===============================================================================

#EOF
