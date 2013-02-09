# Path to Google App Engine development related files; this assumes
# there is a dev_appserver.py symlink to binary in $PATH
GAE_PATH:=$(dir $(realpath $(shell which dev_appserver.py)))

all:

clean:
	# clean emacs backup files, python precompiled files, and
	# stamp files.
	rm -f *~ *.pyc *-stamp

check: 
	set -e; for A in test*.py; do \
		PYTHONPATH=${GAE_PATH}:${GAE_PATH}/lib/django_0_96:. \
		python $$A; \
	done


.PHONY: check