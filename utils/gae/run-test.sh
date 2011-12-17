#!/bin/bash
# Requires dev_appserver.py to be in the path.

GAE_PATH=$(dirname $(readlink -f $(which dev_appserver.py)))

# Try to force 0.96 for test on more recent appengine SDKs
# e.g. 1.6.1
PYTHONPATH=$GAE_PATH:$GAE_PATH/lib/django_0_96:. python ./testSystem.py

