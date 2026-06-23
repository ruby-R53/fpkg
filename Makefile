PREFIX = /usr/local

KERNEL = $(shell uname -s)
ifeq ($(KERNEL),Linux)
	CONFIG=/etc/fpkg
else # it'll likely be a BSD then
	CONFIG=/usr/local/etc/fpkg
endif

ifeq ($(KERNEL),Linux)
	COMPLT=/usr/share
else
	COMPLT=/usr/local/share
endif

install:
	install -m 755 fpkg -t ${PREFIX}/bin/
	mkdir -p ${CONFIG}/
	install bashrc -t ${CONFIG}/
	install fpkg.bashcompletion -t ${COMPLT}/bash-completion/completions/
	mkdir -p ${CONFIG}/modules/
	install modules/* -t ${CONFIG}/modules/
	cp -i fpkg.conf -t ${CONFIG}/

uninstall:
	rm /usr/share/bash-completion/completions/fpkg.bashcompletion
	rm -r /etc/fpkg/
	rm ${PREFIX}/bin/fpkg
