# Path to Google App Engine development related files; this assumes
# there is a dev_appserver.py symlink to binary in $PATH
GAE_PATH:=$(dir $(realpath $(shell which dev_appserver.py)))

all:

clean:
	rm -f *~ *.pyc # delete emacs backup files.

check:
	PYTHONPATH=${GAE_PATH}:${GAE_PATH}/lib/django_0_96:. \
		python ./testSystem.py

.PHONY: check