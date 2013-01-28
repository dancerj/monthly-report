# Path to Google App Engine development related files; this assumes
# there is a dev_appserver.py symlink to binary in $PATH
GAE_PATH:=$(dir $(realpath $(shell which dev_appserver.py)))

TESTFILES=testSystem.py test_admin_event.py
TESTSTAMP=$(patsubst %.py,%.py-stamp,$(TESTFILES))

all:

clean:
	# clean emacs backup files, python precompiled files, and
	# stamp files.
	rm -f *~ *.pyc *-stamp

check: ${TESTSTAMP}

%.py-stamp: %.py
	PYTHONPATH=${GAE_PATH}:${GAE_PATH}/lib/django_0_96:. \
		python $<
	touch $@ # If test succeeded, update the stamp

# system test depends on everything.
testSystem.py-stamp: testSystem.py $(wildcard *.py) $(wildcard *.html) $(wildcard *.txt)

.PHONY: check