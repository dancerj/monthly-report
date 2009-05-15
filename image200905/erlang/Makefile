.SUFFIXES: .erl .beam .yrl

.erl.beam:
	erlc -W $<

BINDIR?=/usr/lib/erlang/lib/hello-1.0/ebin

ERL = erl -boot start_clean

# compile erlang module list
MODS = hello

all: compile
	${ERL} -noshell -s hello start -s init stop

compile: ${MODS:%=%.beam}

install:
	install -d ${DESTDIR}${BINDIR}
	install -m 644 hello.beam ${DESTDIR}${BINDIR}
	install -m 755 hello.esc  ${DESTDIR}/usr/bin/

clean:
	rm -rf *.beam erl_crash.dump

