#!/bin/bash
# Requires dev_appserver.py to be in the path.

GAE_PATH=$(dirname $(readlink -f $(which dev_appserver.py)))

PYTHONPATH=$GAE_PATH:$GAE_PATH/lib/django/:. python ./testSystem.py

